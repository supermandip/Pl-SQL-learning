--Q1.sql
--Mandip Karki
--Create the first script which prompts for the make of a car and determines how many different customers desire that make of car. Include the output with your answer, but don't save it with the actual script you have saved on the server. 

ACCEPT p_make PROMPT 'Enter car make: '
SELECT COUNT(DISTINCT cname) AS "car"
  FROM s9.prospect 
 WHERE make = '&p_make';
 
 /*
 
 COUNT(DISTINCTCNAME)
--------------------
                  29 
                  
                  */