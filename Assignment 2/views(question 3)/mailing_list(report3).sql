-- FILE : sales_invioce(report3).sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description :mailing information of customer



CREATE or REPLACE VIEW si_selectedmailinglist
AS
SELECT DISTINCT s.salesman, name, address, city, comments
FROM s11_432.si_salesinv s, si_cust c
WHERE s.salesinv = c.cust
ORDER BY s.salesman
;


/* report 3 from case study of  Joan Aimien Jacobs therefore some fields could not be retrieved beacuse they were madeup */