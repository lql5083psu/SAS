data HealthReport;
length Result $ 11;
input Subj $ 1-4 Fname $ 6-16 Lname $ 18-23 Gender $ 25-30 Height 32-33 Weight 35-37
      @39 Date mmddyy8.
	  @48 Cal  comma5.;
	  BMI=Weight/(Height*0.0254)**2/2.205;
           if (BMI = .)   then Result='Missing';
	  else if (BMI <= 25) then Result='Underweight';
	  else if (BMI > 30)  then Result='Overweight';
	  else                     Result='Normal';
datalines;
1024 Alice       Smith  Female 65 125 12/01/95 2,036
1167 Maryann     White  Female 68 140 12/02/95 1,800
1168 Thomas      Jones  Male      190 01/05/96 2,302
1201 Benedictine Arnold Male   68 190 11/30/95 2,432
1302 Felicai     Ho     Female 63 115 01/01/96 1,972
1344 James       Hunter Male   70 188 12/15/95 1,869
;

/*print (a)*/
proc print data=HealthReport;
format Date mmddyy8. Cal comma5.;
title 'Health Examination Report';
option nodate nonumber ;
run;

/*print (b) to (e)*/
proc sort data=HealthReport out=SrtdHealthReport;
by Gender descending Lname;
run;

proc print data=SrtdHealthReport label;
label Lname='Last name'
      Fname='First name'
	  Subj='Subject number'
	  Height='Height (inches)'
	  Weight='Weight(lbs.)'
      Date='Date of measurement'
      Cal='Calorie';
by Gender;
format Date mmddyy8. Cal comma5.;
title 'Health Examination Report Sorted by Last Name';
option nodate nonumber ;
id Lname Fname;
sum Cal;
footnote 'BMI=Weight(kg)/(Height(m))^2';
run;
footnote;

/*print (f)*/
proc print data=SrtdHealthReport label;
label Lname='Last name'
      Fname='First name';
title 'Health Examination Report Female who is underweight';
var Fname Lname;
where Result='Underweight' & Gender='Female';
option nodate nonumber ;
run;

