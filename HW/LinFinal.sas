libname lib1 'X:\STAT480\SAS library\Final';

/*Problem (a)*/
proc contents data=sashelp.cars;
run;

/*Problem (b)*/
DATA lib1.cars;
  set sashelp.cars(drop=Model rename=(MSRP=RetailPrice));
run;

/*Problem (c)*/
proc report data=lib1.cars;
title 'A Summary Report by Type and Origin';
column Type Origin Invoice MPG_Highway MPG_City MPG_diff;
define Type /group;
define Origin / across;
define Invoice /mean 'Mean of Invoice' format=dollar10.2;
define MPG_Highway /max 'Max of MPG of Highway';
define MPG_City /max 'Max of MPG of City';
define MPG_diff / computed;
compute MPG_diff;
MPG_diff=MPG_Highway.max-MPG_City.max;
endcomp;
run;

/*Problem (d)*/
proc means data=lib1.cars;
var RetailPrice Weight;
class Origin DriveTrain;
output out=cars2
       mean=mean_of_RetailPrice mean_of_Weight
       median=median_of_RetailPrice m_of_Weight;
run;

proc print data=cars2;
format mean_of_RetailPrice dollar10.2 median_of_RetailPrice dollar10.2;
run;

/*Problem (e)*/
proc freq data=lib1.cars;
tables Origin*Type;
run;

/*Problem (f)*/
proc univariate data=lib1.cars;
var length;
histogram length / midpoints=140 to 244 by 5 normal;
run;

proc gplot data=lib1.cars;
plot RetailPrice*Horsepower=Type;
run;

proc boxplot data=lib1.cars;
plot length*Origin;
run;

proc gchart data=lib1.cars;
hbar length/ midpoints=150 to 230 by 20 subgroup=Origin;
run;

/*Problem (g)*/
proc reg data=lib1.cars;
model RetailPrice = length Cylinders EngineSize Horsepower MPG_Highway MPG_City Weight Wheelbase
  / selection=forward vif;
run;

/*Problem (h)*/
data lib1.Pro_h;
Merge lib1.set1 lib1.set2;
by ID;
run;

proc print data=lib1.Pro_h;
run;
