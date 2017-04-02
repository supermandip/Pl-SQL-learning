-- FILE : Assignment2.sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description : Make all the tables required in the database


DROP TABLE si_servdesc;
DROP TABLE si_servworkord;
DROP TABLE si_prospect;
DROP TABLE si_invtrade;
DROP TABLE si_caropt;
DROP TABLE si_invopt;
DROP TABLE si_option;
DROP TABLE si_salesinv;
DROP TABLE si_car;
DROP TABLE si_purchinv;
DROP TABLE si_cust;




CREATE TABLE si_cust(
   custname         VARCHAR(30) CONSTRAINT nlsi_cust_custname NOT NULL
, custaddress       VARCHAR(30) CONSTRAINT nlsi_cust_custaddress NOT NULL
, custcity          VARCHAR(30) CONSTRAINT nlsi_cust_custcity NOT NULL
, custprovince      VARCHAR(20)  CONSTRAINT nlsi_cust_custprov NOT NULL
, custpostal        VARCHAR(20)  CONSTRAINT nlsi_cust_custpostal NOT NULL
, custhomephone     VARCHAR(30)  
, custworkphone     VARCHAR(30) 
, CONSTRAINT pksi_cust   PRIMARY KEY (custname)
);

CREATE TABLE si_purchinv(
 purchinvno	    VARCHAR(10)	
,purchasedfrom	VARCHAR(30)		
,purchdate 	    DATE
,CONSTRAINT pksi_purchinv PRIMARY KEY(purchinvno)
);


CREATE TABLE si_car(
 carserial		VARCHAR(20)
,custname     VARCHAR(30) 
,make		      VARCHAR(30) 
,model		    VARCHAR(10) 
,caryear		  VARCHAR(6)
,extcolour	  VARCHAR(10)
,trim		        VARCHAR(20)
,enginetype	    VARCHAR(20) 
,baselistprice  DECIMAL(15,2) 
,purchinvno	    VARCHAR(10)
,purchcost	    DECIMAL(15,2)
, CONSTRAINT pksi_car PRIMARY KEY (carserial)
,CONSTRAINT fksi1_car FOREIGN KEY (custname)   REFERENCES si_cust(custname)
,CONSTRAINT fksi2_car FOREIGN KEY (purchinvno) REFERENCES si_purchinv(purchinvno)
);



CREATE TABLE si_salesinv(
 invno		      VARCHAR(10)
,invdate		    DATE
,custname	      VARCHAR(30)
,salesman	      VARCHAR(30) 
,carserial		  VARCHAR(10)
,insfire		    VARCHAR(4) 
,inscollision	  VARCHAR(4)
,insliab		    VARCHAR(4) 
,insdamage	    VARCHAR(4)
,taxes		      DECIMAL(6,2)
,freightprepcost	DECIMAL(15,2)
,licfee		        DECIMAL(15,2)
,otherfeecost	    DECIMAL(15,2)
,otherfeeprice	  DECIMAL(15,2)
,commission	      DECIMAL(15,2)
,net		          DECIMAL(15,2)
,CONSTRAINT pksi_salesinv PRIMARY KEY(invno)
,CONSTRAINT fksi_salesinv_custname  FOREIGN KEY (custname)  REFERENCES si_cust(custname)
,CONSTRAINT fksi_salesinv_carserial FOREIGN KEY (carserial) REFERENCES si_car(carserial)
)
;



CREATE TABLE si_option(
 optioncode	      VARCHAR(10)
,optiondesc	      VARCHAR(20)
,optionlistprice	DECIMAL(15,2)
,optioncost	      DECIMAL(15,2)
,CONSTRAINT pksi_option PRIMARY KEY(optioncode)
);



CREATE TABLE si_invopt(
 invno		    VARCHAR(10)
,optioncode	  VARCHAR(10)
,optionsprice	DECIMAL(15,2)
,CONSTRAINT pksi_invopt PRIMARY KEY (invno)
,CONSTRAINT fksi_invopt FOREIGN KEY (optioncode) REFERENCES si_option(optioncode)
);



CREATE TABLE  si_caropt(
 carserial		VARCHAR(10)
,optioncode	  VARCHAR(10)
,CONSTRAINT pksi_caropt PRIMARY KEY(carserial, optioncode)
,CONSTRAINT fksi1_caropt FOREIGN KEY (carserial) REFERENCES si_car(carserial)
,CONSTRAINT fksi2_caropt FOREIGN KEY (optioncode) REFERENCES si_option(optioncode)
);


CREATE TABLE si_invtrade(
 invno		    VARCHAR(10)
,carserial		VARCHAR(20) CONSTRAINT nlsh_invtrade_carserial NOT NULL
,tradeallow	  DECIMAL(10,2) 
,CONSTRAINT pksi_invtrade PRIMARY KEY(invno, carserial)
,CONSTRAINT fksi1_invtrade FOREIGN KEY (invno) REFERENCES si_salesinv(invno)
,CONSTRAINT fksi2_invtrade FOREIGN KEY (carserial) REFERENCES si_car(carserial)
);		


CREATE TABLE si_prospect(
 custname	    VARCHAR(30) 
,carmake	  	VARCHAR(20)
,carmodel   	VARCHAR(10) 
,caryear	  	VARCHAR(5)
,carextcolour	VARCHAR(10) 
,cartrim	  	VARCHAR(10)
,optioncode	  VARCHAR(10)
,CONSTRAINT pksi_prospect PRIMARY KEY(custname, carmake, carmodel, caryear, carextcolour, cartrim, optioncode)
,CONSTRAINT fksi1_prospect FOREIGN KEY (custname) REFERENCES si_cust(custname)
,CONSTRAINT fksi2_prospect FOREIGN KEY (optioncode) REFERENCES si_option(optioncode)

);

CREATE TABLE si_servworkord(
 workorderno	  VARCHAR(20)		
,workorderdate	DATE
,custname	      VARCHAR(30) 
,carserial	  	VARCHAR(10)
,partprice    	DECIMAL(15,2)
,labourprice  	DECIMAL(15,2)
,tax		        DECIMAL(15,2)
,CONSTRAINT pksi_servworkord PRIMARY KEY(workorderno)
,CONSTRAINT fksi1_servworkord FOREIGN KEY (custname) REFERENCES si_cust(custname)
,CONSTRAINT fksi2_servworkord FOREIGN KEY (carserial) REFERENCES si_car(carserial)
);

CREATE TABLE si_servdesc(
workorderno	VARCHAR(10)
,workdesc	  VARCHAR(40)
,CONSTRAINT pksi_servdesc PRIMARY KEY(workorderno, workdesc)
,CONSTRAINT fksi1_servdesc FOREIGN KEY (workorderno) REFERENCES si_servworkord(workorderno)
);





