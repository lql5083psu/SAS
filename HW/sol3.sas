/* Solution to Assignemt #3 */

Options ls=64 nodate nonumber;                             /* Change the SAS system settings */

Data HealthReport;

length Result $ 11;                                        /* Specify the length for the variable Result */

input Subj Fname $ 6-16 Lname $ Gender $ Height Weight 
      +1 Date mmddyy8.
      +1 Cal comma5.;

BMI = Weight/2.205/(Height*0.0254)**2;                     /* Calculate BMI */

if (BMI = '.') then Result = 'Missing';                    /* Assign values to Result based on BMI */
else if (BMI <= 25) then Result = 'Underweight';
else if (BMI > 25 & BMI <= 30) then Result = 'Normal';
else Result = 'Overweight';

datalines;
1024 Alice       Smith  Female 65 125 12/01/95  2,036
1167 Maryann     White  Female 68 140 12/02/95  1,800
1168 Thomas      Jones  Male   .  190 01/05/96  2,302
1201 Benedictine Arnold Male   68 190 11/30/95  2,432
1302 Felicia     Ho     Female 63 115 01/01/96  1,972
1344 James       Hunter Male   70 188 12/15/95  1,869
;

PROC SORT data =  HealthReport out = SrtdHealthReport;      /* Sort the dataset by Gender and Lname */
BY Gender descending Lname;

PROC print data = SrtdHealthReport label;
id Lname Fname;
label Subj = 'Subject number'                               /* Assign labels to all the variables */
      Fname = 'First name'
	  Lname = 'Last name'
	  Gender = 'Gender'
	  Height = 'Height(lbs.)'
	  Weight = 'Weight(inches)'
	  Date = 'Date of measurement'
	  Cal = 'Calorie'
	  BMI = 'Body mass index';
by Gender; 
sum Cal;                                                     /* Split the dataset by gender and calculate the sum of Calorie for each group */
format Date mmddyy8. Cal comma5.;
title 'Sorted Healthe Report by Fisrt Name';
footnote1 'BMI = Weight(kg)/(Height(m))^2';
RUN;


PROC print data = SrtdHealthReport;
where Gender='Female' & Result = 'Underweight';
var Fname Lname;
RUN;
