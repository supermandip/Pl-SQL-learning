-- FILE : a10
-- Author : Mandip Karki
-- Description : customers whose outstanding balance is less than $1000, and who have placed two or more sales orders in the past 2 years.

CREATE OR REPLACE VIEW custorder AS
SELECT custno
FROM sh_salesorder 
WHERE SYSDATE - orderdate BETWEEN 0 AND 365
 GROUP BY custno
  HAVING COUNT(custno) > 1
  ;
 
CREATE OR REPLACE VIEW  PREFERRED_CUSTOMERS AS
SELECT custname ,c.custstreet,  c.custcity, c.custprov, c.custpcode, c.balance
FROM sh_customer c, custorder o
WHERE c.custno = o.custno
  AND c.balance < 1000

;
