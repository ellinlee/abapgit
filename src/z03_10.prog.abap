*&---------------------------------------------------------------------*
*& Report Z03_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_10.

DATA: gv_carrid TYPE sflight-carrid,
      gv_connid TYPE sflight-connid,
      gv_paymentsum TYPE i.

SELECT carrid connid avg( paymentsum )
  INTO (gv_carrid, gv_connid, gv_paymentsum)      "변수에 넣기
  FROM sflight GROUP BY carrid connid            "sfligjt를 소스테이블 group by: carrid connid 의 값을 선택해오기
  HAVING AVG( paymentsum ) > 100000.
  WRITE: / gv_carrid, gv_connid, gv_paymentsum.
  ENDSELECT.

 "avg를 쓰려면 group by 를 써야함
 "group by 다음에 조건을 추가하기 위해서는 having
 "만약에 group by를 안쓰면 모든 데이터를 가져오게 됨
