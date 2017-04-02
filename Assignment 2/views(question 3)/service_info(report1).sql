-- FILE : service_info(report1).sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description : what services were provided to the customer car


CREATE or REPLACE VIEW si_serviceinfo
AS
SELECT DISTINCT c.make, model, year, engineType, visitNum, averageCost
FROM s11_432.si_car c, si_prospect p
WHERE c.make = p.make
ORDER BY c.make
;


/* report 1 from case study of  Joan Aimien Jacobs therefore some fields could not be retrieved beacuse they were madeup */