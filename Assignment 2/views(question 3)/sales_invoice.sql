-- FILE : sales_invioce.sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description :Sales Invioce of the agreement from customer and salesperson

CREATE OR REPLACE VIEW si_sales_invoice AS

SELECT DISTINCT s.invno, s.invdate,
s.custname, p.custaddress AS Address , p.custcity AS City, p.custprovince AS State, p.custhomephone AS Telephone
, s.salesman, s.carserial, o.make, o.model, o.caryear, o.extcolour
,s.insfire, s.insliab, s.inscollision, s.insdamage
,t.tradeallow
,s.net AS totalPrice, s.taxes, (s.net+s.taxes) AS TotalPayable
 FROM si_salesinv s 
 LEFT OUTER JOIN si_cust p 
  ON  s.custname = p.custname
 LEFT OUTER JOIN si_car o
  ON  s.carserial = o.carserial
 LEFT OUTER JOIN si_invtrade t
  ON  s.invno = t.invno
  AND s.carserial = t.carserial
 WHERE o.custname is not null 
  
 ;
 
 /*
INVNO  INVDATE  CUSTNAME                  ADDRESS                        CITY                           STATE                TELEPHONE      SALESMAN                  CARSERIAL MAKE            MODEL              CARYEAR EXTCOLOUR       INSFIRE INSLIAB INSCOLLISION INSDAMAGE TRADEALLOW TOTALPRICE      TAXES TOTALPAYABLE
------ -------- ------------------------- ------------------------------ ------------------------------ -------------------- -------------- ------------------------- --------- --------------- --------------- ---------- --------------- ------- ------- ------------ --------- ---------- ---------- ---------- ------------
I00020 11-09-01 JUNG HOON CHOI            2015 Diablo                    Oakville                       ON                   123-8797-4621  Chris Pardon              B15GWYT0  BMW             WYT                   2015 Gold            Y       N       N            N           56300.77      10000      14780        24780 
I00023 12-05-03 JOAN                      45 bloar street                Mississauga                    Ontario              905-346-2323   Darren                    J10BH840  Jaguar          H847FG8492            2010 blue            Y       N       N            N                600               9586.45              
I00017 11-01-04 JONATHAN                  75 Oran drive                  Mississauga                    Ontario              905-456-6843   Randel                    H04BD570  Honda           D574BN7583            2004 black           N       N       N            Y                300               1834.45              

 
 --jump to row 131
 
I00101 15-06-12 AROGYA                    40 Glengary Cres.              Brampton                       ON                   647-008-1111   Jack                      C99BUX0   Civic           UX                    1999 black           Y       N       Y            N              50000      29000       1500        30500 
I00065 15-01-18 MANDIP                    3020 Cedarglen Gate            Mississauga                    ON                   647-608-0331   John                      H05RYZ0   Honda           YZ                    2005 red             Y       N       Y            N               9000      59000       1500        60500 
I00053 14-05-17 SAM WINCHESTER            700 road way                   Brampton                       ON                   9058555055     Stewie                    C67BIMP0  Chevrolet       Impala                1967 Black           N       Y       N            Y                          1200       1400         2600 

 133 rows selected   */