/* List input and assignment statement*/
data grades;
input Name $ 1-8 Gender $ 10-15 Homework 17-19 Midterm 21-22 Final 24-25;
score1=0.4*Homework+0.2*Midterm+0.4*Final;
score2=0.4*Midterm+0.6*Final;
fs=max(Final,score1,score2);
newfs=0.7*fs+30;
rnewfs=round(newfs,5);

cards;
Beck     Male   90  88 75
Christal Female 100 85 80
Gavetti  Female 80  77 71
Easton   Male   90  82 76
Mattiace Male   60  67 53
Chen     Female 85  83 68
;

libname lib1 'X:\STAT480\SAS library\MyLibrary1';
data lib1.grades;                                                                                         /* This line is redundant */

Title Grades;
proc print data=grades;
    var Name Homework Midterm Final score1 score2 fs newfs rnewfs;
run;


/*formate input*/
data games;
input game
      @3 year 4.
      @8 date date9.
	  +1 stage $17.
	  Arg Ger
	  +1 attendance comma7.;
datalines;
1 1958 08Jun1958 1st Round, Group1 1 3 31,156
2 1966 16Jul1966 1st Round, Group2 0 0 46,587
3 1986 29Jun1986 Final Game        3 2 114,600
4 1990 08Jul1990 Final Game        0 1 73,603
5 2006 30Jun2006 1/4 Finals        1 1 72,000
6 2010 03Jul2010 1/4 Finals        0 4 64,100
7 2014 13Jul2014 Final Game        0 4 74,738
;

proc print data=games;
format date date9. attendance comma7.;
title 'Germany vs Argentina in World Cup';
option nodate center nonumber ps=50 ls=80;
run;

