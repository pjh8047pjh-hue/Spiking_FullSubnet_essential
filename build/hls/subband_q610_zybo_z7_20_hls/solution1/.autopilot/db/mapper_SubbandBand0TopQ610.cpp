#include "hls_signal_handler.h"
#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
using hls::sim::Byte;
extern "C" void SubbandBand0TopQ610(Byte<2>*, Byte<2>*, Byte<2>*, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int);
extern "C" void apatb_SubbandBand0TopQ610_hw(volatile void * __xlx_apatb_param_noisy_input_q610, volatile void * __xlx_apatb_param_fb_output_q610, volatile void * __xlx_apatb_param_layer0_weight_ih_q610, volatile void * __xlx_apatb_param_layer0_weight_hh_q610, volatile void * __xlx_apatb_param_layer0_bias_ih_q610, volatile void * __xlx_apatb_param_layer0_bn_mul_q610, volatile void * __xlx_apatb_param_layer0_bn_add_q610, volatile void * __xlx_apatb_param_layer1_weight_ih_q610, volatile void * __xlx_apatb_param_layer1_weight_hh_q610, volatile void * __xlx_apatb_param_layer1_bias_ih_q610, volatile void * __xlx_apatb_param_layer1_bn_mul_q610, volatile void * __xlx_apatb_param_layer1_bn_add_q610, volatile void * __xlx_apatb_param_proj_weight_q610, volatile void * __xlx_apatb_param_proj_bias_q610, volatile void * __xlx_apatb_param_df_coef_q610) {
using hls::sim::createStream;
  // Collect __xlx_noisy_input_q610_fb_output_q610__tmp_vec
std::vector<Byte<2>> __xlx_noisy_input_q610_fb_output_q610__tmp_vec;
for (size_t i = 0; i < 618240; ++i){
__xlx_noisy_input_q610_fb_output_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_noisy_input_q610)[i]);
}
  int __xlx_size_param_noisy_input_q610 = 618240;
  int __xlx_offset_param_noisy_input_q610 = 0;
  int __xlx_offset_byte_param_noisy_input_q610 = 0*2;
for (size_t i = 0; i < 618240; ++i){
__xlx_noisy_input_q610_fb_output_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_fb_output_q610)[i]);
}
  int __xlx_size_param_fb_output_q610 = 618240;
  int __xlx_offset_param_fb_output_q610 = 618240;
  int __xlx_offset_byte_param_fb_output_q610 = 618240*2;
  // Collect __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec
std::vector<Byte<2>> __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec;
for (size_t i = 0; i < 8512; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer0_weight_ih_q610)[i]);
}
  int __xlx_size_param_layer0_weight_ih_q610 = 8512;
  int __xlx_offset_param_layer0_weight_ih_q610 = 0;
  int __xlx_offset_byte_param_layer0_weight_ih_q610 = 0*2;
for (size_t i = 0; i < 50176; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer0_weight_hh_q610)[i]);
}
  int __xlx_size_param_layer0_weight_hh_q610 = 50176;
  int __xlx_offset_param_layer0_weight_hh_q610 = 8512;
  int __xlx_offset_byte_param_layer0_weight_hh_q610 = 8512*2;
for (size_t i = 0; i < 448; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer0_bias_ih_q610)[i]);
}
  int __xlx_size_param_layer0_bias_ih_q610 = 448;
  int __xlx_offset_param_layer0_bias_ih_q610 = 58688;
  int __xlx_offset_byte_param_layer0_bias_ih_q610 = 58688*2;
for (size_t i = 0; i < 224; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer0_bn_mul_q610)[i]);
}
  int __xlx_size_param_layer0_bn_mul_q610 = 224;
  int __xlx_offset_param_layer0_bn_mul_q610 = 59136;
  int __xlx_offset_byte_param_layer0_bn_mul_q610 = 59136*2;
for (size_t i = 0; i < 224; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer0_bn_add_q610)[i]);
}
  int __xlx_size_param_layer0_bn_add_q610 = 224;
  int __xlx_offset_param_layer0_bn_add_q610 = 59360;
  int __xlx_offset_byte_param_layer0_bn_add_q610 = 59360*2;
for (size_t i = 0; i < 50176; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer1_weight_ih_q610)[i]);
}
  int __xlx_size_param_layer1_weight_ih_q610 = 50176;
  int __xlx_offset_param_layer1_weight_ih_q610 = 59584;
  int __xlx_offset_byte_param_layer1_weight_ih_q610 = 59584*2;
for (size_t i = 0; i < 50176; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer1_weight_hh_q610)[i]);
}
  int __xlx_size_param_layer1_weight_hh_q610 = 50176;
  int __xlx_offset_param_layer1_weight_hh_q610 = 109760;
  int __xlx_offset_byte_param_layer1_weight_hh_q610 = 109760*2;
for (size_t i = 0; i < 448; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer1_bias_ih_q610)[i]);
}
  int __xlx_size_param_layer1_bias_ih_q610 = 448;
  int __xlx_offset_param_layer1_bias_ih_q610 = 159936;
  int __xlx_offset_byte_param_layer1_bias_ih_q610 = 159936*2;
for (size_t i = 0; i < 224; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer1_bn_mul_q610)[i]);
}
  int __xlx_size_param_layer1_bn_mul_q610 = 224;
  int __xlx_offset_param_layer1_bn_mul_q610 = 160384;
  int __xlx_offset_byte_param_layer1_bn_mul_q610 = 160384*2;
for (size_t i = 0; i < 224; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_layer1_bn_add_q610)[i]);
}
  int __xlx_size_param_layer1_bn_add_q610 = 224;
  int __xlx_offset_param_layer1_bn_add_q610 = 160608;
  int __xlx_offset_byte_param_layer1_bn_add_q610 = 160608*2;
for (size_t i = 0; i < 8960; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_proj_weight_q610)[i]);
}
  int __xlx_size_param_proj_weight_q610 = 8960;
  int __xlx_offset_param_proj_weight_q610 = 160832;
  int __xlx_offset_byte_param_proj_weight_q610 = 160832*2;
for (size_t i = 0; i < 40; ++i){
__xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_proj_bias_q610)[i]);
}
  int __xlx_size_param_proj_bias_q610 = 40;
  int __xlx_offset_param_proj_bias_q610 = 169792;
  int __xlx_offset_byte_param_proj_bias_q610 = 169792*2;
  // Collect __xlx_df_coef_q610__tmp_vec
std::vector<Byte<2>> __xlx_df_coef_q610__tmp_vec;
for (size_t i = 0; i < 772800; ++i){
__xlx_df_coef_q610__tmp_vec.push_back(((Byte<2>*)__xlx_apatb_param_df_coef_q610)[i]);
}
  int __xlx_size_param_df_coef_q610 = 772800;
  int __xlx_offset_param_df_coef_q610 = 0;
  int __xlx_offset_byte_param_df_coef_q610 = 0*2;
  // DUT call
  SubbandBand0TopQ610(__xlx_noisy_input_q610_fb_output_q610__tmp_vec.data(), __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec.data(), __xlx_df_coef_q610__tmp_vec.data(), __xlx_offset_byte_param_noisy_input_q610, __xlx_offset_byte_param_fb_output_q610, __xlx_offset_byte_param_layer0_weight_ih_q610, __xlx_offset_byte_param_layer0_weight_hh_q610, __xlx_offset_byte_param_layer0_bias_ih_q610, __xlx_offset_byte_param_layer0_bn_mul_q610, __xlx_offset_byte_param_layer0_bn_add_q610, __xlx_offset_byte_param_layer1_weight_ih_q610, __xlx_offset_byte_param_layer1_weight_hh_q610, __xlx_offset_byte_param_layer1_bias_ih_q610, __xlx_offset_byte_param_layer1_bn_mul_q610, __xlx_offset_byte_param_layer1_bn_add_q610, __xlx_offset_byte_param_proj_weight_q610, __xlx_offset_byte_param_proj_bias_q610, __xlx_offset_byte_param_df_coef_q610);
// print __xlx_apatb_param_noisy_input_q610
for (size_t i = 0; i < __xlx_size_param_noisy_input_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_noisy_input_q610)[i] = __xlx_noisy_input_q610_fb_output_q610__tmp_vec[__xlx_offset_param_noisy_input_q610+i];
}
// print __xlx_apatb_param_fb_output_q610
for (size_t i = 0; i < __xlx_size_param_fb_output_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_fb_output_q610)[i] = __xlx_noisy_input_q610_fb_output_q610__tmp_vec[__xlx_offset_param_fb_output_q610+i];
}
// print __xlx_apatb_param_layer0_weight_ih_q610
for (size_t i = 0; i < __xlx_size_param_layer0_weight_ih_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer0_weight_ih_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer0_weight_ih_q610+i];
}
// print __xlx_apatb_param_layer0_weight_hh_q610
for (size_t i = 0; i < __xlx_size_param_layer0_weight_hh_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer0_weight_hh_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer0_weight_hh_q610+i];
}
// print __xlx_apatb_param_layer0_bias_ih_q610
for (size_t i = 0; i < __xlx_size_param_layer0_bias_ih_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer0_bias_ih_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer0_bias_ih_q610+i];
}
// print __xlx_apatb_param_layer0_bn_mul_q610
for (size_t i = 0; i < __xlx_size_param_layer0_bn_mul_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer0_bn_mul_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer0_bn_mul_q610+i];
}
// print __xlx_apatb_param_layer0_bn_add_q610
for (size_t i = 0; i < __xlx_size_param_layer0_bn_add_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer0_bn_add_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer0_bn_add_q610+i];
}
// print __xlx_apatb_param_layer1_weight_ih_q610
for (size_t i = 0; i < __xlx_size_param_layer1_weight_ih_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer1_weight_ih_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer1_weight_ih_q610+i];
}
// print __xlx_apatb_param_layer1_weight_hh_q610
for (size_t i = 0; i < __xlx_size_param_layer1_weight_hh_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer1_weight_hh_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer1_weight_hh_q610+i];
}
// print __xlx_apatb_param_layer1_bias_ih_q610
for (size_t i = 0; i < __xlx_size_param_layer1_bias_ih_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer1_bias_ih_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer1_bias_ih_q610+i];
}
// print __xlx_apatb_param_layer1_bn_mul_q610
for (size_t i = 0; i < __xlx_size_param_layer1_bn_mul_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer1_bn_mul_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer1_bn_mul_q610+i];
}
// print __xlx_apatb_param_layer1_bn_add_q610
for (size_t i = 0; i < __xlx_size_param_layer1_bn_add_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_layer1_bn_add_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_layer1_bn_add_q610+i];
}
// print __xlx_apatb_param_proj_weight_q610
for (size_t i = 0; i < __xlx_size_param_proj_weight_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_proj_weight_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_proj_weight_q610+i];
}
// print __xlx_apatb_param_proj_bias_q610
for (size_t i = 0; i < __xlx_size_param_proj_bias_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_proj_bias_q610)[i] = __xlx_layer0_weight_ih_q610_layer0_weight_hh_q610_layer0_bias_ih_q610_layer0_bn_mul_q610_layer0_bn_add_q610_layer1_weight_ih_q610_layer1_weight_hh_q610_layer1_bias_ih_q610_layer1_bn_mul_q610_layer1_bn_add_q610_proj_weight_q610_proj_bias_q610__tmp_vec[__xlx_offset_param_proj_bias_q610+i];
}
// print __xlx_apatb_param_df_coef_q610
for (size_t i = 0; i < __xlx_size_param_df_coef_q610; ++i) {
((Byte<2>*)__xlx_apatb_param_df_coef_q610)[i] = __xlx_df_coef_q610__tmp_vec[__xlx_offset_param_df_coef_q610+i];
}
}
