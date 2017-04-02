--Q2.sql
--Mandip Karki
--Create a second script to input a car serial # and print the serial#, make, model, year, colour and engine type of the car. Use one of the 
ACCEPT p_name PROMPT 'Enter Customer Name: '
VARIABLE g_output VARCHAR2(200)
DECLARE
   v_serial s9.car.serial%TYPE;
   v_make  s9.car.make%TYPE;
   v_model   s9.car.model%TYPE;
   v_year s9.car.cyear%TYPE;
    v_color s9.car.color%TYPE;
     v_etype s9.car.enginetype%TYPE;
BEGIN
   SELECT serial, make, model, cyear, color, enginetype
     INTO v_serial, v_make, v_model, v_year, v_color, v_etype
     FROM s9.car
    WHERE serial = '&p_name';
   :g_output := '&p_name' || ' ' ||v_serial || ' ' || v_make;
   :g_output := :g_output || ' ' || v_model || ' ' || v_year;
   :g_output := :g_output || ' ' || v_color || ' ' || v_etype;
END;
/
PRINT g_output


/*
G_OUTPUT
------------------------------------------------------------------
A02BRSX1 A02BRSX1 ACURA      RSX      2002 BLUE         TYPE-
*/