--Q3.sql
--Mandip Karki
--Create a third script which will prompt the user for a serial number of a car and the new serial number of the car and successfully change that car's serial number in the database. Include the output with your answer, but don't save it with the actual script you have saved on the server. 


ACCEPT p_old PROMPT 'Enter old serial: '
ACCEPT p_new PROMPT 'Enter new serial: '

INSERT INTO s9.car
(SELECT '&p_new', cname, make, model, cyear, color, trim, enginetype, purchinv, purchdate, purchfrom, purchcost, freightcost, totalcost, listprice
   FROM s9.car
  WHERE serial='&p_old');
  
UPDATE s9.saleinv
   SET serial='&p_new'
 WHERE serial='&p_old';
 
 UPDATE s9.saleinv
   SET tradeserial='&p_new'
 WHERE tradeserial='&p_old';
 
UPDATE s9.servinv
   SET serial='&p_new'
 WHERE serial='&p_old';
 
  UPDATE s9.baseoption
   SET serial='&p_new'
 WHERE serial='&p_old';
 
DELETE FROM s9.car
 WHERE serial='&p_old';
COMMIT;

/*
old:UPDATE s9.servinv
   SET serial='&p_new'
 WHERE serial='&p_old'
new:UPDATE s9.servinv
   SET serial='00001'
 WHERE serial='A12GRX40'
2 rows updated.
old:UPDATE s9.baseoption
   SET serial='&p_new'
 WHERE serial='&p_old'
new:UPDATE s9.baseoption
   SET serial='00001'
 WHERE serial='A12GRX40'
2 rows updated.
old:DELETE FROM s9.car
 WHERE serial='&p_old'
new:DELETE FROM s9.car
 WHERE serial='A12GRX40'
1 rows deleted.
committed.

*/