/*Problem 1*/
libname lib1 'X:\STAT480\SAS library\Midterm';
data lib1.P1_weight;
infile 'X:/STAT480/Data/weight.csv'
       delimiter=',' dsd firstobs=2;
length category $ 13;
input idno name $ term $ strtwght endwght;
      loss=strtwght-endwght;
	       if (loss = .)   then category='Missing';
      else if (loss <= 20) then category='Insignificant';
	  else                      category='significant';

proc print data=lib1.P1_weight;
title Problem1 Weight;
var name term loss;
where category='significant';
run;


/*Problem2*/
Data P2_Grades;
input Name $ Gender $ Homework Midterm1 Midterm2 Project;
      Avgmid=(Midterm1+Midterm2)/2;
	  if (Midterm1=.) then Final=0.3*Homework+0.4*MIdterm2+0.3*Project;
	  else                 Final=0.3*Homework+0.2*MIdterm1+0.2*MIdterm2+0.3*Project;
	  Intfinal=round(Final);
datalines;
Justin   Male   90  88 75 82
Christal Female 100 85 80 88
Rebecca  Female 80  77 71 65
Easton   Male   90  .  76 73
Jacob    Male   60  67 53 70 
Cindy    Female 85  83 68 90
;

proc print data=P2_Grades;
title Problem2 Grades;
run;

/*Problem3*/
Data P3_Shopping;
length Item $14;
input Item $ 1-14 Shop $ 16 Year  18-21
      @23 Date mmddyy10.
      @34 Price dollar10.2;
datalines;
Cellphone      A 2013 02/25/2013 $259.99
Vacuum Cleaner W 2014 09/30/2014 $78.29
Toaster        A 2014 07/12/2014 $32.35  
MIcrowave      E 2013 12/05/2013 $87.40
Headphone      E 2014 01/03/2014 $96.72
Monitor        A 2013 03/21/2013 $275.99
Clothes Iron   W 2013 10/04/2013 $39.73
;

proc sort data=P3_Shopping;
by year;
run;

proc print data=P3_Shopping label split='/';
format Date date9. Price dollar10.2;
id year;
by year;
label Date='Date when /bought';
option ps=30 ls=64 nodate nonumber;
sum Price;
title Items bought in the last two years;
footnote 'A:Amazon; W:Walmart; E:Ebay;';
run; 
footnote;
      
