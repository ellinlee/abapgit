*&---------------------------------------------------------------------*
*& Report Z03_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_04.

PARAMETERS p_tname TYPE char10.     "table 이름 입력받기 위한 변수
DATA GS_WA TYPE SFLIGHT.            "sflight 의 형태 table 가져오기

SELECT SINGLE * INTO GS_wA          "gs_wa에 하나의 데이터만 가져와 저장
  FROM (p_tname)                    "소스 테이블 p_tname -> 동적으로 테이블 이름 사용 가능 -> 사용자 지정 가능
  WHERE carrid = 'AA'.              "carrid 가 AA인 데이터 가져온다는 조건


" 테이블 이름을 지정하지 않고 사용할 수 있음 by parameters
