*&---------------------------------------------------------------------*
*& Report Z03_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_01.

DATA: gt_itab TYPE STANDARD TABLE OF sflight,     "internal table 선언 - 테이블의 구조만 따오는 것이지 데이터는 존재하지않음
      gt_wa LIKE LINE OF gt_itab.                 "internal table의 하나의 요소로서 선언

DATA: gs_line(72) TYPE C,                         "불러 올 string 저장용 변수 선언
      gt_list LIKE TABLE OF gs_line(72).          "string들의 집합.

gs_line = 'CARRID CONNID'.                        "1st lune에 해당 문자열 입력

*이 부분은 근데 필요하진 않은듯-> select문에 직접 넣는것이 더 좋아보임
*만약 여러테이블을 조인해서 데이터를 가져와야한다면 미리 가져올 데이터들을 위에 방식처럼 선언하는 것도 좋을듯 !

SELECT DISTINCT (gs_line) INTO TABLE gt_itab      "gt_itab에 gs_line넣기
FROM sflight.                                     "소스 테이블 선택
IF sy-subrc EQ 0.                                 "select문이 성공했을 시 = 0 => gt_itab에 gs_line이 잘 들어갔을떄
  WRITE: / 'CARRID', 'CONNID'.
  ULINE.
  LOOP AT gt_itab INTO gt_wa.                     "내부 테이블의 한 행식 가져오기 -> 반복문 gt_itab에 있는 테이블 요소들을 모두 순회하겠다는 말
    WRITE: / gt_wa-carrid, gt_wa-connid.          "데이터를 출력
  ENDLOOP.
ENDIF.


"sflight에서 carrid와 connid 테이블 필드 값을 가져와 gt_itab 내부테이블에 저장
"이때 gt_itab에 있는 요소들을 gt_wa에 저장함 -> 프린트의 목적으로
