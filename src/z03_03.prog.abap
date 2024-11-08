*&---------------------------------------------------------------------*
*& Report Z03_03
*&---------------------------------------------------------------------*
*& 개별 변수를 가져와 출력하기 위함
*&---------------------------------------------------------------------*
REPORT Z03_03.

DATA: gv_carrid TYPE sflight-carrid,
      gv_connid TYPE sflight-connid.

SELECT carrid connid
  INTO (gv_carrid, gv_connid)
  FROM sflight.

  WRITE: / gv_carrid, gv_connid.

ENDSELECT.
