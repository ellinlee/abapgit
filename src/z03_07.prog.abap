*&---------------------------------------------------------------------*
*& Report Z03_07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_07.

DATA gs_where TYPE c LENGTH 72.
DATA gv_carrname TYPE scarr-carrname.
DATA gv_carrid TYPE scarr-carrid VALUE 'AC'.

CONCATENATE 'CARRID = ''' gv_carrid '''' INTO gs_where.  " gs_where이라는 조건 변수에 해당 조건 추가

SELECT SINGLE carrname          "scarr에서 조건에 맞는 carrname 필드값 가져오기
  INTO gv_carrname              "가져온 데이터 gv_carrname에 저장
  FROM scarr
  WHERE (gs_where).             "위에서 생성한 동적 조건절 입력
  WRITE / gv_carrname.          "gc_carrnam 출력
