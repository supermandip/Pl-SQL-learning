-- FILE : service_log.sql
-- Author :Mandip Karki & Joan Aimien Jacobs
-- Description : Services done to the vehicle, when and how much the cost

CREATE OR REPLACE VIEW si_service_log AS

SELECT DISTINCT s.invno, workorderdate, p.carserial, (partprice + labourprice + tax) AS Total
 FROM si_servworkord p, si_salesinv s
 WHERE p.carserial = s.carserial
 ORDER BY s.invno
 ;
 
/*
INVNO  WORKORDERDATE CARSERIAL      TOTAL
------ ------------- --------- ----------
I00001 97-05-11      J97BUX3         39.1 
I00002 97-02-11      J97WUX0            0 
I00002 15-05-17      J97WUX0       395.48 


--jump to row 161

I00144 15-09-15      H15BCIV0       38.42 
I00145 00-01-18      A96WRSX3      320.41 
I00145 02-08-28      A96WRSX3      193.85 

 163 rows selected 

*/