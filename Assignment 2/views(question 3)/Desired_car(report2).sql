-- FILE : sales_invioce(report2).sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description : what the customer desires in his car


CREATE or REPLACE VIEW si_desiredcarcriteria
AS
 SELECT DISTINCT c.make, model, color, upholstery, year, custname,custaddress, custcity,custtelephone,comments
FROM s11_432.si_car c, si_cust s, si_prospect p
WHERE c.car=s.cust
     AND c.car=p.prospect
;


/* report 2 from case study of  Joan Aimien Jacobs therefore some fields could not be retrieved beacuse they were madeup */