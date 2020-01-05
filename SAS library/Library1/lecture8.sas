/* Lecture 8 */

OPTIONS ps = 58 ls = 160 nodate nonumber;

LIBNAME lib8 'X:\STAT480\SAS library\Library1\';

PROC PRINT data=lib8.penngolf;
RUN;

PROC REPORT data = lib8.penngolf nowindows headline headskip;
title 'Some Pennsylvania Golf Courses';
where Type in ('Private','Resort');
Run;



/* Example 1 : COLUMN statement */

PROC REPORT data=lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Name Year Type Par Yards;
  where Type in ('Private', 'Resort');
RUN;



/* Example 2 : DEFINE statement */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Name Year Type Slope Par Yards;
  define Yards / format = comma5.0 spacing = 5;
  define Type / width = 10 spacing = 6;
  define Slope / width = 5;
RUN;


/* Example 3: Headings and Justification */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Name Year Type Slope Par Yards;
  define Yards / format = comma5.0 'Total/Yardage' 
                 width = 7 spacing = 4 center;
  define Type / 'Type of/Course' spacing = 6 
                 width = 8 right;
RUN;




/* Example 4: Order Variables */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Par Name Year Type Yards;
  define Yards / order format = comma5.0 'Total/Yardage'
                 width = 7 spacing = 4 center;
  define Type / 'Type of/Course' spacing = 6 
                width = 8 center;
  define Par / order;
RUN;


/* Example 5: descending order */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Par Name Year Type Yards;
  define Yards / order format = comma5.0 'Total/Yardage'
                 width = 7 spacing = 4 center;
  define Type / 'Type of/Course' spacing = 6 
                width = 8 center;
  define Par / order descending;
RUN;


/* Example 6: group variable */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Type Par Yards;
  define Type / group 'Type of/Course';
  define Par / analysis 'Total/Par';
  define Yards / 'Total/Yardage';
RUN;



/* Example 7: more than one gropu variable */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Type Par Yards;
  define Type / group 'Type of/Course';
  define Par / group 'Total/Par';
  define Yards / 'Total/Yardage';
RUN;



/* Example 8: Statistic MEAN */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Average Size of Some PA Golf Courses by Type';
  column Type Par Yards;
  define Type / group 'Type of/Course'
                spacing = 6 width = 8;
  define Par / mean format= 4.1 'Average/Par'
               width = 7 center;
  define Yards / mean format = comma6.0 'Average/Yardage' 
                 width = 7 spacing = 4 center;
RUN;



/* Example 9: One-line report */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Size of Some PA Golf Courses';
  column Par Yards;
  define Par /  mean format= 4.1 'Average/Par'
                width = 7 center;
  define Yards / format = comma7.0 'Total/Yardage' 
                 width = 7 spacing = 4 center;
RUN;


/* Example 10: across variables */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Type Par Yards;
  define Type / across 'Type of/Course';
  define Par / analysis 'Total/Par';
  define Yards / 'Total/Yardage';
RUN;


/* Example 11 */

PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Type Par Yards;
  define Type / group 'Type of/Course';
  define Par / across 'Total/Par';
  define Yards / 'Total/Yardage';
RUN;



/* Example 12: Computed variables */


PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Name Slope USGA Bogey;
  define Bogey / computed 'Bogey/Rating' format = 7.3;
  define USGA / display format = 4.1 spacing = 5;
  define Slope / display;
  compute Bogey;
    Bogey = 0.186*Slope + USGA;
  endcomp;
RUN;


PROC REPORT data = lib8.penngolf nowindows headline;
  title 'Some Pennsylvania Golf Courses';
  column Name Slope USGA Bogey;
  define Bogey / computed 'Bogey/Rating' format = 7.3;
  define USGA / format = 4.1 spacing = 5;
  compute Bogey;
    Bogey = 0.186*Slope.sum + USGA.sum;
  endcomp;
RUN;




