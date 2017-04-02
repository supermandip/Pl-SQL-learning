-- FILE : prospect_list.sql
-- Author : Mandip Karki & Joan Aimien Jacobs
-- Description :List Of cars wanted by a particular customer 

CREATE OR REPLACE VIEW si_prospect_list AS


SELECT DISTINCT custname, concat(concat(concat(caryear, carextcolour), concat(carmodel, carmake)),concat(cartrim, optioncode)) AS WANT
 FROM  si_prospect
 ORDER BY custname ASC
 ;
 
 /*
 
 CUSTNAME                  WANT                                                                         
------------------------- ------------------------------------------------------------------------------
ABDALLA FREIHAT           2005BLACKBENZMERCEDESBLACKS23                                                  
ABDALLA FREIHAT           2006SILVERINTEGRAACURASILVERCD2                                                
ADAM LAMBERT              2013SILVERRXLEXUSBLACKLEATHERL02                                               

 
 --jump to 220
 
 ZAKEIR SAMSOODIN          1995BXJJAGUARLEATHERM14                                                        
ZAKEIR SAMSOODIN          JAGUAR                                                                         
ZARA FREEMAN              REDJEEP                                                                        

 221 rows selected 
 */