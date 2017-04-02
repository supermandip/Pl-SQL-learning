-- FILE : service_invoice.sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description : Detailed information of services done on Vehicles 

CREATE OR REPLACE VIEW si_service_invoice AS

SELECT DISTINCT p.workorderno AS ServiceInvoiceNo, p.workorderdate AS DateIssued, p.custname,s.custaddress AS Address 
, s.custcity AS City, s.custprovince AS State, s.custhomephone AS HomePhone, s.custworkphone AS WorkPhone, p.carserial
, o.make, o.model, o.caryear, o.extcolour, w.workdesc
 FROM si_servworkord p, si_cust s, si_car o, si_servdesc w
 WHERE p.custname = s.custname
 AND p.custname = o.custname
 AND p.workorderno = w.workorderno
 ORDER BY p.workorderno
 
 ;
 
 /*
 SERVICEINVOICENO DATEISSUED CUSTNAME                  ADDRESS                        CITY                           STATE                CUSTHOMEPHONE  CUSTWORKPHONE
---------------- ---------- ------------------------- ------------------------------ ------------------------------ -------------------- -------------- --------------
W00001           97-02-11   ELMER BEFUDD              1230 Trafalgar Rd              Oakville                       ON                   (905)845-9431  (647)456-1829  
W00002           97-02-11   ELMER BEFUDD              1230 Trafalgar Rd              Oakville                       ON                   (905)845-9431  (647)456-1829  
W00003           97-02-11   BUGS BUNNY                16 Burke Cres                  Mississauga                    ON                   (905)416-8791  (647)456-1029  
W00004           97-02-11   BUGS BUNNY                16 Burke Cres                  Mississauga                    ON                   (905)416-8791  (647)456-1029  
W00005           97-05-11   JACK JOHNSON              123 main st s                  brampton                       ontario              4168921915     12345131       
W00006           97-06-10   JIMMY JOHN                123 Fake Street                Mississauga                    Ontario              (905)465-3382  (647)112-1920  
W00007           97-08-20   BILLY BOB                 1290 Yonge Street              Toronto                        Ontario              (416)626-1111                 

 
 - jump to 1560
 
 W00208           90-01-01   ALI                       123 Missionhill Dr             mississauga                    ON                   (905)555-5555                 A15BRSX0  ACURA           RSX                   2015 black           Check Engine Noise                                                                                                                                                                                                                                              
W00208           90-01-01   ALI                       123 Missionhill Dr             mississauga                    ON                   (905)555-5555                 A15BRSX0  ACURA           RSX                   2015 black           Check Fluid Levels                                                                                                                                                                                                                                              
W00208           90-01-01   ALI                       123 Missionhill Dr             mississauga                    ON                   (905)555-5555                 A15BRSX0  ACURA           RSX                   2015 black           Correct Exhaust                                                                                                                                                                                                                                                 

 1,563 rows selected*/