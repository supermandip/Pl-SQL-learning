-- FILE : inventory_record.sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description :Record of vehicals in the inventory

CREATE OR REPLACE VIEW si_inventory_record AS

SELECT  p.carserial AS Serialno, p.make, p.model, p.caryear, p.extcolour, p.trim, p.make AS PurchasedFrom, p.purchinvno, s.purchdate, p.purchcost , p.baselistprice AS ListBasePrice-- Count(c.optioncode) AS Code--, (count(m.optiondesc) AS Description, m.optionlistprice AS ListPrice
 FROM si_car p 
 LEFT OUTER JOIN si_purchinv s 
  ON  p.purchinvno = s.purchinvno
 LEFT OUTER JOIN si_caropt c
  ON  p.carserial = c.carserial
 LEFT OUTER JOIN si_option m
  ON  c.optioncode = m.optioncode
 WHERE p.custname is null 
 ORDER BY p.model DESC
 ;
 
 /*
 SERIALNO MAKE            MODEL              CARYEAR EXTCOLOUR       TRIM                      PURCHASEDFROM   PURCHINVNO PURCHDATE  PURCHCOST LISTBASEPRICE
-------- --------------- --------------- ---------- --------------- ------------------------- --------------- ---------- --------- ---------- -------------
J11SXK0  JAGUAR          XK COUPE              2011 SILVER          CD PLAYER                 JAGUAR          223456     08-02-25       10000         20800 
J97SXK0  Jaguar          XK                    1997 Silver          Black Leather             Jaguar          J65739     15-04-02      9697.5      15495.99 
J16YWRA0 Jeep            Wrangler Unlimt       2016 Yellow          Black Leather             Jeep            J76534     15-11-28       20000         41750 

 --jump to row 52
 
 M12SCLK0 MERCEDES        CLK                   2012 Silver          Vinyl                     MERCEDES                                                      
P97YBOX0 Porsche         Boxer                 1997 Yellow          Black                     Porsche         P32518     14-01-05      7697.5      17495.99 
M13WB200 Mercedes        B200                  2013 White           Black                     Mercedes        W58673     15-04-09       44700         50487 

 54 rows selected
 
 */
 