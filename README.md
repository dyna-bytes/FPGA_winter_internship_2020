# FPGA_winter_internship_2020
FPGA 동계 인턴쉽 원은일 교수님

Week 1~2 :
Verilog HDL의 기초적인 내용을 학습합니다.

Week 3 :
VHDL의 기초적인 내용을 학습합니다.
CMB ctrl VHDL 코드의 [VHDL to Verilog HDL로의 converting project]를 시작합니다.




---------------------------------------------------------------------------------------------------------------------
- [Verilog HDL Study]
----------------------------------------------------------------------------------------------------------------------
12/22(화) 
- vivado 설치
- 계획 및 진행방향 논의
- EDAplayground example 진행
--------------------------------------------------------------
12/23(수) 
- 전물실 강의자료 [FPGA_01, FPGA_02] 학습
- inverter 보드 실습 
- lgates 보드 실습
과제 : 가이드북 [Verilog HDL] 3장, 4장 공부
--------------------------------------------------------------
12/24(목)
- 전물실 강의자료 [FPGA_03] 학습
- 불 대수, 진리표 작성법, 카르노 맵을 포함한 수학 공부
- encoder 모듈 및 테스트벤치 설계
- decoder 모듈 및 테스트벤치 설계
- half adder, full adder, ripple carry adder 모듈 및 테스트벤치 설계
- github 개설 : https://github.com/jihyuk1023/FPGA_winter_internship_2020
과제 : 가이드북 [Verilog HDL] 5장, 6장 공부
------------------------------------------------------------
12/28(월)
- 가이드북 [Verilog HDL] 5장 순차회로 학습
- SR latch, D latch, D flipflop, Enable flipflop, Resettable flipflop, Regiset 모듈 및 테스트벤치 설계
- 각 모듈을 
(1) 회로도를 보고 기본소자를 조합하여 만드는 방법과 
(2) 베릴로그 문법 및 합성기의 최적화 기능을 이용하는 방법으로 
각각 설계함
- 앞으로 재사용 가능한 테스트벤치 설계

-----------------------------------------------------------
12/29(화)
- 가이드북 [Verilog HDL] 5장 순차회로(FSM) 학습
- state diagram, state transition table, FSM design(status register, next state logic, output logic) 학습
- 2 bit upcount의 FSM 설계 및 베릴로그 코드 및 테스트벤치 구현
- 신호등 제어기의 FSM 설계 및 베릴로그 코드 및 테스트벤치 구현
- shift register의 회로도 설계 및 베릴로그 코드 구현(직렬-직렬, 직렬-병렬, 병렬-직렬) 및 테스트벤치

-----------------------------------------------------------
12/30(수)
- 가이드북 [Verilog HDL] 7장 IC를 이용한 디지털 설계 실습 학습
- 한 자리수 세그먼트 디코더의 블록 다이어그램, 진리표, 회로 설계, 베릴로그 코드 및 테스트벤치 구현
- 벤딩머신 제어기의 블록 다이어그램, 상태도, 진리표, 상태 전이표, 카르노맵, 회로 설계, 베릴로그 코드 및 테스트벤치 구현

-----------------------------------------------------------
12/31(목)
- 여섯 자리수 세그먼트 디스플레이 컨트롤러의 베릴로그 코드 설계 및 테스트벤치 구현
- 스톱워치의 베릴로그 코드 설계 및 테스트벤치 구현

-----------------------------------------------------------
1/4(월)
- 전물실 강의자료 [FPGA_04, FPGA_05] 학습
- 4-bit Ripple Carry Counter의  FPGA 보드 매핑(정상작동 확인)
- ScanDisplay의 FPGA 보드 매핑(정상작동 확인)
- mdisplay의  FPGA 보드 매핑(정상작동 확인)

-----------------------------------------------------------
1/5(화)
- CMB ctrl VHDL 코드 인계 및 전체적인 개괄 파악
- 100MHz to 1Hz 카운터 베릴로그 코드 구현 및 FPGA 보드 매핑(정상작동 확인)
- 신호등의 FPGA 보드 매핑(정상작동 확인)
- 자판기의 FPGA 보드 매핑(정상작동 확인)
- 스톱워치의 FPGA 보드 매핑(개선 및 수정 필요)

-----------------------------------------------------------
1/6(수)
- 버튼 디바운서 모듈 베릴로그 코드 구현
- 버튼 엣지 트리거 모듈 베릴로그 코드 구현
- 스톱워치의 FPGA 보드 매핑(정상작동 확인)
- VHDL 기본 개념 스터디 시작

---------------------------------------------------------------------------------------------------------------------- [VHDL Study]

---------------------------------------------------------------------------------------------------------------------

1/7(목)
- VHDL 프로그래밍의 기본 구조, 기본 문법 및 데이터형 공부
- 블로그 https://m.blog.naver.com/PostList.nhn?blogId=ansdbtls4067&categoryNo=40&logCode=0 를 가이드로 참고함

-----------------------------------------------------------
1/8(금)
- VHDL 기본 프로그래밍 스터디 완료
- Mux & Demux
- Encoder & Decoder
- Half Adder & Full Adder
- RS, D, JK, T Flip-Flop
- FSM(Moore & Mealy Machine)
- 8 bit up-down counter, 동기/비동기 카운터, 활성/비활성 카운터, 동기/비동기 10진 카운터, 분주회로 VHDL 코드 설계 및 테스트벤치 구현

---------------------------------------------------------------------------------------------------------------------- [Main Project]

---------------------------------------------------------------------------------------------------------------------

1/11(월)
- CMB ctrl 중 카운터 부분을 모듈화하여 VHDL로 재설계함
- package, function, generic 등의 VHDL 문법을 활용하여 코드 간소화

-----------------------------------------------------------
1/12(화)
- CMB ctrl 중 FSM 부분을 모듈화하여 VHDL로 재설계함

-----------------------------------------------------------
1/13(수)
- CMB ctrl 중 Increment angle counter for 7-segment display, 7-segment display output by multiplexing, 8 LED counter from 1Hz signal 부분을 모듈화하여 VHDL로 재설계함

-----------------------------------------------------------
1/14(목)
- CMB ctrl의 모듈화를 통합하고
- CMB ctrl 테스트벤치 결과 확인함
- 통합 시 나타난 일부 에러 수정

-----------------------------------------------------------
1/19(화)
- CMB ctrl 베릴로그로 컨버팅 진행
- 카운터 모듈 수정

-----------------------------------------------------------
1/20(수)
- 나머지 모듈 컨버팅 진행

------------------------------------------------------------
1/25(월)
- CMB_ctrl의 VHDL to Verilog 컨버팅 완료
