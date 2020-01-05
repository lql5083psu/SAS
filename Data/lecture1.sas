/* Lecture 1 */

/* This is my first SAS code! */

DATA TestData;
	input Subject Gender $ Height Weight;
	DATALINES;
	1024 M 68.5 155
	1167 F 61.2 99  
	1168 F 63.0 115
	1201 M 70.0 205
	1302 M . 170
;

PROC PRINT data=TestData;
RUN;





/* Create a library called 'lib1' */

LIBNAME lib1 'X:\STAT480\SAS library\Library1';

PROC PRINT data=Work.TestData;
RUN;

PROC PRINT data=lib1.TestData;
RUN;
 
/* Store the data set in library lib1 */

DATA lib1.TestData;
	input Subject Gender $ Height Weight;
	DATALINES;
	1024 M 68.5 155
	1167 F 61.2 99  
	1168 F 63.0 115
	1201 M 70.0 205
	1302 M . 170
;

PROC PRINT data=lib1.TestData;
RUN;




/* We can read external files into SAS */

/* Read a .txt file */

DATA stu1;
    infile 'X:\STAT480\Data\student.txt';
    input subject gender $ height weight;
RUN;

PROC Print data=stu1;
RUN;

/* FILENAME statement */

FILENAME refstu 'X:\STAT480\Data\student.txt';

DATA stu2;
    infile refstu;
	input subject gender $ height weight;
RUN;

PROC PRINT data=stu2;
RUN;




/* Read a .CSV file */

DATA stu3;
    infile 'X:/STAT480/Data/student.csv'
    delimiter=',' dsd  firstobs=2;
	input subject gender $ height weight;

PROC Print data=stu3;
RUN;




/* Set statement */

LIBNAME lib2 'X:/STAT480/SAS library/Library2';

DATA lib2.stu4; 
   set stu3;
RUN;

PROC PRINT data=lib2.stu4;
RUN;

DATA lib2.stu5;
   set 'X:/STAT480/SAS library/Library2/stu4';
RUN;

PROC PRINT data=lib2.stu5;
RUN;

