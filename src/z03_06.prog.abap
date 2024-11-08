*&---------------------------------------------------------------------*
*& Report Z03_06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_06.

TYPES: BEGIN OF t_str,
  carrid TYPE sflight-carrid,
  carrname TYPE scarr-carrname,
  END OF t_str.

 DATA: gs_str TYPE t_str.

SELECT single a~carrid b~carrname
  INTO CORRESPONDING FIELDS OF gs_str
  FROM sflight AS A
  LEFT OUTER JOIN scarr AS b
  ON a~carrid = b~carrid
  WHERE a~carrid = 'AA'.

 WRITE: / gs_str-carrid, gs_str-carrname.
