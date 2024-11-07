REPORT Z03_01.

DATA: gt_itab TYPE TABLE OF sflight.        " 데이터 저장용 내부 테이블

* 데이터 선택
SELECT DISTINCT carrid connid INTO TABLE gt_itab
FROM sflight.

IF sy-subrc = 0.
  " ALV 호출 - i_structure_name만 사용
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_structure_name = 'SFLIGHT'
    TABLES
      t_outtab        = gt_itab.
ENDIF.
