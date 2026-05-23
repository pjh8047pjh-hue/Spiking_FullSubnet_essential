#include "xil_cache.h"
#include "xil_io.h"
#include "xil_types.h"

#define HLS_BASEADDR        0x40000000U
#define DMA0_BASEADDR       0x41E00000U
#define DMA1_BASEADDR       0x41E10000U

#define RESULT_ADDR         0x1FE00000U
#define WEIGHTS_ADDR        0x10000000U
#define NOISY_ADDR          0x10200000U
#define FB_ADDR             0x10210000U
#define DF_OUT_ADDR         0x10220000U

#define NUM_FRAMES          4U
#define FFT_BINS            256U
#define DF_PER_FRAME        1152U
#define WEIGHT_WORDS_256    43031U

#define INPUT_SAMPLES       (NUM_FRAMES * FFT_BINS)
#define OUTPUT_SAMPLES      (NUM_FRAMES * DF_PER_FRAME)
#define INPUT_BYTES         (INPUT_SAMPLES * 2U)
#define OUTPUT_BYTES        (OUTPUT_SAMPLES * 2U)
#define WEIGHT_BYTES        (WEIGHT_WORDS_256 * 32U)

#define HLS_AP_CTRL         0x00U
#define HLS_WEIGHTS         0x10U
#define HLS_NUM_FRAMES      0x18U
#define HLS_RESET_STATE     0x20U

#define DMA_MM2S_DMACR      0x00U
#define DMA_MM2S_DMASR      0x04U
#define DMA_MM2S_SA         0x18U
#define DMA_MM2S_LENGTH     0x28U
#define DMA_S2MM_DMACR      0x30U
#define DMA_S2MM_DMASR      0x34U
#define DMA_S2MM_DA         0x48U
#define DMA_S2MM_LENGTH     0x58U

#define DMA_CR_RUNSTOP      0x00000001U
#define DMA_CR_RESET        0x00000004U
#define DMA_SR_HALTED       0x00000001U
#define DMA_SR_IDLE         0x00000002U
#define DMA_SR_ERR_MASK     0x00000070U
#define DMA_SR_IOC_IRQ      0x00001000U
#define DMA_SR_CLEAR_MASK   0x00007000U

#define HLS_CTRL_START      0x00000001U
#define HLS_CTRL_DONE       0x00000002U
#define HLS_CTRL_IDLE       0x00000004U

#define RESULT_MAGIC        0x51563130U
#define RESULT_PASS         0U
#define RESULT_ERR_DMA_RESET      1U
#define RESULT_ERR_DMA_TIMEOUT    2U
#define RESULT_ERR_DMA_STATUS     3U
#define RESULT_ERR_HLS_TIMEOUT    4U
#define RESULT_ERR_OUTPUT_VALUE   5U
#define RESULT_ERR_PRECHECK       6U

#define POLL_LIMIT          200000000U

typedef struct {
  u32 magic;
  u32 status;
  u32 stage;
  u32 frames;
  u32 input_bytes;
  u32 output_bytes;
  u32 weight_bytes;
  u32 hls_ctrl;
  u32 dma0_mm2s_sr;
  u32 dma0_s2mm_sr;
  u32 dma1_mm2s_sr;
  u32 poll_count;
  u32 mismatches;
  u32 first_mismatch_index;
  u32 first_actual;
  u32 first_expected;
  u32 output_nonzero_count;
  u32 output_xor;
} SelftestResult;

static volatile SelftestResult* const g_result = (volatile SelftestResult*)RESULT_ADDR;

static void publish_result(void) {
  Xil_DCacheFlushRange((UINTPTR)RESULT_ADDR, sizeof(SelftestResult));
}

static void set_stage(u32 stage) {
  g_result->stage = stage;
  g_result->hls_ctrl = Xil_In32(HLS_BASEADDR + HLS_AP_CTRL);
  g_result->dma0_mm2s_sr = Xil_In32(DMA0_BASEADDR + DMA_MM2S_DMASR);
  g_result->dma0_s2mm_sr = Xil_In32(DMA0_BASEADDR + DMA_S2MM_DMASR);
  g_result->dma1_mm2s_sr = Xil_In32(DMA1_BASEADDR + DMA_MM2S_DMASR);
  publish_result();
}

static void fail(u32 status) {
  g_result->status = status;
  set_stage(0xE0000000U | status);
  while (1) {
  }
}

static u32 lcg_next(u32* state) {
  *state = (*state * 1664525U) + 1013904223U;
  return *state;
}

static void fill_buffers(void) {
  volatile u32* weights = (volatile u32*)WEIGHTS_ADDR;
  volatile u16* noisy = (volatile u16*)NOISY_ADDR;
  volatile u16* fb = (volatile u16*)FB_ADDR;
  volatile u16* out = (volatile u16*)DF_OUT_ADDR;
  u32 i;
  u32 state = 0x31415926U;

  for (i = 0; i < (WEIGHT_BYTES / 4U); ++i) {
    weights[i] = 0U;
  }

  for (i = 0; i < INPUT_SAMPLES; ++i) {
    noisy[i] = (u16)(lcg_next(&state) >> 16);
  }
  for (i = 0; i < INPUT_SAMPLES; ++i) {
    fb[i] = (u16)(lcg_next(&state) >> 16);
  }
  for (i = 0; i < OUTPUT_SAMPLES; ++i) {
    out[i] = 0xA55AU;
  }

  Xil_DCacheFlushRange((UINTPTR)WEIGHTS_ADDR, WEIGHT_BYTES);
  Xil_DCacheFlushRange((UINTPTR)NOISY_ADDR, INPUT_BYTES);
  Xil_DCacheFlushRange((UINTPTR)FB_ADDR, INPUT_BYTES);
  Xil_DCacheFlushRange((UINTPTR)DF_OUT_ADDR, OUTPUT_BYTES);
}

static int dma_reset_one(u32 base, int has_s2mm) {
  u32 poll;
  Xil_Out32(base + DMA_MM2S_DMACR, DMA_CR_RESET);
  if (has_s2mm) {
    Xil_Out32(base + DMA_S2MM_DMACR, DMA_CR_RESET);
  }
  for (poll = 0; poll < POLL_LIMIT; ++poll) {
    const u32 mm2s_cr = Xil_In32(base + DMA_MM2S_DMACR);
    const u32 s2mm_cr = has_s2mm ? Xil_In32(base + DMA_S2MM_DMACR) : 0U;
    if (((mm2s_cr & DMA_CR_RESET) == 0U) && (!has_s2mm || ((s2mm_cr & DMA_CR_RESET) == 0U))) {
      return 0;
    }
  }
  return -1;
}

static void dma_clear_irqs(void) {
  Xil_Out32(DMA0_BASEADDR + DMA_MM2S_DMASR, DMA_SR_CLEAR_MASK);
  Xil_Out32(DMA0_BASEADDR + DMA_S2MM_DMASR, DMA_SR_CLEAR_MASK);
  Xil_Out32(DMA1_BASEADDR + DMA_MM2S_DMASR, DMA_SR_CLEAR_MASK);
}

static void start_s2mm(u32 base, u32 dst_addr, u32 byte_count) {
  Xil_Out32(base + DMA_S2MM_DMACR, DMA_CR_RUNSTOP);
  Xil_Out32(base + DMA_S2MM_DA, dst_addr);
  Xil_Out32(base + DMA_S2MM_LENGTH, byte_count);
}

static void start_mm2s(u32 base, u32 src_addr, u32 byte_count) {
  Xil_Out32(base + DMA_MM2S_DMACR, DMA_CR_RUNSTOP);
  Xil_Out32(base + DMA_MM2S_SA, src_addr);
  Xil_Out32(base + DMA_MM2S_LENGTH, byte_count);
}

static int wait_for_done(void) {
  u32 poll;
  for (poll = 0; poll < POLL_LIMIT; ++poll) {
    const u32 dma0_mm2s = Xil_In32(DMA0_BASEADDR + DMA_MM2S_DMASR);
    const u32 dma0_s2mm = Xil_In32(DMA0_BASEADDR + DMA_S2MM_DMASR);
    const u32 dma1_mm2s = Xil_In32(DMA1_BASEADDR + DMA_MM2S_DMASR);
    const u32 hls_ctrl = Xil_In32(HLS_BASEADDR + HLS_AP_CTRL);

    g_result->poll_count = poll;
    g_result->hls_ctrl = hls_ctrl;
    g_result->dma0_mm2s_sr = dma0_mm2s;
    g_result->dma0_s2mm_sr = dma0_s2mm;
    g_result->dma1_mm2s_sr = dma1_mm2s;

    if (((dma0_mm2s | dma0_s2mm | dma1_mm2s) & DMA_SR_ERR_MASK) != 0U) {
      return RESULT_ERR_DMA_STATUS;
    }
    if (((dma0_mm2s & DMA_SR_IDLE) != 0U) &&
        ((dma0_s2mm & DMA_SR_IDLE) != 0U) &&
        ((dma1_mm2s & DMA_SR_IDLE) != 0U) &&
        ((dma0_s2mm & DMA_SR_IOC_IRQ) != 0U) &&
        ((hls_ctrl & HLS_CTRL_DONE) != 0U)) {
      return RESULT_PASS;
    }
  }
  return RESULT_ERR_DMA_TIMEOUT;
}

static int verify_zero_output(void) {
  volatile u16* out = (volatile u16*)DF_OUT_ADDR;
  u32 i;
  u32 nonzero = 0U;
  u32 x = 0U;

  Xil_DCacheInvalidateRange((UINTPTR)DF_OUT_ADDR, OUTPUT_BYTES);
  for (i = 0; i < OUTPUT_SAMPLES; ++i) {
    const u32 actual = (u32)out[i];
    x ^= actual;
    if (actual != 0U) {
      if (nonzero == 0U) {
        g_result->first_mismatch_index = i;
        g_result->first_actual = actual;
        g_result->first_expected = 0U;
      }
      ++nonzero;
    }
  }

  g_result->mismatches = nonzero;
  g_result->output_nonzero_count = nonzero;
  g_result->output_xor = x;
  return (nonzero == 0U) ? RESULT_PASS : RESULT_ERR_OUTPUT_VALUE;
}

int main(void) {
  u32 status;
  u32 readback;

  g_result->magic = RESULT_MAGIC;
  g_result->status = 0xFFFFFFFFU;
  g_result->stage = 0U;
  g_result->frames = NUM_FRAMES;
  g_result->input_bytes = INPUT_BYTES;
  g_result->output_bytes = OUTPUT_BYTES;
  g_result->weight_bytes = WEIGHT_BYTES;
  g_result->mismatches = 0U;
  g_result->first_mismatch_index = 0xFFFFFFFFU;
  g_result->first_actual = 0U;
  g_result->first_expected = 0U;
  g_result->output_nonzero_count = 0U;
  g_result->output_xor = 0U;
  publish_result();

  Xil_DCacheDisable();
  set_stage(1U);

  fill_buffers();
  set_stage(2U);

  if (dma_reset_one(DMA0_BASEADDR, 1) != 0 || dma_reset_one(DMA1_BASEADDR, 0) != 0) {
    fail(RESULT_ERR_DMA_RESET);
  }
  dma_clear_irqs();
  set_stage(3U);

  Xil_Out32(HLS_BASEADDR + HLS_WEIGHTS, WEIGHTS_ADDR);
  Xil_Out32(HLS_BASEADDR + HLS_NUM_FRAMES, NUM_FRAMES);
  Xil_Out32(HLS_BASEADDR + HLS_RESET_STATE, 1U);
  readback = Xil_In32(HLS_BASEADDR + HLS_NUM_FRAMES);
  if (readback != NUM_FRAMES) {
    fail(RESULT_ERR_PRECHECK);
  }
  set_stage(4U);

  start_s2mm(DMA0_BASEADDR, DF_OUT_ADDR, OUTPUT_BYTES);
  Xil_Out32(HLS_BASEADDR + HLS_AP_CTRL, HLS_CTRL_START);
  start_mm2s(DMA0_BASEADDR, NOISY_ADDR, INPUT_BYTES);
  start_mm2s(DMA1_BASEADDR, FB_ADDR, INPUT_BYTES);
  set_stage(5U);

  status = wait_for_done();
  if (status != RESULT_PASS) {
    fail(status);
  }
  set_stage(6U);

  status = verify_zero_output();
  if (status != RESULT_PASS) {
    fail(status);
  }

  g_result->status = RESULT_PASS;
  set_stage(0xBEEFBEEFU);
  while (1) {
  }
}
