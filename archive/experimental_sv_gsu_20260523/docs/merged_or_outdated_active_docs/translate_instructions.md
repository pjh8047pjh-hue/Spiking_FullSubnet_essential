Python → C++ 변환 가이드
목적
본 가이드는 Python 기반 subband/GSUCell/관련 연산 블록을 C++로 변환할 때, 이후 Vitis HLS 합성, testbench 작성, IP export, Vivado 통합까지 고려한 형태로 코드를 작성하기 위한 규격이다.
즉, 단순히 “동작하는 C++”가 아니라
**HLS-friendly한 기준 C++**를 만드는 것이 목적이다.
________________________________________
1. 최종 목표
변환된 C++ 코드는 다음 조건을 만족해야 한다.
1.	Python 기준 모델과 수식 의미가 동일할 것 
2.	고정소수점/Q-format 기준이 명확할 것 
3.	HLS 합성 불가능한 요소를 최소화할 것 
4.	testbench와 DUT 분리가 가능할 것 
5.	이후 top function 기반으로 쉽게 리팩토링 가능할 것 
6.	최종적으로 IP export 가능한 구조로 발전 가능할 것 
________________________________________
2. 기본 원칙
2.1 알고리즘 의미 보존
변환 과정에서 바꾸면 안 되는 것
•	연산 순서 
•	gate 계산 방식 
•	threshold 조건 
•	sigmoid/tanh/triangle 등 근사 함수의 의미 
•	BN folding 적용 순서 
•	state update 방식 
•	scaling/Q-format 기준 
즉, 수식 의미는 Python과 동일해야 한다.
2.2 구현 표현은 HLS 친화적으로
바꿔도 되는 것
•	class → function 
•	동적 자료구조 → 고정 배열 
•	파일 입출력 위치 변경 
•	출력 방식 변경 
•	helper 함수 분리 
•	pragma 삽입을 위한 구조 변경 
즉, 알고리즘은 유지하고, 코드 표현만 HLS 친화적으로 바꾼다.
________________________________________
3. 친구가 작성할 C++ 코드의 역할
C++ 코드는 아래 3종류 중 무엇인지 명확히 해야 한다.
3.1 Golden Reference C++
목적:
•	Python과 동일한 수식 검증 
•	floating 또는 fixed 기준 출력 비교 
허용:
•	std::vector 
•	ifstream 
•	iostream 
•	cmath 
비권장:
•	이 코드를 그대로 HLS에 넣는 것 
3.2 HLS-Friendly Reference C++
목적:
•	HLS top function으로 옮기기 쉬운 중간 단계 
•	Python 의미 유지 + HLS 제약 반영 
요구:
•	고정 크기 배열 사용 
•	class 최소화 또는 제거 
•	함수형 구조 
•	동적 메모리 금지 
•	파일 I/O는 testbench로 분리 가능해야 함 
3.3 HLS Synthesizable C++
목적:
•	Vitis HLS에서 synthesis / export 가능 
요구:
•	top function 존재 
•	동적 자료구조 금지 
•	합성 불가 라이브러리 금지 
•	interface 분명 
•	pragma 추가 가능 
친구가 처음부터 만들어야 하는 목표는 3.2에 가깝다.
그러면 네가 3.3으로 넘기기 쉽다.
________________________________________
4. 반드시 지켜야 할 코딩 규칙
4.1 동적 자료구조 사용 금지
금지:
•	std::vector 
•	std::string 
•	new, delete 
•	malloc, free 
•	push_back 
•	insert 
사용:
•	고정 길이 배열 
•	compile-time constant 길이 
예:
const int INPUT_SIZE = 80;
const int HIDDEN_SIZE = 64;
const int GATE_SIZE = 128;

int16_t input[INPUT_SIZE];
int16_t hx[HIDDEN_SIZE];
int16_t cx[HIDDEN_SIZE];
int16_t gates[GATE_SIZE];
________________________________________
4.2 class 기반 구현 지양
금지에 가깝게 취급:
•	상태와 가중치를 모두 클래스 내부에 넣는 구조 
•	constructor에서 메모리 동적 할당 
•	runtime 옵션에 따라 구조가 바뀌는 class 
권장:
•	순수 함수형 구조 
•	입력 배열, 가중치 배열, 출력 배열을 인자로 넘기는 형태 
예:
void gsu_cell_ref(
    const int16_t input[80],
    const int16_t hx[64],
    const int16_t cx[64],
    const int16_t weight_ih[128][80],
    const int16_t weight_hh[128][64],
    const int16_t bias_ih[128],
    const int16_t bn_w[64],
    const int16_t bn_b[64],
    int16_t hy[64],
    int16_t cy[64]
);
________________________________________
4.3 파일 입출력은 DUT 내부 금지
금지:
•	DUT/핵심 연산 함수 안에서 txt 읽기 
•	함수 내부에서 weight 파일 열기 
•	함수 내부 print/log 남기기 
허용:
•	별도 testbench에서 txt 로드 
•	main/tb에서 입력 준비 후 함수 호출 
즉,
•	연산 함수는 계산만 
•	입출력은 testbench에서 담당 
________________________________________
4.4 입출력 크기는 고정
친구가 Python을 C++로 변환할 때, shape가 이미 정해져 있다면 절대 runtime variable로 만들지 않는다.
예:
•	input_size = 80 
•	hidden_size = 64 
•	shared_weights = false 
•	use_bn = true 
이런 것이 프로젝트에서 고정이면 코드에도 고정으로 반영한다.
금지:
void func(int input_size, int hidden_size, ...)
권장:
const int INPUT_SIZE = 80;
const int HIDDEN_SIZE = 64;
________________________________________
4.5 옵션 분기 최소화
HLS를 생각하면 옵션 분기는 적을수록 좋다.
금지 또는 비권장:
•	if (shared_weights) ... else ... 
•	if (use_bn) ... 
•	if (mode == 0) ... else ... 
권장:
•	실제 사용할 고정 버전만 구현 
•	BN 버전 따로, no-BN 버전 따로 
•	shared_weights 버전 따로, non-shared 버전 따로 
즉 “범용 코드”보다 “이번 프로젝트 전용 고정 스펙 코드”가 낫다.
________________________________________
5. 데이터 타입 규칙
5.1 floating 기준 코드와 fixed 기준 코드를 분리
친구가 코드를 줄 때 아래 2개를 분리해야 한다.
float reference
•	Python과의 1차 검증용 
•	의미 확인용 
fixed/Q-format reference
•	실제 하드웨어 타깃 
•	HLS/IP용 기준 
둘을 한 파일에 섞지 않는다.
________________________________________
5.2 고정소수점 기준 명시
모든 fixed 모델은 문서 최상단에 명확히 적는다.
예:
•	Q6.10 
•	총 16비트 
•	소수부 10비트 
•	1.0 = 1024 
반드시 코드 상단에 선언:
const int Q_FRACT = 10;
const int16_t Q_ONE = 1 << Q_FRACT;
________________________________________
5.3 누산기는 상위 비트 사용
입력/가중치는 16비트여도 누산은 넓혀야 한다.
권장:
•	data: int16_t 
•	accumulator: int32_t 
예:
int32_t sum = 0;
sum += (int32_t)weight * input;
________________________________________
5.4 saturation/clipping 처리 여부 명시
overflow 가능성이 있으면 아래 중 하나를 문서화해야 한다.
•	wrap-around 허용 
•	saturation 사용 
•	현재는 미적용, 이후 HLS 단계에서 추가 예정 
이걸 명시 안 하면 나중에 Python과 오차 원인을 추적하기 어렵다.
________________________________________
6. 함수 구조 규칙
6.1 helper function 분리
다음은 별도 함수로 분리하는 것이 좋다.
•	sigmoid 근사 
•	triangle activation 
•	BN folded apply 
•	MAC block 
•	threshold/spike function 
예:
int16_t hardware_sigmoid_q610(int16_t x);
int16_t spike_gen_q610(int16_t x);
이렇게 분리하면
•	testbench 작성 쉬움 
•	HLS 개별 블록 합성 쉬움 
•	단위 검증 쉬움 
________________________________________
6.2 함수는 한 역할만
좋은 구조:
•	compute_gates() 
•	split_gates() 
•	update_cell() 
•	apply_bn() 
•	generate_spike() 
나쁜 구조:
•	모든 것을 main() 안에 넣기 
•	하나의 giant class method 안에 다 넣기 
________________________________________
6.3 top에 가까운 구조로 작성
친구가 작성하는 C++도 가능하면 top 함수처럼 보이게 만든다.
예:
void gsu_cell_ref(...);
이렇게 하면 네가 나중에 pragma와 interface만 붙여서 HLS top으로 바꾸기 쉽다.
________________________________________
7. Python → C++ 변환 시 필수 문서화 항목
친구는 코드만 주지 말고 아래를 같이 줘야 한다.
7.1 입력/출력 정의
예:
•	input: [80] 
•	hx: [64] 
•	cx: [64] 
•	hy: [64] 
•	cy: [64] 
7.2 weight/bias shape
예:
•	weight_ih[128][80] 
•	weight_hh[128][64] 
•	bias_ih[128] 
•	bn_folded_weight[64] 
•	bn_folded_bias[64] 
7.3 수식 설명
예:
•	forgetgate = gates[0:63] 
•	cellgate = gates[64:127] 
•	sigmoid는 PWL 근사 
•	cy = sig_forget * cx + (1-sig_forget) * cellgate 
•	BN folded 적용 후 hy = (cy >= 0) ? 1 : 0 
7.4 Q-format 설명
예:
•	Q6.10 
•	0.5 = 512 
•	1.0 = 1024 
7.5 Python 검증 결과
예:
•	입력 데이터 
•	Python 출력 
•	C++ 출력 
•	MSE / max error / spike mismatch count 
________________________________________
8. testbench를 쉽게 만들기 위한 작성 규칙
8.1 함수 인자는 단순해야 한다
좋은 예:
void gsu_cell_ref(
    const int16_t input[80],
    const int16_t hx[64],
    const int16_t cx[64],
    ...
    int16_t hy[64],
    int16_t cy[64]
);
나쁜 예:
State forward(const vector<int16_t>& input, const State& state);
왜냐하면 testbench에서 배열 비교가 훨씬 쉽기 때문이다.
________________________________________
8.2 출력은 배열로 직접 받게 한다
반환형으로 struct를 쓰는 것보다 output array 인자가 낫다.
권장:
void func(..., int16_t out[64]);
비권장:
State func(...);
________________________________________
8.3 파일 포맷은 단순하게
txt 파일은 다음 원칙을 따른다.
•	1개 숫자당 1줄 또는 공백 구분 
•	row-major 순서 고정 
•	shape 문서화 
•	Python export 순서와 C++ read 순서 일치 
예:
•	weight_ih.txt: row-major, 총 128*80개 
•	weight_hh.txt: row-major, 총 128*64개 
________________________________________
8.4 deterministic input 사용
테스트용 입력은 반드시 고정한다.
예:
•	all 0.5 
•	all 0 
•	alternating pattern 
•	max/min edge case 
그래야 C++, HLS, RTL 결과 비교가 쉬워진다.
________________________________________
9. HLS를 고려한 금지사항
친구가 넘겨주는 C++에는 아래를 넣지 않는 것이 좋다.
•	STL container 
•	예외 처리 
•	재귀 
•	복잡한 템플릿 
•	가변 크기 배열 
•	동적 메모리 
•	파일 입출력 내장 
•	콘솔 출력 중심 디버깅 
•	runtime shape 변경 
•	의미 없는 범용 옵션화 
________________________________________
10. 권장 파일 구조
친구에게 아래 구조로 제출하라고 하면 좋다.
제출 구조
•	module_ref.h 
•	module_ref.cpp 
•	tb_module_ref.cpp 
•	weights/ 
o	weight_ih.txt 
o	weight_hh.txt 
o	bias_ih.txt 
o	bn_folded_weight.txt 
o	bn_folded_bias.txt 
•	README.md 
________________________________________
11. README에 반드시 들어갈 내용
11.1 블록 설명
예:
•	GSUCell 1 timestep forward, Q6.10 기준 
11.2 입출력 shape
예:
•	input [80] 
•	hx/cx/hy/cy [64] 
11.3 데이터 형식
예:
•	signed int16, Q6.10 
11.4 검증 방법
예:
•	Python 출력과 비교 
•	all-0.5 입력 기준 first 64 outputs 확인 
11.5 구현 제약
예:
•	shared_weights=false 고정 
•	use_bn=true 고정 
________________________________________
12. 친구에게 줄 실제 체크리스트
아래 항목을 모두 만족하면 “잘 만든 변환 코드”라고 보면 된다.
체크리스트
•	Python 수식 의미 그대로 반영했는가 
•	floating 버전과 fixed 버전을 분리했는가 
•	Q-format 정의가 파일 상단에 명시됐는가 
•	입력/출력 shape가 고정됐는가 
•	vector, string, new를 안 썼는가 
•	함수 내부 파일 I/O가 없는가 
•	class 없이 함수형으로 정리됐는가 
•	weight/bias를 배열 입력으로 받을 수 있는가 
•	helper 함수가 적절히 분리됐는가 
•	output을 배열 인자로 받는가 
•	testbench에서 쉽게 호출 가능한가 
•	Python과 비교한 검증 결과가 있는가 
________________________________________
13. 친구에게 직접 전달할 한 줄 요약
“Python을 그냥 C++로 옮기지 말고, 나중에 내가 HLS top 함수로 바로 바꾸기 쉽게 고정 배열 기반의 함수형 C++로 만들어달라.”
________________________________________
14. GSUCell/Subband용 추가 요구사항
이번 프로젝트 기준으로는 아래를 추가로 못 박는 게 좋다.
고정 요구사항
•	input_size = 80 
•	hidden_size = 64 
•	shared_weights = false 
•	use_bn = true 
•	Q6.10 사용 
•	BN은 folding된 파라미터 기준 
•	output spike는 cy >= 0 
권장 구현 단위
친구에게 한 번에 subband 전체를 달라고 하지 말고 아래 순서로 요청한다.
1.	triangle / spike activation 
2.	sigmoid 근사 블록 
3.	single-node GSU update 
4.	full GSUCell 1 timestep 
5.	subband stage 단위 
6.	최종 subband 전체 
이 순서가 네가 HLS/IP까지 가져가기에 가장 좋다.
________________________________________
15. 최종 결론
이 문서의 핵심은 하나다.
친구가 작성할 C++는 “동작만 하는 코드”가 아니라, “HLS로 넘기기 쉬운 기준 코드”여야 한다.
즉,
•	Python 의미 보존 
•	fixed/Q-format 명시 
•	고정 배열 
•	함수형 구조 
•	testbench 분리 용이 
이 5가지를 만족해야 한다.


