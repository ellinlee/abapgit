*&---------------------------------------------------------------------*
*& Report Z03_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_05.

TYPES: BEGIN OF t_str,                "구조체 선언
  carrid TYPE sflight-carrid,         "sflight의 carrid 가져오고
  carrname TYPE scarr-carrname,       "scarr의 carrname
  END OF t_str.

DATA: gs_str TYPE t_str.            "구조체 하나 선언

SELECT SINGLE a~carrid b~carrname   "조건에 맞는 하나의 레코드만 가져옴
  INTO CORRESPONDING FIELDS OF gs_str "gs_str에 조건에 맞는 데이터 넣기
  FROM sflight AS a                   "소스 = sflight
  INNER JOIN scarr AS b               "scarr와 조인
  ON a~carrid = b~carrid              "조인관계를 carrid값이 같은걸로
  WHERE a~carrid = 'AA'.              "조건 선언

  WRITE : gs_str-carrid, gs_str-carrname. "가져온 데이터 읽기
