libname lib1 'X:\STAT480\SAS library\MyLibrary2';

/*Problem 1(a) and 1(b)*/
proc report data=lib1.mining;
     define YEAR / display;
     define QTR / "QUARTER";
	 define PRO / "PRODUCTION";
	 define POW / "POWER";
     where PRO > 110 and QTR =1;                            /* -2 pts: You do not really change the name, I expect you to use the RENAME option */
run;

/*Problem 1 (c)*/
proc means data=lib1.mining mean std;
var PRO POW;
class YEAR;
output out=lib1.mining_new
       mean=mean_of_PRO mean_of_POW
       std=std_of_PRO std_of_POW;
run;

/*Problem 1(d)*/
proc plot data=lib1.mining_new;
 title 'YEAR vs mean value of PRODUCTION';
 plot YEAR*mean_of_PRO='*';
run;

/*Problem2*/
proc freq data=lib1.alcohol;
title 'Table of Kids and Consume';
tables KIDS*CONSUME ;
run;
