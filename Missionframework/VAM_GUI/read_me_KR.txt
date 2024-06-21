차량 형상 관리자 (GUI) by UNIT_normal
GUI를 통해 위장과 구성품을 바꿀 수 있습니다.
VAM은 대부분의 바닐라, 모드 차량들을 지원합니다.
예외처리를 하여 커스텀 텍스쳐를 적용하는 것이 가능합니다.

알려진 문제들
- 몇몇 구성품들이 서로 연결되어 있음. BI가 바꾸기 전까지 단독 적용 등은 불가.
- 몇몇 구성품들은 서로 호환되지 않음. BI가 바꾸기 전까지 동시 적용 등은 불가.
- 리셋 시 기본 값이 없을 시 변화 없음.

설치
1. VAM 폴더를 미션폴더에 넣기
2. stringtable.xml을 넣거나 내용물을 기존에 있던 것에 삽입
3. init.sqf에 다음 줄 삽입
[] execVM "VAM_GUI\VAM_GUI_init.sqf";
4. description.ext에 다음 줄 삽입
#include "VAM_GUI\defines.hpp"
#include "VAM_GUI\VAM_GUI_controls.hpp"
#include "VAM_GUI\VAM_GUI_classes.hpp"

옵션
- VAM_GUI_init.sqf에서 각종 옵션 활성화 가능

변경내역
1.0
공개
1.10
마리드 구형과 신형 버그 픽스 (구형은 신형으로 대체하십시오)
1.11
리스트 글자 크기 조정
1.12
리버레이션 FOB 체크 기능 사용가능
1.20
Hummingbird/Pawnee, Blackfoot, Orca 히든 텍스쳐 옵션 추가
1.21
구성품 리스트에서 화살표 아래키로 마지막 이하로 내려가려고 할때 나오는 에러 픽스
1.22
액션 방법 변경, UGV RCWS 버그 픽스, fnc_VAM_variable_cleaner 추가
1.3
컨디션 체크 옵션 추가
1.31, 1.32
마이너 체인지
1.40
액션 매커니즘 변경
1.41
로컬리티 문제 해결, 기타 발동조건 변경

고마운 곳들
디시인사이드 아르마(ARMA) 마이너 갤러리 (테스트 협조)
JLD 서버 (서버 상 테스트)