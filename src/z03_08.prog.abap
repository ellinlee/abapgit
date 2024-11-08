*&---------------------------------------------------------------------*
*& Report Z03_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_08.

DATA gs_where TYPE c LENGTH 72.
DATA gt_where LIKE TABLE OF gs_where.
DATA gv_carrname TYPE scarr-carrname.
DATA gv_carrid1 TYPE scarr-carrid VALUE 'AC'.
DATA gv_carrid2 TYPE scarr-carrid VALUE 'AF'.

CONCATENATE 'CARRID = ''' gv_carrid1'''' INTO gs_where.
APPEND gs_where TO gt_where.

gs_where = 'OR'.
APPEND gs_where TO gt_where.

CONCATENATE 'CARRID = ''' gv_carrid2'''' INTO gs_where.
APPEND gs_where TO gt_where.

SELECT carrname
  INTO gv_carrname
  FROM scarr
  where (gt_where).
  WRITE / gv_carrname.
  ENDSELECT.

  "WHERE CARRID = 'AC' OR CARRID = 'AF'
  "where 조건절에 carrid = 'ac' or carrid ='af'인 carrname을 select해서 gv_carrname에 넣기
