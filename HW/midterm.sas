/* Solution to Midterm */

/* Problem 1 */

Libname mid 'X:/STAT480/SAS library/Midterm';

Data mid.weight;
length category $ 12;
infile 'X:/STAT480/Data/weight.csv'
delimiter = ',' dsd firstobs = 2;
input idno name $ team $ strtwght endwght;

loss = strtwght - endwght;
if (loss = '.') then category = 'Missing';
else if (loss <= 20) then category = 'Insignificant';
else category = 'significant';
run;

Proc PRINT data = mid.weight;
var name team loss;
where category = 'significant';
RUN;


/* Problem 2 */

DATA grade;
input Name $ Gender $ Homework Midterm1 Midterm2 Project;
Avgmid = (Midterm1 + Midterm2)/2;

if (Midterm1 = '.') then Final = 0.3*Homework + 0.4*Midterm2 + 0.3*Project;
else Final = 0.3*Homework + 0.2*Midterm1 + 0.2*Midterm2 + 0.3*Project;

Intfinal = round(Final,1);
datalines;
Justin     Male    90  88  75  82
Christal   Female  100 85  80  88
Rebecca    Female  80  77  71  65
Easton     Male    90  .   76  73
Jacob      Male    60  67  53  70 
Cindy      Female  85  83  68  90
;
RUN;

PROC print data = grade;
RUN;




/* Problem 3 */

Options ps = 30 ls = 64 nodate nonumber;

Data ShoppingList;
input Item $ 1-14 Shop $ Year  
      @25 Date mmddyy10. 
      +2 Price dollar7.2;
Datalines;
Cellphone       A  2013 02/25/2013  $259.99
Vacuum Cleaner  W  2014 09/30/2014   $78.29
Toaster         A  2014 07/12/2014   $32.35
Microwave       E  2013 12/05/2013   $87.40
Headphone       E  2014 01/03/2014   $96.72
Monitor         A  2013 03/21/2013  $275.99
Clothes Iron    W  2013 10/04/2013   $39.73
;
RUN;

PROC sort data = ShoppingList;
by Year;
RUN;

PROC print data = ShoppingList label;
id Year;
by Year;
label Date = 'Date when bought';
sum Price;
format Date date9. Price dollar7.2;
title 'Items bought in the last two years';
footnote 'A:Amazon; W:Walmart; E:Ebay;';
RUN;
