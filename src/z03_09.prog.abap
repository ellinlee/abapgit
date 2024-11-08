*&---------------------------------------------------------------------*
*& Report Z03_09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z03_09.

DATA gt_spfli TYPE TABLE OF spfli.
DATA gt_sflight TYPE TABLE OF sflight.
DATA gs_sflight TYPE sflight.

SELECT * FROM spfli
  into TABLE gt_spfli.            "내부 테이블 gt_spfli에 spfli 값 모두 넣어버려

SELECT * FROM sflight             "sflight에서
  INTO TABLE gt_sflight           "gt_sflight 테이블에 값 넣기
  FOR ALL ENTRIES IN gt_spfli     "gt_spfli안에 있는 모든 값 넣기
  WHERE carrid = gt_spfli-carrid  "carrid = gt_spfli 안에 있는 carrid 값
  AND connid = gt_spfli-connid.   "connid = gt_spfli 안에 있는 connid 값

 LOOP AT gt_sflight INTO gs_sflight.              "gs_sflight 안에 gt_flight요소 값 넣기 ->출력을 위해
   WRITE: / gs_sflight-carrid, gs_sflight-connid. "값 넣기
 ENDLOOP.


 "FOR ALL ENTRIES IN 은 내부 테이블에만 사용
 "abap은 db table간 직접 비교 불가 -> 내부 테이블을 선언해야함.
