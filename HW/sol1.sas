/* Problem 1 */

/* Read in-stream data */

Libname MyLib1 'X:/STAT480/SAS library/MyLibrary1';
Libname MyLib2 'X:/STAT480/SAS library/MyLibrary2';

DATA MyLib1.liudat1;
	length Name $ 14;
	input Name $ Gender $ GPA SatMath SatVerbal;
	CARDS;
    BeckAnderson	Male	2.67   700	700
    DupontJules 	Female	2.98   700	500
    GavettiNicole	Female	2.67   470	470
    EastonMatthew	Male	3.6	   710	560
    MattiaceJohn  	Male	3.76   .    .
    ZhangChen	    Female	3.86   610	720
;

Title ClassSurvey;
PROC PRINT data=MyLib1.liudat1;
RUN;



/* Problem 2 */

/* Read the ClassSurvey.txt file */

FILENAME file1 'X:/STAT480/Data/ClassSurvey.txt';

DATA MyLib2.liudat1;
    infile file1
    delimiter=';' dsd  firstobs=3;
	length Name $ 10;
	length DivulgeCheating $ 18;
	input Name $ Gender $ GPA DivulgeCheating $ SatMath SatVerbal;

TITLE ClassSurveyTXT;
PROC Print data=MyLib2.liudat1;
RUN;




/* Read the ClassSurvey.CSV file */

FILENAME file2 'X:/STAT480/Data/ClassSurvey.csv';

DATA MyLib2.liudat2;
    infile file2
    delimiter=',' dsd  firstobs=3;
	length Name $ 10;
	length DivulgeCheating $ 18;
	input Name $ Gender $ GPA DivulgeCheating $ SatMath SatVerbal;

TITLE ClassSurveyCSV;
PROC Print data=MyLib2.liudat2;
RUN;




