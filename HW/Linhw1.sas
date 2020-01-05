/*Question 1 Read in-stream data*/
data TheSASSystem;
length Name $ 15;
input Name $ Gender $ GPA SatMath SatVerbal;
cards;
BeckAnderson Male 2.67 700 700
DupontJules Female 2.98 700 500
GavettiNicole Female 2.67 470 470
EastonMatthew Male 3.6 710 560
MattiaceJohn Male 3.76 . .
ZhangChen Female 3.86 610 720
;

libname lib1 'X:\STAT480\SAS library\MyLibrary1';
data lib1.TheSASSystem;

Title Homework1;
proc print data=TheSASSystem;
Run;

libname lib1 'X:\STAT480\SAS library\MyLibrary1';
data lib1.test;
set TheSASSystem;
run;

/*Question 2 Read in txt file data*/
filename refstu 'X:\STAT480\Data\ClassSurvey.txt';
data stu2;
infile refstu
delimiter=';' dsd firstobs=3;
length Name $ 10;
length DivulgeCheating $ 13;
input Name $ Gender $ GPA DivulgeCheating $ SatMath SatWerbal;

libname lib2 'X:\STAT480\SAS library\MyLibrary2';
data lib2.stu2;

Title ClassSurvey;
proc print data=stu2;
run;


/*Question 2 Read in csv file data*/
filename refstud 'X:\STAT480\Data\ClassSurvey.csv';
data stu3;
infile refstud
delimiter=',' dsd firstobs=3;
length Name $ 10;
length DivulgeCheating $ 13;
input Name $ Gender $ GPA DivulgeCheating $ SatMath SatWerbal;

libname lib2 'X:\STAT480\SAS library\MyLibrary2';
data lib2.stu3;

Title ClassSurvey2;
proc print data=stu3;
run;



