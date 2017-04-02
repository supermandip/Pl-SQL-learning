-- FILE : sales_invioce(report2).sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description : inserts all infrormation into the table 

--si_cust
INSERT INTO si_cust(custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone)
       VALUES ('Mandip','3020 Cedarglen Gate','Mississauga', 'ON','L5C4S7','647-608-0331','416-659-4456');
INSERT INTO si_cust(custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone)
       VALUES ('Iren','2020 Dundas Road','Mississauga', 'ON','L5C4S6','611-000-222','416-229-6656');
INSERT INTO si_cust(custname, custaddress, custcity, custprovince, custpostal, custhomephone, custworkphone)
       VALUES ('Arogya','40 Glengary Cres.','Brampton', 'ON','L3F6I2','647-008-1111','436-632-4356');
    
--si_purchinv

INSERT INTO si_purchinv(purchinvno, purchasedfrom, purchdate)
       VALUES ('W20001','2015-01-15','2015-12-10');
INSERT INTO si_purchinv(purchinvno, purchasedfrom, purchdate)
       VALUES ('W20002','2015-01-15','2013-01-01');
INSERT INTO si_purchinv(purchinvno, purchasedfrom, purchdate)
       VALUES ('W20003','2015-01-15','2014-05-15');
    

--si_car

INSERT INTO si_car(carserial, custname, make, model, caryear, extcolour, trim, enginetype, baselistprice, purchinvno, purchcost)
       VALUES ('J34865','Arogya','Civic', 'UX','1999','black','blue','A1','30000.00','W20001','15000.00');
INSERT INTO si_car(carserial, custname, make, model, caryear, extcolour, trim, enginetype, baselistprice, purchinvno, purchcost)
       VALUES ('Q34253','Iren','Jaguar', 'AX','2004','grey','white','S1','10000.00','W20002','52000.00');
INSERT INTO si_car(carserial, custname, make, model, caryear, extcolour, trim, enginetype, baselistprice, purchinvno, purchcost)
       VALUES ('W25674','Mandip','Honda', 'YZ','2005','red', 'red' ,'C2','340000.00','W20003','29000.00');
      
     
--si_salesinv

INSERT INTO si_salesinv(invno, invdate, custname, salesman, carserial, insfire, inscollision, insliab, insdamage, taxes, freightprepcost, licfee, otherfeeprice, commission, net)
       VALUES ('W20022','2015-01-15','Iren','John','Q34253','Yes','Yes','No','No','1500.00','200.00','150.00','100.00','50.00','59000.00');
INSERT INTO si_salesinv(invno, invdate, custname, salesman, carserial, insfire, inscollision, insliab, insdamage, taxes, freightprepcost, licfee, otherfeeprice, commission, net)
       VALUES ('W24501','2015-06-12','Arogya','Jack','J34865','Yes','Yes','No','No','1500.00','200.00','150.00','100.00','50.00','29000.00');
INSERT INTO si_salesinv(invno, invdate, custname, salesman, carserial, insfire, inscollision, insliab, insdamage, taxes, freightprepcost, licfee, otherfeeprice, commission, net)
      VALUES ('W22202','2015-01-18','Mandip','John','W25674','Yes','Yes','No','No','1500.00','200.00','150.00','100.00','50.00','59000.00');
       
      
--si_option

INSERT INTO si_option(optioncode, optiondesc, optionlistprice, optioncost)
       VALUES ('S24','Sun Roof','500.00','349.00');
INSERT INTO si_option(optioncode, optiondesc, optionlistprice, optioncost)
       VALUES ('R63','Sterio Radio','200.00', '140.00');
INSERT INTO si_option(optioncode, optiondesc, optionlistprice, optioncost)
       VALUES ('M22','Speakers','150.00', '100.00');
       
--si_invopt

INSERT INTO si_invopt(invno, optioncode, optionsprice)
       VALUES ('W24501','S24','346.00');
INSERT INTO si_invopt(invno, optioncode, optionsprice)
       VALUES ('W24502','R63','222.00');
INSERT INTO si_invopt(invno, optioncode, optionsprice)
       VALUES ('W22202','M22','222.00');
       
--si_caropt


INSERT INTO si_caropt(carserial, optioncode)
       VALUES ('Q34253','S24');
INSERT INTO si_caropt(carserial, optioncode)
       VALUES ('J34865','S24');
INSERT INTO si_caropt(carserial, optioncode)
       VALUES ('W25674','R63');
       
--si_invtrade

INSERT INTO si_invtrade(invno, carserial, tradeallow)
       VALUES ('W22202','W25674','9000.00');
INSERT INTO si_invtrade(invno, carserial, tradeallow)
       VALUES ('W24501','J34865','50000.00');
INSERT INTO si_invtrade(invno, carserial, tradeallow)
       VALUES ('W20022','Q34253','19000.00');
       
       
--si_prospect

INSERT INTO si_prospect(custname, carmake, carmodel, caryear, carextcolour, cartrim, optioncode)
       VALUES ('Mandip','honda','YZ','2005','yellow','red', 'R63');
INSERT INTO si_prospect(custname, carmake, carmodel, caryear, carextcolour, cartrim, optioncode)
       VALUES ('Arogya','Jaguar', 'AX','1995','yellow','red', 'S24');
INSERT INTO si_prospect(custname, carmake, carmodel, caryear, carextcolour, cartrim, optioncode)
       VALUES ('Iren','Civic','UX','1998','yellow','red', 'M22');
       
--si_servworkord

INSERT INTO si_servworkord(workorderno, workorderdate, custname, carserial, partprice, labourprice, tax)
       VALUES ('J01','2015-01-12','Mandip', 'W25674', '200.00', '60.00' ,'40.00');
INSERT INTO si_servworkord(workorderno, workorderdate, custname, carserial, partprice, labourprice, tax)
       VALUES ('J02','2015-03-22','Iren', 'Q34253', '500.00', '60.00' ,'60.00'); 
INSERT INTO si_servworkord(workorderno, workorderdate, custname, carserial, partprice, labourprice, tax)
       VALUES ('J03','2015-09-15','Arogya', 'J34865', '202.00', '60.00' ,'11.00');
  
--si_servdesc

INSERT INTO si_servdesc(workorderno, workdesc)
       VALUES ('J01','Fix the breaks');
INSERT INTO si_servdesc(workorderno, workdesc)
       VALUES ('J02','Changes all tires');
INSERT INTO si_servdesc(workorderno, workdesc)
       VALUES ('J03','New Shield wiper installation');
       
       
       COMMIT;