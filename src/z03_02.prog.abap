*&---------------------------------------------------------------------*
*& Report Z03_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_02.

DATA: gs_wa TYPE sflight,               "write를 위해 sflight의 요소를 선언 - work area
      gt_itab TYPE TABLE OF sflight.    "sflight의 테이블 구조를 가진 내부 테이블 선언

SELECT carrid connid                    "carrid connid 선택
FROM spfli                              "spfli 테이블에서 데이터 가져오기
INTO CORRESPONDING FIELDS OF TABLE gt_itab  "gt_itab에 조건 데이터 넣기 - spfli와 다른 테이블 구조를 가ㅣ족 있기에
PACKAGE SIZE 5.                         "인터널 테이블에 한 번에 몇 라인을 더 추가할지 설정하는 부분 =

LOOP AT gt_itab INTO gs_wa.             "print를 위해 gt_itab의 요소 gs_wa에 저장
  WRITE: / gs_wa-carrid, gs_wa-connid.  "출력
ENDLOOP.
ENDSELECT.                              "package 사이즈 지정 시 endselct 작성 필요

"sflight와 splfi 두 가지 테이블이 연결된 형태 - CORRESPONDING FIELDS OF TABLE이 필요한 이유
"PACKAGE SIZE는 한 번에 데이터를 얼마나 가져올지를 결정하는 요소 - 데이터를 많이 가져올때 필요함
