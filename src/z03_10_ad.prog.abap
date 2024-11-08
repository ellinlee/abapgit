*&---------------------------------------------------------------------*
*& Report Z03_10_AD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_10_AD.

DATA: lt_results TYPE TABLE OF sflight,  "전체 결과를 저장할 테이블
      gs_result TYPE sflight.            "개별 레코드를 저장할 워크 영역

" sflight 테이블에서 carrid와 seatsocc 조회
SELECT carrid connid
  INTO TABLE lt_results
  FROM sflight.

" 결과 출력
LOOP AT lt_results INTO gs_result.
  WRITE: / 'CARRID:', gs_result-carrid, 'CONNID:', gs_result-connid.
ENDLOOP.

"group by를 사용하지 않으면 이렇게 된드아 -> 중복된 데이터 값 여러번 나올 수도 있드아
"sflight 테이블에는 동일한 carrid(항공사 ID)와 connid(항공편 ID)를 가진 여러 레코드가 있을 수 있음
"예를 들어, 동일한 항공사(carrid = 'AA')가 동일한 항공편(connid = '0017')을 여러 날짜에 운항하는 경우가 있음.
"이렇게 되면 sflight 테이블에 carrid = 'AA'와 connid = '0017'를 가진 레코드가 여러 개 존재할 수 있습니다.
