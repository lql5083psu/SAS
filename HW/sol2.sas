/* Solution to assignment #2 */

/* Problem 1 */

LIBNAME lib1 'X:/STAT480/SAS library/MyLibrary1';

DATA lib1.grades;
input Name $ 1-8 Gender $ 12-17 Homework 20-22 Midterm 24-25 Final 28-29;

Score1 = 0.4*Homework + 0.2*Midterm + 0.4*Final;
Score2 = 0.4*Midterm + 0.6*Final;
fs = max(Final, Score1, Score2);
newfs = round(0.7*fs + 30, 5);

datalines;
Beck       Male    90  88  75
Christal   Female  100 85  80
Gavetti    Female  80  77  71
Easton     Male    90  82  76
Mattiace   Male    60  67  53
Chen       Female  85  83  68
;

PROC print data = lib1.grades;
TITLE Grades;
  var Name Homework Midterm Final Score1 Score2 fs newfs;
RUN;


/* Problem 2 */

OPTION ps = 50 ls = 80 center nodate;

DATA fifa;
input game 
      @3 year 4.
      @8 date date9.
      +1 stage $ 17.
      Arg Ger 
      +1 Attendance comma7. ;
datalines;
1 1958 08Jun1958 1st Round, Group1 1 3 31,156
2 1966 16Jul1966 1st Round, Group2 0 0 46,587
3 1986 29Jun1986 Final Game        3 2 114,600
4 1990 08Jul1990 Final Game        0 1 73,603
5 2006 30Jun2006 1/4 Finals        1 1 72,000
6 2010 03Jul2010 1/4 Finals        0 4 64,100
7 2014 13Jul2014 Final Game        0 1 74,738
;

PROC print data = fifa;
FORMAT date date9. Attendance comma7.;
TITLE Germany vs Argentina in World Cup;
RUN;
