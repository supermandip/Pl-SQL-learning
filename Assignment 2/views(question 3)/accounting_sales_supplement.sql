-- FILE : accounting_sales_supplement.sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description : used to calculate profit margins on vehicles during sales negotiations.

CREATE OR REPLACE VIEW si_accounting_sales_supplement AS

SELECT DISTINCT s.invno, s.custname, s.carserial, s.invdate, o.purchcost , o.baselistprice , s.freightprepcost, s.licfee, s.taxes, s.otherfeecost, s.commission, s.net
 FROM  si_car o, si_salesinv s
 WHERE s.carserial = o.carserial
 ORDER BY s.custname ASC, s.invno ASC, s.net DESC
 ;
 /*
 INVNO  CUSTNAME                  CARSERIAL INVDATE   PURCHCOST BASELISTPRICE FREIGHTPREPCOST     LICFEE      TAXES OTHERFEECOST COMMISSION        NET
------ ------------------------- --------- -------- ---------- ------------- --------------- ---------- ---------- ------------ ---------- ----------
I00088 ABDALLA FREIHAT           A13SINT0  15-05-13      30000         39000                        120       4810                    1000      37000 
I00115 ABEL TESFAYE              H08BGEN0  15-10-25      10200         17480               0          0       1534            0       1500      11800 
I00076 ADAM LAMBERT              L13SRX0   15-03-12      46000         58500            6000                 25000                     420      60000 

 --jump to row 143
 
 I00105 WILLIAM ANDERS            J97WUX1   15-07-23      30000         38500             450        200       1400            0          3       1200 
I00010 WILLIAM SMITH             H00BHS0   03-07-09      39000         40500            4300               10772.9                     755      86310 
I00002 WILLIAM ZIELER            J97WUX0   97-01-14      59000         69999            4000          0    10072.2            0        640      67148 

 145 rows selected 
 
 */