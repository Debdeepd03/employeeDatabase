
SQL> CREATE TABLE DEPT_TEST(DEPTNO NUMBER(2) CONSTRAINT DEPT_PK PRIMARY KEY,DEPTNAME VARCHAR2(20) CONSTRAINT DEPT_DEPTNAME_U UNIQUE,HOD VARCHAR2(20));

Table created.

SQL> DESC DEPT_TEST
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTNO                                    NOT NULL NUMBER(2)
 DEPTNAME                                           VARCHAR2(20)
 HOD                                                VARCHAR2(20)

SQL> CREATE TABLE LEAVES(LEAVETYPE CHAR(1) CONSTRAINT LEAVES_PK PRIMARY KEY,LEAVENAME VARCHAR2(20),NOLEAVES NUMBER(2)CONSTRAINT LEAVES_NOLEAVES_CHK CHECK (
  2  NOLEAVES <= 20));

Table created.

SQL> DESC LEAVES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 LEAVETYPE                                 NOT NULL CHAR(1)
 LEAVENAME                                          VARCHAR2(20)
 NOLEAVES                                           NUMBER(2)

SQL> CREATE TABLE EMPLOYEE(EMPNO NUMBER(5) CONSTRAINT EMPLOYEE_PK PRIMARY KEY,EMPNAME VARCHAR2(20),SAL NUMBER(5) CONSTRAINT EMPLOYEE_SAL_CHK CHECK ( SAL >=
  2  1000),DEPTNO NUMBER(2) CONSTRAINT EMPLOYEE_DEPTNO_FK REFERENCES
  3  DEPT(DEPTNO),
  4   DESG VARCHAR2(20),
  5   DJ DATE,
  6  );
)
*
ERROR at line 6:
ORA-00931: missing identifier
ORA-03078: unexpected right parenthesis after ,
Help: https://docs.oracle.com/error-help/db/ora-00931/


SQL> CREATE TABLE EMPLOYEE
  2  (
  3   EMPNO NUMBER(5) CONSTRAINT EMPLOYEE_PK PRIMARY KEY,
  4   EMPNAME VARCHAR2(20),
  5   SAL NUMBER(5) CONSTRAINT EMPLOYEE_SAL_CHK CHECK ( SAL >=
  6  1000),
  7   DEPTNO NUMBER(2) CONSTRAINT EMPLOYEE_DEPTNO_FK REFERENCES
  8  DEPT(DEPTNO),
  9   DESG VARCHAR2(20),
 10   DJ DATE);
CREATE TABLE EMPLOYEE
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object
Help: https://docs.oracle.com/error-help/db/ora-00955/


SQL> DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;

Table dropped.

SQL>  CREATE TABLE EMPLOYEE
  2    2  (
  3    3   EMPNO NUMBER(5) CONSTRAINT EMPLOYEE_PK PRIMARY KEY,
  4    4   EMPNAME VARCHAR2(20),
  5    5   SAL NUMBER(5) CONSTRAINT EMPLOYEE_SAL_CHK CHECK ( SAL >=
  6    6  1000),
  7    7   DEPTNO NUMBER(2) CONSTRAINT EMPLOYEE_DEPTNO_FK REFERENCES
  8    8  DEPT(DEPTNO),
  9    9   DESG VARCHAR2(20),
 10  /ED
 11  );
  2  (
  *
ERROR at line 2:
ORA-00922: missing or invalid option
Help: https://docs.oracle.com/error-help/db/ora-00922/


SQL> CREATE TABLE EMPLOYEE
  2  (
  3   EMPNO NUMBER(5) CONSTRAINT EMPLOYEE_PK PRIMARY KEY,
  4   EMPNAME VARCHAR2(20),
  5   SAL NUMBER(5) CONSTRAINT EMPLOYEE_SAL_CHK CHECK ( SAL >=
  6  1000),
  7   DEPTNO NUMBER(2) CONSTRAINT EMPLOYEE_DEPTNO_FK REFERENCES
  8  DEPT(DEPTNO),
  9   DESG VARCHAR2(20),
 10   DJ DATE);

Table created.

SQL> DESC EMPLOYEE
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(5)
 EMPNAME                                            VARCHAR2(20)
 SAL                                                NUMBER(5)
 DEPTNO                                             NUMBER(2)
 DESG                                               VARCHAR2(20)
 DJ                                                 DATE

SQL> CREATE TABLE EMP_LEAVES
  2  (
  3   EMPNO NUMBER(5) CONSTRAINT EMP_LEAVES_EMPNO_FK REFERENCES
  4  EMPLOYEE(EMPNO),
  5   LEAVETYPE CHAR(1) CONSTRAINT EMP_LEAVES_LEAVETYPE_FK REFERENCES
  6  LEAVES(LEAVETYPE)
  7   CONSTRAINT EMP_LEAVES_LEAVETYPE_NN NOT NULL,
  8   STDATE DATE,
  9   ENDDATE DATE,
 10   CONSTRAINT EMP_LEAVES_PK PRIMARY KEY (EMPNO,STDATE),
 11   CONSTRAINT EMP_LEAVES_DATES_CHK CHECK (STDATE <= ENDDATE));

Table created.

SQL> DESC EMP_LEAVES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(5)
 LEAVETYPE                                 NOT NULL CHAR(1)
 STDATE                                    NOT NULL DATE
 ENDDATE                                            DATE

SQL> INSERT INTO LEAVES VALUES('S','SICK',15);

1 row created.

SQL> INSERT INTO LEAVES VALUES('C','CASUAL',15);

1 row created.

SQL> INSERT INTO LEAVES VALUES('E','EARNING',5);

1 row created.

SQL> INSERT INTO LEAVES VALUES('O','OVERTIME',5);

1 row created.

SQL> DESC LEAVES
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 LEAVETYPE                                 NOT NULL CHAR(1)
 LEAVENAME                                          VARCHAR2(20)
 NOLEAVES                                           NUMBER(2)

SQL> INSERT INTO DEPT VALUES(1,'MAINFRAME','GEORGE');

1 row created.

SQL> INSERT INTO DEPT VALUES(2,'CLIENT/SERVER','BILL');

1 row created.

SQL> INSERT INTO DEPT VALUES(3,'SYSTEMS','GARRY');

1 row created.

SQL>   2  INSERT INTO DEPT VALUES(4,'INTERNET','PAUL');
INSERT INTO DEPT VALUES(4,'INTERNET','PAUL')
*
ERROR at line 2:
ORA-03048: SQL reserved word 'INSERT' is not syntactically valid following
'...VALUES(3,'SYSTEMS','GARRY')
'
Help: https://docs.oracle.com/error-help/db/ora-03048/


SQL> INSERT INTO DEPT VALUES(4,'INTERNET','PAUL');

1 row created.

SQL> INSERT INTO DEPT VALUES(5,'ACCOUNTS','ANDY');

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(101,'GEORGE',12000,1,'12-JUL-2001','PM');
INSERT INTO EMPLOYEE VALUES(101,'GEORGE',12000,1,'12-JUL-2001','PM')
                                                               *
ERROR at line 1:
ORA-01858: A non-numeric character was found instead of a numeric character.
Help: https://docs.oracle.com/error-help/db/ora-01858/


SQL> INSERT INTO EMPLOYEE VALUES(101, 'GEORGE', 12000, 1, 'PM', TO_DATE('12-JUL-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(102, 'BILL', 12000, 2, 'PM', TO_DATE('14-JUL-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(103, 'GARRY', 15000, 3, 'PM', TO_DATE('1-JUL-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(104, 'PAUL', 11000, 4, 'PL', TO_DATE('2-JUL-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(105, 'ANDY', 7000, 5, 'AM', TO_DATE('25-JUN-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(106, 'KEATS', 10000, 1, 'SA', TO_DATE('17-JUL-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(107, 'JOEL', 8000, 2, 'SP', TO_DATE('15-JUL-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(108, 'ROBERTS', 7500, 2, 'PRO', TO_DATE('15-JUL-2001', 'DD-MON-YYYY')
  2  );

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(109, 'HERBERT', 8000, 4, 'SA', TO_DATE('22-JUL-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMPLOYEE VALUES(110, 'MICHEAL', 6000, 4, 'PRO', TO_DATE('15-JUL-2001', 'DD-MON-YYYY'));

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(102,'S','23-JUL-2001','25-JUL-2001');

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(104,'C','24-JUL-2001','25-JUL-2001');

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(104,'S','28-JUL-2001','29-JUL-2001');

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(101,'C','27-JUL-2001','28-JUL-2001');

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(106,'O','28-JUL-2001','29-JUL-2001');

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(109,'C','1-AUG-2001','2-AUG-2001');

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(103,'C','2-AUG-2001','5-AUG-2001');

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(105,'S','17-AUG-2001',NULL);

1 row created.

SQL> INSERT INTO EMP_LEAVES VALUES(108,'S','23-AUG-2001',NULL);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SET PAGESIZE 200
SQL> SET LINE 100
SQL>
SQL>
SQL>
SQL>
SQL> SELECT * FROM EMPLOYEE
  2  ;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       103 GARRY                     15000          3 PM                   01-JUL-01
       104 PAUL                      11000          4 PL                   02-JUL-01
       105 ANDY                       7000          5 AM                   25-JUN-01
       106 KEATS                     10000          1 SA                   17-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01
       110 MICHEAL                    6000          4 PRO                  15-JUL-01

10 rows selected.

SQL> SELECT * FROM EMPLOYEE_LEAVES;
SELECT * FROM EMPLOYEE_LEAVES
              *
ERROR at line 1:
ORA-00942: table or view "C##SCOTT"."EMPLOYEE_LEAVES" does not exist
Help: https://docs.oracle.com/error-help/db/ora-00942/


SQL> SELECT * FROM LEAVES;

L LEAVENAME              NOLEAVES
- -------------------- ----------
S SICK                         15
C CASUAL                       15
E EARNING                       5
O OVERTIME                      5

SQL> SP2-0042: unknown command "S" - rest of line ignored.
^C
E:\sqlcv>S
'S' is not recognized as an internal or external command,
operable program or batch file.

E:\sqlcv>sqlplus

SQL*Plus: Release 23.0.0.0.0 - Production on Sun Aug 10 10:23:58 2025
Version 23.4.0.24.05

Copyright (c) 1982, 2024, Oracle.  All rights reserved.

Enter user-name: c##scott/tiger
Last Successful login time: Sun Aug 10 2025 09:43:39 +05:30

Connected to:
Oracle Database 23ai Free Release 23.0.0.0.0 - Production
Version 23.4.0.24.05

SQL> spool on
SQL> SELECT * FROM EMPLOYEE
  2  WHERE TRUNC(SYSDATE) = TRUNC(DJ);

no rows selected

SQL> SELECT * FROM EMPLOYEE
  2  WHERE TO_DATE('15-JUL-2001', 'DD-MON-YYYY') - DJ <= 15;

     EMPNO EMPNAME                     SAL     DEPTNO DESG
---------- -------------------- ---------- ---------- --------------------
DJ
---------
       101 GEORGE                    12000          1 PM
12-JUL-01

       102 BILL                      12000          2 PM
14-JUL-01

       103 GARRY                     15000          3 PM
01-JUL-01


     EMPNO EMPNAME                     SAL     DEPTNO DESG
---------- -------------------- ---------- ---------- --------------------
DJ
---------
       104 PAUL                      11000          4 PL
02-JUL-01

       106 KEATS                     10000          1 SA
17-JUL-01

       107 JOEL                       8000          2 SP
15-JUL-01


     EMPNO EMPNAME                     SAL     DEPTNO DESG
---------- -------------------- ---------- ---------- --------------------
DJ
---------
       108 ROBERTS                    7500          2 PRO
15-JUL-01

       109 HERBERT                    8000          4 SA
22-JUL-01

       110 MICHEAL                    6000          4 PRO
15-JUL-01


9 rows selected.

SQL> set line 100
SQL> set pagesize 200
SQL> WHERE TO_DATE('15-JUL-2001', 'DD-MON-YYYY') - DJ <= 15;
SP2-0734: unknown command beginning "WHERE TO_D..." - rest of line ignored.
Help: https://docs.oracle.com/error-help/db/sp2-0734/
SQL> SELECT * FROM EMPLOYEE
  2  WHERE TO_DATE('15-JUL-2001', 'DD-MON-YYYY') - DJ <= 15;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       103 GARRY                     15000          3 PM                   01-JUL-01
       104 PAUL                      11000          4 PL                   02-JUL-01
       106 KEATS                     10000          1 SA                   17-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01
       110 MICHEAL                    6000          4 PRO                  15-JUL-01

9 rows selected.

SQL> SELECT * FROM EMPLOYEE
  2  WHERE TRUNC(DJ) = TO_DATE('12-JUL-2001', 'DD-MON-YYYY');

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01

SQL> SELECT * FROM EMPLOYEE
  2  WHERE DJ BETWEEN TO_DATE('25-JUL-2001', 'DD-MON-YYYY') AND TO_DATE('31-JUL-2001', 'DD-MON-YYYY');

no rows selected

SQL> SELECT * FROM EMPLOYEE
  2  WHERE DJ BETWEEN TO_DATE('15-JUL-2001', 'DD-MON-YYYY') AND TO_DATE('22-JUL-2001', 'DD-MON-YYYY');

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       106 KEATS                     10000          1 SA                   17-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01
       110 MICHEAL                    6000          4 PRO                  15-JUL-01

SQL> SELECT EMPNAME, TO_CHAR(LAST_DAY(DJ) + 1, 'DD-MON-YYYY') AS "FIRST SALARY DATE"
  2  FROM EMPLOYEE
  3  WHERE EMPNO = 102;

EMPNAME              FIRST SALARY DATE
-------------------- --------------------
BILL                 01-AUG-2001

SQL> SELECT * FROM EMPLOYEE
  2  WHERE TO_CHAR(SYSDATE, 'MMYYYY') = TO_CHAR(DJ, 'MMYYYY');

no rows selected

SQL> SELECT * FROM EMPLOYEE
  2  WHERE TO_CHAR(TO_DATE('15-JUL-2001', 'DD-MON-YYYY'), 'MMYYYY') = TO_CHAR(DJ, 'MMYYYY');

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       103 GARRY                     15000          3 PM                   01-JUL-01
       104 PAUL                      11000          4 PL                   02-JUL-01
       106 KEATS                     10000          1 SA                   17-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01
       110 MICHEAL                    6000          4 PRO                  15-JUL-01

9 rows selected.

SQL> DELETE FROM EMPLOYEE
  2  WHERE DJ BETWEEN TO_DATE('24-JUN-2001', 'DD-MON-YYYY') AND TO_DATE('30-JUN-2001', 'DD-MON-YYYY');
DELETE FROM EMPLOYEE
*
ERROR at line 1:
ORA-02292: integrity constraint (C##SCOTT.EMP_LEAVES_EMPNO_FK) violated - child record found
Help: https://docs.oracle.com/error-help/db/ora-02292/


SQL>  DELETE FROM EMPLOYEE  WHERE DJ BETWEEN TO_DATE('24-JUN-2001', 'DD-MON-YYYY') AND TO_DATE('30-JUN-2001', 'DD-MON-YYYY');
 DELETE FROM EMPLOYEE  WHERE DJ BETWEEN TO_DATE('24-JUN-2001', 'DD-MON-YYYY') AND TO_DATE('30-JUN-2001', 'DD-MON-YYYY')
*
ERROR at line 1:
ORA-02292: integrity constraint (C##SCOTT.EMP_LEAVES_EMPNO_FK) violated - child record found
Help: https://docs.oracle.com/error-help/db/ora-02292/


SQL> SELECT * FROM EMP_LEAVES
  2  WHERE EMPNO IN (
  3    SELECT EMPNO FROM EMPLOYEE
  4    WHERE DJ BETWEEN TO_DATE('24-JUN-2001', 'DD-MON-YYYY') AND TO_DATE('30-JUN-2001', 'DD-MON-YYYY')
  5  );

     EMPNO L STDATE    ENDDATE
---------- - --------- ---------
       105 S 17-AUG-01

SQL> DELETE FROM EMP_LEAVES
  2  WHERE EMPNO IN (
  3    SELECT EMPNO FROM EMPLOYEE
  4    WHERE DJ BETWEEN TO_DATE('24-JUN-2001', 'DD-MON-YYYY') AND TO_DATE('30-JUN-2001', 'DD-MON-YYYY')
  5  );

1 row deleted.

SQL> DELETE FROM EMPLOYEE
  2  WHERE DJ BETWEEN TO_DATE('24-JUN-2001', 'DD-MON-YYYY') AND TO_DATE('30-JUN-2001', 'DD-MON-YYYY');

1 row deleted.

SQL> SELECT * FROM EMPLOYEE
  2  WHERE SAL BETWEEN 12000 AND 14000;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01

SQL> SELECT * FROM EMPLOYEE
  2  WHERE DEPTNO IN (1, 3);

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       103 GARRY                     15000          3 PM                   01-JUL-01
       106 KEATS                     10000          1 SA                   17-JUL-01

SQL> SELECT EMPNAME
  2  FROM EMPLOYEE
  3  WHERE EMPNAME LIKE 'M%';

EMPNAME
--------------------
MICHEAL

SQL> DELETE FROM EMPLOYEE
  2  WHERE EMPNAME LIKE '%A%';
DELETE FROM EMPLOYEE
*
ERROR at line 1:
ORA-02292: integrity constraint (C##SCOTT.EMP_LEAVES_EMPNO_FK) violated - child record found
Help: https://docs.oracle.com/error-help/db/ora-02292/


SQL> DELETE FROM EMP_LEAVES
  2  WHERE EMPNO IN (
  3    SELECT EMPNO FROM EMPLOYEE
  4    WHERE UPPER(EMPNAME) LIKE '%A%'
  5  );

4 rows deleted.

SQL> DELETE FROM EMPLOYEE
  2  WHERE UPPER(EMPNAME) LIKE '%A%';

4 rows deleted.

SQL> SELECT * FROM EMPLOYEE
  2  WHERE EMPNAME LIKE '_S%';

no rows selected

SQL> select * from EMPLOYEE
  2  ;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01

SQL> SELECT * FROM EMPLOYEE WHERE EMPNAME LIKE '_E%';

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01

SQL> SELECT * FROM EMPLOYEE
  2  WHERE SAL IS NULL;

no rows selected

SQL> SELECT * FROM EMPLOYEE
  2  WHERE TO_DATE('15-JUL-2001', 'DD-MON-YYYY') - DJ <= 20;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01

SQL> SELECT *
  2  FROM EMP_LEAVES
  3  WHERE ENDDATE - STDATE > 10;

no rows selected

SQL> SELECT * FROM EMP_LEAVES;

     EMPNO L STDATE    ENDDATE
---------- - --------- ---------
       102 S 23-JUL-01 25-JUL-01
       101 C 27-JUL-01 28-JUL-01
       109 C 01-AUG-01 02-AUG-01
       108 S 23-AUG-01

SQL> WHERE ENDDATE - STDATE > 1;
SP2-0734: unknown command beginning "WHERE ENDD..." - rest of line ignored.
Help: https://docs.oracle.com/error-help/db/sp2-0734/
SQL> SELECT FROM EMP_LEAVES WHERE ENDDATE - STDATE > 1;
SELECT FROM EMP_LEAVES WHERE ENDDATE - STDATE > 1
       *
ERROR at line 1:
ORA-00936: missing expression
Help: https://docs.oracle.com/error-help/db/ora-00936/


SQL> SELECT * FROM EMP_LEAVES WHERE ENDDATE - STDATE > 1;

     EMPNO L STDATE    ENDDATE
---------- - --------- ---------
       102 S 23-JUL-01 25-JUL-01

SQL> SELECT EMPNO, EMPNAME, DJ,
  2         ROUND(MONTHS_BETWEEN(SYSDATE, DJ), 0) AS EXPERIENCE_MONTHS,
  3         SAL
  4  FROM EMPLOYEE;

     EMPNO EMPNAME              DJ        EXPERIENCE_MONTHS        SAL
---------- -------------------- --------- ----------------- ----------
       101 GEORGE               12-JUL-01               289      12000
       102 BILL                 14-JUL-01               289      12000
       107 JOEL                 15-JUL-01               289       8000
       108 ROBERTS              15-JUL-01               289       7500
       109 HERBERT              22-JUL-01               289       8000

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE SAL > 10000
  4    AND LENGTH(DESG) > 3;

no rows selected

SQL> DESC DESG
ERROR:
ORA-04043: Object DESG does not exist.
Help: https://docs.oracle.com/error-help/db/ora-04043/


SQL> SELECT * FROM DESG
  2  ;
SELECT * FROM DESG
              *
ERROR at line 1:
ORA-00942: table or view "C##SCOTT"."DESG" does not exist
Help: https://docs.oracle.com/error-help/db/ora-00942/


SQL> DESC EMPLOYEE;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPNO                                                 NOT NULL NUMBER(5)
 EMPNAME                                                        VARCHAR2(20)
 SAL                                                            NUMBER(5)
 DEPTNO                                                         NUMBER(2)
 DESG                                                           VARCHAR2(20)
 DJ                                                             DATE

SQL> SELECT * FROM EMPLOYEE;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE SAL > 10000
  4    AND LENGTH(DESG) > 3;

no rows selected

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE SAL > 10000
  4    AND LENGTH(DESG) >= 3;

no rows selected

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE SAL > 10000
  4    AND LENGTH(DESG) >=2;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE SAL > 10000
  4    OR LENGTH(DESG) >= 3;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01

SQL> SELECT * FROM EMPLOYEE
  2  WHERE INSTR(EMPNAME, ' ', 1, 2) <> 0;

no rows selected

SQL>  SELECT * FROM EMPLOYEE WHERE INSTR(EMPNAME, ' ', 1, 6) <> 0;

no rows selected

SQL> SELECT * FROM EMP_LEAVES
  2  WHERE STDATE BETWEEN LAST_DAY(ADD_MONTHS(STDATE, -2)) + 1 AND LAST_DAY(ADD_MONTHS(STDATE, -1)) + 1
  3    AND ENDDATE IS NULL;

no rows selected

SQL> SELECT * FROM EMP_LEAVES
  2  WHERE STDATE BETWEEN TRUNC(ADD_MONTHS(SYSDATE, -1), 'MM')
  3                   AND LAST_DAY(ADD_MONTHS(SYSDATE, -1))
  4    AND ENDDATE IS NULL;

no rows selected

SQL> SELECT * FROM EMPLOYEE
  2  WHERE SAL > 10000 OR DESG = 'PL' AND MONTHS_BETWEEN(SYSDATE, DJ) > 36;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01

SQL> SELECT * FROM EMPLOYEE
  2  WHERE (SAL > 10000 OR DESG = 'PL')
  3    AND MONTHS_BETWEEN(SYSDATE, DJ) > 36;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01

SQL> SELECT SUBSTR(EMPNAME, 1, INSTR(EMPNAME, ' ') - 1) FNAME, LAST_DAY(DJ) + 1
  2  FROM EMPLOYEE;

FNAME                                                                            LAST_DAY(
-------------------------------------------------------------------------------- ---------
                                                                                 01-AUG-01
                                                                                 01-AUG-01
                                                                                 01-AUG-01
                                                                                 01-AUG-01
                                                                                 01-AUG-01

SQL> SELECT EMPNO,
  2         EMPNAME,
  3         CASE
  4           WHEN INSTR(EMPNAME, ' ') > 0 THEN SUBSTR(EMPNAME, 1, INSTR(EMPNAME, ' ') - 1)
  5           ELSE EMPNAME
  6         END AS FNAME,
  7         TO_CHAR(LAST_DAY(DJ) + 1, 'DD-MON-YYYY') AS FIRST_SALARY_DATE
  8  FROM EMPLOYEE;

     EMPNO EMPNAME
---------- --------------------
FNAME
--------------------------------------------------------------------------------
FIRST_SALARY_DATE
--------------------
       101 GEORGE
GEORGE
01-AUG-2001

       102 BILL
BILL
01-AUG-2001

       107 JOEL
JOEL
01-AUG-2001

       108 ROBERTS
ROBERTS
01-AUG-2001

       109 HERBERT
HERBERT
01-AUG-2001


SQL> SET LINE 100
SQL> SET PAGESIZE 200
SQL> SELECT EMPNO,
  2         EMPNAME,
  3         CASE
  4           WHEN INSTR(EMPNAME, ' ') > 0 THEN SUBSTR(EMPNAME, 1, INSTR(EMPNAME, ' ') - 1)
  5           ELSE EMPNAME
  6         END AS FNAME,
  7         TO_CHAR(LAST_DAY(DJ) + 1, 'DD-MON-YYYY') AS FIRST_SALARY_DATE
  8  FROM EMPLOYEE;

     EMPNO EMPNAME
---------- --------------------
FNAME
--------------------------------------------------------------------------------
FIRST_SALARY_DATE
--------------------
       101 GEORGE
GEORGE
01-AUG-2001

       102 BILL
BILL
01-AUG-2001

       107 JOEL
JOEL
01-AUG-2001

       108 ROBERTS
ROBERTS
01-AUG-2001

       109 HERBERT
HERBERT
01-AUG-2001


SQL> SELECT DEPTNO, AVG(SAL) AS AVG_SALARY
  2  FROM EMPLOYEE
  3  WHERE SAL > 10000
  4  GROUP BY DEPTNO;

    DEPTNO AVG_SALARY
---------- ----------
         1      12000
         2      12000

SQL> SELECT EMPNO,
  2         EMPNAME,
  3         DEPTNO,
  4         SAL,
  5         CASE
  6           WHEN DEPTNO = 1 THEN SAL * 1.0
  7           ELSE SAL * 0.75
  8         END AS BONUS
  9  FROM EMPLOYEE;

     EMPNO EMPNAME                  DEPTNO        SAL      BONUS
---------- -------------------- ---------- ---------- ----------
       101 GEORGE                        1      12000      12000
       102 BILL                          2      12000       9000
       107 JOEL                          2       8000       6000
       108 ROBERTS                       2       7500       5625
       109 HERBERT                       4       8000       6000

SQL> SELECT EMPNO, EMPNAME, DESG, DJ, SAL, SAL * DECODE(DEPTNO, 1, 1.0, 0.75) AS BONUS
  2  FROM EMPLOYEE;

     EMPNO EMPNAME              DESG                 DJ               SAL      BONUS
---------- -------------------- -------------------- --------- ---------- ----------
       101 GEORGE               PM                   12-JUL-01      12000      12000
       102 BILL                 PM                   14-JUL-01      12000       9000
       107 JOEL                 SP                   15-JUL-01       8000       6000
       108 ROBERTS              PRO                  15-JUL-01       7500       5625
       109 HERBERT              SA                   22-JUL-01       8000       6000

SQL> SELECT * FROM EMP_LEAVES
  2  WHERE LEAVETYPE = 'S'
  3    AND TO_CHAR(STDATE, 'fmDAY') = 'MONDAY';

     EMPNO L STDATE    ENDDATE
---------- - --------- ---------
       102 S 23-JUL-01 25-JUL-01

SQL> SELECT EMPNO, SUM(ENDDATE - STDATE) AS "NO LEAVES"
  2  FROM EMP_LEAVES
  3  GROUP BY EMPNO;

     EMPNO  NO LEAVES
---------- ----------
       102          2
       101          1
       109          1
       108

SQL> SELECT DESG, SUM(SAL) AS TOTAL_SALARY
  2  FROM EMPLOYEE
  3  GROUP BY DESG;

DESG                 TOTAL_SALARY
-------------------- ------------
PM                          24000
SP                           8000
PRO                          7500
SA                           8000

SQL> SELECT DEPTNO, DESG, SUM(SAL) AS TOTAL_SALARY
  2  FROM EMPLOYEE
  3  GROUP BY DEPTNO, DESG;

    DEPTNO DESG                 TOTAL_SALARY
---------- -------------------- ------------
         1 PM                          12000
         2 PM                          12000
         2 SP                           8000
         2 PRO                          7500
         4 SA                           8000

SQL> SELECT DEPTNO, AVG(SAL) AS AVG_SALARY
  2  FROM EMPLOYEE
  3  WHERE SAL > 10000
  4  GROUP BY DEPTNO;

    DEPTNO AVG_SALARY
---------- ----------
         1      12000
         2      12000

SQL> SELECT MAX(SAL) AS MAX_SALARY
  2  FROM EMPLOYEE;

MAX_SALARY
----------
     12000

SQL> SELECT EMPNO, LEAVETYPE, SUM(ENDDATE - STDATE) AS "NO. LEAVES"
  2  FROM EMP_LEAVES
  3  GROUP BY EMPNO, LEAVETYPE;

     EMPNO L NO. LEAVES
---------- - ----------
       102 S          2
       101 C          1
       109 C          1
       108 S

SQL> SELECT DEPTNO,
  2         MIN(SAL) AS MIN_SALARY,
  3         MAX(SAL) AS MAX_SALARY,
  4         MAX(SAL) - MIN(SAL) AS SALARY_DIFF
  5  FROM EMPLOYEE
  6  GROUP BY DEPTNO
  7  HAVING COUNT(*) > 2;

    DEPTNO MIN_SALARY MAX_SALARY SALARY_DIFF
---------- ---------- ---------- -----------
         2       7500      12000        4500

SQL> SELECT LEAVETYPE, EMPNO, COUNT(*) AS LEAVE_COUNT
  2  FROM EMP_LEAVES
  3  GROUP BY LEAVETYPE, EMPNO;

L      EMPNO LEAVE_COUNT
- ---------- -----------
S        102           1
C        101           1
C        109           1
S        108           1

SQL> SELECT EMPNO
  2  FROM EMP_LEAVES
  3  WHERE TO_CHAR(STDATE, 'MMYYYY') = TO_CHAR(SYSDATE, 'MMYYYY')
  4  GROUP BY EMPNO
  5  HAVING SUM(ENDDATE - STDATE) > 2;

no rows selected

SQL> SELECT DESG
  2  FROM EMPLOYEE
  3  GROUP BY DESG
  4  HAVING COUNT(*) > 5 OR AVG(SAL) > 12000;

no rows selected

SQL> SELECT LEAVETYPE
  2  FROM EMP_LEAVES
  3  GROUP BY LEAVETYPE
  4  HAVING COUNT(DISTINCT EMPNO) > 3;

no rows selected

SQL> SELECT LEAVETYPE
  2  FROM EMP_LEAVES
  3  GROUP BY LEAVETYPE
  4  HAVING COUNT(DISTINCT EMPNO) > 1;

L
-
S
C

SQL> SELECT E.EMPNO, E.EMPNAME, E.DJ, D.DEPTNAME, E.SAL, D.HOD
  2  FROM EMPLOYEE E
  3  JOIN DEPT D ON E.DEPTNO = D.DEPTNO;
SELECT E.EMPNO, E.EMPNAME, E.DJ, D.DEPTNAME, E.SAL, D.HOD
                                                    *
ERROR at line 1:
ORA-00904: "D"."HOD": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT E.EMPNO, E.EMPNAME, E.DJ, D.DEPTNAME, E.SAL
  2  FROM EMPLOYEE E
  3  JOIN DEPT D ON E.DEPTNO = D.DEPTNO;
SELECT E.EMPNO, E.EMPNAME, E.DJ, D.DEPTNAME, E.SAL
                                 *
ERROR at line 1:
ORA-00904: "D"."DEPTNAME": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT E.EMPNO, E.EMPNAME, E.DJ, D.DEPTNAME, E.SAL
  2  FROM EMPLOYEE E
  3  JOIN DEPT_TEST D ON E.DEPTNO = D.DEPTNO;

no rows selected

SQL> SELECT EL.EMPNO, EL.STDATE, EL.ENDDATE, L.LEAVENAME
  2  FROM EMP_LEAVES EL
  3  JOIN LEAVES L ON EL.LEAVETYPE = L.LEAVETYPE
  4  WHERE EL.ENDDATE IS NOT NULL;

     EMPNO STDATE    ENDDATE   LEAVENAME
---------- --------- --------- --------------------
       102 23-JUL-01 25-JUL-01 SICK
       101 27-JUL-01 28-JUL-01 CASUAL
       109 01-AUG-01 02-AUG-01 CASUAL

SQL> SELECT E.DEPTNO, D.DEPTNAME, E.EMPNAME,
  2         TRUNC(MONTHS_BETWEEN(SYSDATE, E.DJ) / 12) AS YEARS_OF_EXPERIENCE
  3  FROM EMPLOYEE E
  4  JOIN DEPT D ON E.DEPTNO = D.DEPTNO
  5  0;
0
*
ERROR at line 5:
ORA-03047: number '0' is not syntactically valid following '...DEPT D ON E.DEPTNO = D.DEPTNO
'
Help: https://docs.oracle.com/error-help/db/ora-03047/


SQL> ED
Wrote file afiedt.buf

  1  SELECT E.DEPTNO, D.DEPTNAME, E.EMPNAME,
  2         TRUNC(MONTHS_BETWEEN(SYSDATE, E.DJ) / 12) AS YEARS_OF_EXPERIENCE
  3  FROM EMPLOYEE E
  4* JOIN DEPT_TEST D ON E.DEPTNO = D.DEPTNO WHERE E.DESG = 'PRO';
  5
SQL>
SQL> SELECT E.DEPTNO, D.DEPTNAME, E.EMPNAME,
  2         TRUNC(MONTHS_BETWEEN(SYSDATE, E.DJ) / 12) AS YEARS_OF_EXPERIENCE
  3  FROM EMPLOYEE E
  4  JOIN DEPT_TEST D ON E.DEPTNO = D.DEPTNO
  5  WHERE E.DESG = 'PRO';

no rows selected

SQL> SELECT * FROM DEPT_TEST WHERE ROWNUM = 1;

no rows selected

SQL> INSERT INTO DEPT_TEST (DEPTNO, DEPTNAME) VALUES (1, 'HR');

1 row created.

SQL> INSERT INTO DEPT_TEST (DEPTNO, DEPTNAME) VALUES (2, 'Finance');

1 row created.

SQL> INSERT INTO DEPT_TEST (DEPTNO, DEPTNAME) VALUES (3, 'IT');

1 row created.

SQL> COMMIT
  2  ;

Commit complete.

SQL> SELECT E.DEPTNO, D.DEPTNAME, E.EMPNAME,
  2         TRUNC(MONTHS_BETWEEN(SYSDATE, E.DJ) / 12) AS YEARS_OF_EXPERIENCE
  3  FROM EMPLOYEE E
  4  JOIN DEPT_TEST D ON E.DEPTNO = D.DEPTNO
  5  WHERE E.DESG = 'PRO';

    DEPTNO DEPTNAME             EMPNAME              YEARS_OF_EXPERIENCE
---------- -------------------- -------------------- -------------------
         2 Finance              ROBERTS                               24

SQL> SELECT EL.EMPNO, E.EMPNAME, D.DEPTNAME, L.LEAVENAME, EL.STDATE, EL.NOLEAVES
  2  FROM EMPLOYEE E, DEPT D, EMP_LEAVES EL, LEAVES L
  3  WHERE E.DEPTNO = D.DEPTNO
  4    AND EL.LEAVETYPE = L.LEAVETYPE
  5    AND EL.EMPNO = E.EMPNO;
SELECT EL.EMPNO, E.EMPNAME, D.DEPTNAME, L.LEAVENAME, EL.STDATE, EL.NOLEAVES
                                                                *
ERROR at line 1:
ORA-00904: "EL"."NOLEAVES": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT EL.EMPNO, E.EMPNAME, D.DEPTNAME, L.LEAVENAME, EL.STDATE, EL.NOLEAVES
  2  FROM EMPLOYEE E
  3  JOIN DEPT_TEST D ON E.DEPTNO = D.DEPTNO
  4  JOIN EMP_LEAVES EL ON EL.EMPNO = E.EMPNO
  5  JOIN LEAVES L ON EL.LEAVETYPE = L.LEAVETYPE;
SELECT EL.EMPNO, E.EMPNAME, D.DEPTNAME, L.LEAVENAME, EL.STDATE, EL.NOLEAVES
                                                                *
ERROR at line 1:
ORA-00904: "EL"."NOLEAVES": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT EL.*
  2  FROM EMP_LEAVES EL
  3  JOIN EMPLOYEE E ON EL.EMPNO = E.EMPNO
  4  JOIN DEPT_TEST D ON E.DEPTNO = D.DEPTNO
  5  WHERE D.HOD = 'DUKE';

no rows selected

SQL> DESC EMP_LEAVES;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPNO                                                 NOT NULL NUMBER(5)
 LEAVETYPE                                             NOT NULL CHAR(1)
 STDATE                                                NOT NULL DATE
 ENDDATE                                                        DATE

SQL> SELECT EL.EMPNO,
  2         E.EMPNAME,
  3         D.DEPTNAME,
  4         L.LEAVENAME,
  5         EL.STDATE,
  6         MAX(NVL(EL.ENDDATE, SYSDATE) - EL.STDATE) OVER (PARTITION BY EL.LEAVETYPE) AS MAX_LEAVES_IN_CATEGORY
  7  FROM EMP_LEAVES EL
  8  JOIN EMPLOYEE E ON EL.EMPNO = E.EMPNO
  9  JOIN DEPT_TEST D ON E.DEPTNO = D.DEPTNO
 10  JOIN LEAVES L ON EL.LEAVETYPE = L.LEAVETYPE;

     EMPNO EMPNAME              DEPTNAME             LEAVENAME            STDATE
---------- -------------------- -------------------- -------------------- ---------
MAX_LEAVES_IN_CATEGORY
----------------------
       101 GEORGE               HR                   CASUAL               27-JUL-01
                     1

       108 ROBERTS              Finance              SICK                 23-AUG-01
            8753.48626

       102 BILL                 Finance              SICK                 23-JUL-01
            8753.48626


SQL> SELECT E1.*
  2  FROM EMPLOYEE E1
  3  JOIN EMPLOYEE E2 ON 1=1
  4  WHERE E2.EMPNAME = 'BILL'
  5    AND E1.DJ > E2.DJ;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE EMPNO IN (
  4      SELECT EMPNO
  5      FROM EMP_LEAVES
  6      WHERE TO_CHAR(SYSDATE, 'MMYYYY') = TO_CHAR(STDATE, 'MMYYYY')
  7  );

no rows selected

SQL> SELECT *
  2  FROM DEPT_TEST  -- Assuming your department table is DEPT_TEST, not DEPT
  3  WHERE DEPTNO IN (
  4      SELECT DEPTNO
  5      FROM EMPLOYEE
  6      GROUP BY DEPTNO
  7      HAVING COUNT(*) > 2
  8  );

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         2 Finance

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE EMPNAME IN (
  4      SELECT HOD
  5      FROM DEPT_TEST
  6  );

no rows selected

SQL> SELECT * FROM DEPT_TEST;

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         1 HR
         2 Finance
         3 IT

SQL> UPDATE DEPT_TEST
  2  SET HOD = 'GEORGE'
  3  WHERE DEPTNO = 1;

1 row updated.

SQL> UPDATE DEPT_TEST
  2  SET HOD = 'BILL'
  3  WHERE DEPTNO = 2;

1 row updated.

SQL> UPDATE DEPT_TEST
  2  SET HOD = 'GARRY'
  3  WHERE DEPTNO = 3;

1 row updated.

SQL> COMMIT;

Commit complete.

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE EMPNAME IN (
  4      SELECT HOD
  5      FROM DEPT_TEST
  6  );

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01

SQL> SELECT EL.EMPNO, SUM(NVL(EL.ENDDATE, SYSDATE) - EL.STDATE) AS NOOFLEAVES
  2  FROM EMP_LEAVES EL
  3  WHERE EL.EMPNO IN (
  4      SELECT E.EMPNO
  5      FROM EMPLOYEE E
  6      WHERE E.DEPTNO IN (
  7          SELECT D.DEPTNO
  8          FROM DEPT_TEST D
  9          WHERE D.HOD = 'STEVE'
 10      )
 11  )
 12  GROUP BY EL.EMPNO;

no rows selected

SQL> SELECT EL.EMPNO, SUM(NVL(EL.ENDDATE, SYSDATE) - EL.STDATE) AS NOOFLEAVES
  2  FROM EMP_LEAVES EL
  3  WHERE EL.EMPNO IN (
  4      SELECT E.EMPNO
  5      FROM EMPLOYEE E
  6      WHERE E.DEPTNO IN (
  7          SELECT D.DEPTNO
  8          FROM DEPT_TEST D
  9          WHERE D.HOD = 'BILL'
 10      )
 11  )
 12  GROUP BY EL.EMPNO;

     EMPNO NOOFLEAVES
---------- ----------
       102          2
       108 8753.49144

SQL> SELECT *
  2  FROM EMPLOYEE E
  3  WHERE 2 > (
  4      SELECT COUNT(*)
  5      FROM EMPLOYEE
  6      WHERE SAL > E.SAL
  7  );

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01

SQL> SELECT *
  2  FROM DEPT_TEST
  3  WHERE DEPTNO IN (
  4      SELECT E.DEPTNO
  5      FROM EMPLOYEE E
  6      WHERE E.EMPNO IN (
  7          SELECT EL.EMPNO
  8          FROM EMP_LEAVES EL
  9          GROUP BY EL.EMPNO
 10          HAVING SUM(NVL(EL.ENDDATE, SYSDATE) - EL.STDATE) > (
 11              SELECT AVG(TOTAL_LEAVES)
 12              FROM (
 13                  SELECT SUM(NVL(ENDDATE, SYSDATE) - STDATE) AS TOTAL_LEAVES
 14                  FROM EMP_LEAVES EL2
 15                  JOIN EMPLOYEE E2 ON EL2.EMPNO = E2.EMPNO
 16                  WHERE TO_CHAR(E2.DJ, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')
 17                  GROUP BY EL2.EMPNO
 18              )
 19          )
 20      )
 21  );

no rows selected

SQL> SELECT *
  2  FROM DEPT_TEST
  3  WHERE DEPTNO IN (
  4      SELECT E.DEPTNO
  5      FROM EMPLOYEE E
  6      WHERE E.EMPNO IN (
  7          SELECT EL.EMPNO
  8          FROM EMP_LEAVES EL
  9          GROUP BY EL.EMPNO
 10          HAVING SUM(NVL(EL.ENDDATE, TO_DATE('31-DEC-2001', 'DD-MON-YYYY')) - EL.STDATE) > (
 11              SELECT AVG(TOTAL_LEAVES)
 12              FROM (
 13                  SELECT SUM(NVL(ENDDATE, TO_DATE('31-DEC-2001', 'DD-MON-YYYY')) - STDATE) AS TOTAL_LEAVES
 14                  FROM EMP_LEAVES EL2
 15                  JOIN EMPLOYEE E2 ON EL2.EMPNO = E2.EMPNO
 16                  WHERE TO_CHAR(E2.DJ, 'YYYY') = '2001'
 17                  GROUP BY EL2.EMPNO
 18              )
 19          )
 20      )
 21  );

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         2 Finance              BILL

SQL> SELECT COUNT(*)
  2  FROM EMPLOYEE
  3  WHERE SAL > (
  4      SELECT AVG(SAL)
  5      FROM EMPLOYEE
  6      WHERE DESG = 'MANAGER'
  7  );

  COUNT(*)
----------
         0

SQL> SELECT COUNT(*)
  2  FROM EMPLOYEE
  3  WHERE SAL > (
  4      SELECT AVG(SAL)
  5      FROM EMPLOYEE
  6      WHERE DESG = 'HR'
  7  );

  COUNT(*)
----------
         0

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE DEPTNO IN (1, 3)
  4    AND SAL > 5000;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01

SQL> SELECT *
  2  FROM EMP_LEAVES
  3  WHERE EMPNO BETWEEN 103 AND 110;

     EMPNO L STDATE    ENDDATE
---------- - --------- ---------
       109 C 01-AUG-01 02-AUG-01
       108 S 23-AUG-01

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE EMPNAME LIKE '%X%'
  4     OR EMPNAME LIKE '%Z%';

no rows selected

SQL> SELECT *
  2  FROM USER_CONSTRAINTS
  3  WHERE TABLE_NAME = 'EMP_LEAVES';

OWNER
----------------------------------------------------------------------------------------------------
CONSTRAINT_NAME
----------------------------------------------------------------------------------------------------
C
-
TABLE_NAME
----------------------------------------------------------------------------------------------------
SEARCH_CONDITION
--------------------------------------------------------------------------------
SEARCH_CONDITION_VC
----------------------------------------------------------------------------------------------------
R_OWNER
----------------------------------------------------------------------------------------------------
R_CONSTRAINT_NAME
----------------------------------------------------------------------------------------------------
DOMAIN_OWNER
----------------------------------------------------------------------------------------------------
DOMAIN_NAME
----------------------------------------------------------------------------------------------------
DOMAIN_CONSTRAINT_NAME
----------------------------------------------------------------------------------------------------
DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY PRECHECK
--------- -------- -------------- --------- ------------- -------------- --- ---- ----------
LAST_CHAN
---------
INDEX_OWNER
----------------------------------------------------------------------------------------------------
INDEX_NAME
----------------------------------------------------------------------------------------------------
INVALID VIEW_RELATED   ORIGIN_CON_ID
------- -------------- -------------
C##SCOTT
EMP_LEAVES_EMPNO_FK
R
EMP_LEAVES


C##SCOTT
EMPLOYEE_PK



NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME
10-AUG-25


                                   1

C##SCOTT
EMP_LEAVES_LEAVETYPE_FK
R
EMP_LEAVES


C##SCOTT
LEAVES_PK



NO ACTION ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME
10-AUG-25


                                   1

C##SCOTT
EMP_LEAVES_LEAVETYPE_NN
C
EMP_LEAVES
"LEAVETYPE" IS NOT NULL
"LEAVETYPE" IS NOT NULL





          ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME
10-AUG-25


                                   1

C##SCOTT
EMP_LEAVES_DATES_CHK
C
EMP_LEAVES
STDATE <= ENDDATE
STDATE <= ENDDATE





          ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               NOPRECHECK
10-AUG-25


                                   1

C##SCOTT
EMP_LEAVES_PK
P
EMP_LEAVES







          ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME
10-AUG-25
C##SCOTT
EMP_LEAVES_PK
                                   1


SQL> SELECT EMPNO, EMPNAME, DJ, MONTHS_BETWEEN(TO_DATE('31-JUL-2001', 'DD-MON-YYYY'), DJ) AS "NO MONTHS"
  2  FROM EMPLOYEE;

     EMPNO EMPNAME              DJ         NO MONTHS
---------- -------------------- --------- ----------
       101 GEORGE               12-JUL-01 .612903226
       102 BILL                 14-JUL-01 .548387097
       107 JOEL                 15-JUL-01 .516129032
       108 ROBERTS              15-JUL-01 .516129032
       109 HERBERT              22-JUL-01 .290322581

SQL> SELECT EMPNO, LEAVETYPE, STDATE, TO_DATE('31-JUL-2001', 'DD-MON-YYYY') - STDATE AS "DAYS_SINCE_START"
  2  FROM EMP_LEAVES
  3  WHERE ENDDATE IS NULL;

     EMPNO L STDATE    DAYS_SINCE_START
---------- - --------- ----------------
       108 S 23-AUG-01              -23

SQL> SELECT EMPNO, EMPNAME, TRUNC(DJ, 'MM') + INTERVAL '1' MONTH AS "FIRST_SAL_DATE"
  2  FROM EMPLOYEE;

     EMPNO EMPNAME              FIRST_SAL
---------- -------------------- ---------
       101 GEORGE               01-AUG-01
       102 BILL                 01-AUG-01
       107 JOEL                 01-AUG-01
       108 ROBERTS              01-AUG-01
       109 HERBERT              01-AUG-01

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE EMPNAME LIKE '%TE%'
  4    AND LENGTH(EMPNAME) > 5;

no rows selected

SQL> SELECT EMPNO, LEAVETYPE, STDATE, NEXT_DAY(STDATE, 'SATURDAY') AS NEXT_SATURDAY, ENDDATE - STDATE AS NO_OF_DAYS
  2  FROM EMP_LEAVES
  3  WHERE ENDDATE IS NOT NULL;

     EMPNO L STDATE    NEXT_SATU NO_OF_DAYS
---------- - --------- --------- ----------
       102 S 23-JUL-01 28-JUL-01          2
       101 C 27-JUL-01 28-JUL-01          1
       109 C 01-AUG-01 04-AUG-01          1

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE TO_CHAR(DJ, 'YYYY') = '2001';

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE INSTR(EMPNAME, 'APP') = 4;

no rows selected

SQL> -- or
SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE SUBSTR(EMPNAME, 4, 3) = 'APP';

no rows selected

SQL>  SELECT *  FROM EMPLOYEE  FROM EMPLOYEE  WHERE SUBSTR(EMPNAME, 4, 3) = 'ER';
 SELECT *  FROM EMPLOYEE  FROM EMPLOYEE  WHERE SUBSTR(EMPNAME, 4, 3) = 'ER'
                          *
ERROR at line 1:
ORA-03048: SQL reserved word 'FROM' is not syntactically valid following 'SELECT *  FROM EMPLOYEE
'
Help: https://docs.oracle.com/error-help/db/ora-03048/


SQL>  SELECT *  FROM EMPLOYEE  FROM EMPLOYEE  WHERE SUBSTR(EMPNAME, 4, 3) = 'RE';
 SELECT *  FROM EMPLOYEE  FROM EMPLOYEE  WHERE SUBSTR(EMPNAME, 4, 3) = 'RE'
                          *
ERROR at line 1:
ORA-03048: SQL reserved word 'FROM' is not syntactically valid following 'SELECT *  FROM EMPLOYEE
'
Help: https://docs.oracle.com/error-help/db/ora-03048/


SQL> SELECT EMPNO, EMPNAME
  2  FROM EMPLOYEE
  3  WHERE SUBSTR(EMPNAME, 1, 3) = 'ROB';

     EMPNO EMPNAME
---------- --------------------
       108 ROBERTS

SQL> SELECT EMPNO, EMPNAME,
  2         DECODE(DEPTNO,
  3                1, 'MONDAY',
  4                2, 'THURSDAY',
  5                'SUNDAY') AS HOLIDAY
  6  FROM EMPLOYEE;

     EMPNO EMPNAME              HOLIDAY
---------- -------------------- --------
       101 GEORGE               MONDAY
       102 BILL                 THURSDAY
       107 JOEL                 THURSDAY
       108 ROBERTS              THURSDAY
       109 HERBERT              SUNDAY

SQL> SELECT EMPNO, LEAVETYPE, TO_CHAR(STDATE, 'DD-MM') AS STDATE, ENDDATE
  2  FROM EMP_LEAVES
  3  WHERE EMPNO BETWEEN 103 AND 107
  4    AND TO_CHAR(STDATE, 'YYYY') = '2001';

no rows selected

SQL> UPDATE EMP_LEAVES
  2  SET STDATE = TRUNC(STDATE);

4 rows updated.

SQL> SELECT DEPTNO, SUM(SAL) AS TOTAL_SALARY
  2  FROM EMPLOYEE
  3  GROUP BY DEPTNO;

    DEPTNO TOTAL_SALARY
---------- ------------
         1        12000
         2        27500
         4         8000

SQL> SELECT DEPTNO, AVG(SAL) AS AVG_SALARY
  2  FROM EMPLOYEE
  3  WHERE TO_CHAR(DJ, 'YYYY') = '2001'
  4  GROUP BY DEPTNO;

    DEPTNO AVG_SALARY
---------- ----------
         1      12000
         2 9166.66667
         4       8000

SQL> SELECT EMPNO, SUM(NVL(ENDDATE, SYSDATE) - STDATE) AS TOTAL_LEAVES
  2  FROM EMP_LEAVES
  3  GROUP BY EMPNO;

     EMPNO TOTAL_LEAVES
---------- ------------
       102            2
       101            1
       109            1
       108   8753.50352

SQL> SELECT LEAVETYPE, SUM(NVL(ENDDATE, TO_DATE('31-JUL-2001','DD-MON-YYYY')) - STDATE) AS TOTAL_LEAVES
  2  FROM EMP_LEAVES
  3  GROUP BY LEAVETYPE;

L TOTAL_LEAVES
- ------------
S          -21
C            2

SQL> SELECT EMPNO
  2  FROM EMP_LEAVES
  3  GROUP BY EMPNO
  4  HAVING SUM(NVL(ENDDATE, TO_DATE('31-JUL-2001','DD-MON-YYYY')) - STDATE) > 10;

no rows selected

SQL> SELECT TO_CHAR(DJ, 'YYYY') AS JOIN_YEAR
  2  FROM EMPLOYEE
  3  GROUP BY TO_CHAR(DJ, 'YYYY')
  4  HAVING COUNT(*) > 5;

no rows selected

SQL> SELECT EMPNO
  2  FROM EMP_LEAVES
  3  WHERE TO_CHAR(STDATE, 'YYYY') = '2001'
  4  GROUP BY EMPNO
  5  HAVING SUM(NVL(ENDDATE, TO_DATE('31-JUL-2001','DD-MON-YYYY')) - STDATE) > 20;

no rows selected

SQL> SELECT DEPTNO, DESG, TO_CHAR(DJ,'YYYY'), COUNT(*)
  2  FROM EMPLOYEE
  3  GROUP BY DEPTNO, DESG, TO_CHAR(DJ,'YYYY');

    DEPTNO DESG                 TO_C   COUNT(*)
---------- -------------------- ---- ----------
         1 PM                   2001          1
         2 PM                   2001          1
         2 SP                   2001          1
         2 PRO                  2001          1
         4 SA                   2001          1

SQL> SELECT DISTINCT DEPTNO
  2  FROM EMPLOYEE
  3  GROUP BY DEPTNO, DESG
  4  HAVING AVG(SAL) > 10000;

    DEPTNO
----------
         1
         2

SQL> SELECT DEPTNO, MAX(SAL) - MIN(SAL)
  2  FROM EMPLOYEE
  3  GROUP BY DEPTNO;

    DEPTNO MAX(SAL)-MIN(SAL)
---------- -----------------
         1                 0
         2              4500
         4                 0

SQL> SELECT LEAVETYPE
  2  FROM EMP_LEAVES
  3  WHERE TO_CHAR(STDATE,'MMYYYY') = TO_CHAR(TO_DATE('31-JUL-2001','DD-MON-YYYY'),'MMYYYY')
  4  GROUP BY LEAVETYPE
  5  HAVING SUM(ENDDATE - STDATE) > 10
  6  UNION
  7  SELECT LEAVETYPE
  8  FROM EMP_LEAVES
  9  GROUP BY LEAVETYPE
 10  HAVING SUM(ENDDATE - STDATE) > 20;

no rows selected

SQL> SELECT SUM(NVL(ENDDATE, TO_DATE('31-JUL-2001','DD-MON-YYYY')) - STDATE)
  2  FROM EMP_LEAVES;

SUM(NVL(ENDDATE,TO_DATE('31-JUL-2001','DD-MON-YYYY'))-STDATE)
-------------------------------------------------------------
                                                          -19

SQL> SELECT EL.EMPNO, EL.LEAVETYPE, EL.STDATE, EL.ENDDATE - EL.STDATE AS NOLEAVES
  2  FROM EMP_LEAVES EL, LEAVES L
  3  WHERE EL.LEAVETYPE = L.LEAVETYPE;

     EMPNO L STDATE      NOLEAVES
---------- - --------- ----------
       102 S 23-JUL-01          2
       101 C 27-JUL-01          1
       109 C 01-AUG-01          1
       108 S 23-AUG-01

SQL> SELECT E.DEPTNO, D.DEPTNAME, E.EMPNAME, E.DESG
  2  FROM EMPLOYEE E, DEPT_TEST D
  3  WHERE D.DEPTNAME LIKE 'A%'
  4    AND E.DEPTNO = D.DEPTNO;

no rows selected

SQL> SELECT E.EMPNO, E.EMPNAME, D.DEPTNAME, D.HOD
  2  FROM EMPLOYEE E, DEPT_TEST D
  3  WHERE E.EMPNO NOT IN (SELECT EMPNO FROM EMP_LEAVES)
  4    AND E.DEPTNO = D.DEPTNO;

     EMPNO EMPNAME              DEPTNAME             HOD
---------- -------------------- -------------------- --------------------
       107 JOEL                 Finance              BILL

SQL> SELECT E.EMPNO, E.EMPNAME, D.DEPTNAME, L.LEAVENAME, EL.STDATE, EL.ENDDATE
  2  FROM EMPLOYEE E, DEPT_TEST D, EMP_LEAVES EL, LEAVES L
  3  WHERE E.DEPTNO = D.DEPTNO
  4    AND E.EMPNO = EL.EMPNO
  5    AND EL.LEAVETYPE = L.LEAVETYPE;

     EMPNO EMPNAME              DEPTNAME             LEAVENAME            STDATE    ENDDATE
---------- -------------------- -------------------- -------------------- --------- ---------
       101 GEORGE               HR                   CASUAL               27-JUL-01 28-JUL-01
       102 BILL                 Finance              SICK                 23-JUL-01 25-JUL-01
       108 ROBERTS              Finance              SICK                 23-AUG-01

SQL> SELECT * FROM DEPT_TEST
  2  WHERE DEPTNO IN (
  3    SELECT DEPTNO FROM EMPLOYEE
  4    WHERE TO_CHAR(DJ,'MMYYYY') = TO_CHAR(TO_DATE('31-JUL-2001','DD-MON-YYYY'),'MMYYYY')
  5  );

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         1 HR                   GEORGE
         2 Finance              BILL

SQL> SELECT L.LEAVETYPE, L.LEAVENAME, EL.EMPNO, EL.STDATE
  2  FROM LEAVES L
  3  LEFT JOIN EMP_LEAVES EL ON L.LEAVETYPE = EL.LEAVETYPE;

L LEAVENAME                 EMPNO STDATE
- -------------------- ---------- ---------
S SICK                        102 23-JUL-01
C CASUAL                      101 27-JUL-01
C CASUAL                      109 01-AUG-01
S SICK                        108 23-AUG-01
E EARNING
O OVERTIME

6 rows selected.

SQL> SELECT E1.*
  2  FROM EMP_LEAVES E1, EMP_LEAVES E2
  3  WHERE E2.STDATE = TO_DATE('05-MAR-2000','DD-MON-YYYY') AND E2.EMPNO = 101
  4    AND (E1.ENDDATE - E1.STDATE) > (E2.ENDDATE - E2.STDATE);

no rows selected

SQL> SELECT * FROM DEPT_TEST
  2  WHERE DEPTNO IN (
  3    SELECT DEPTNO
  4    FROM EMPLOYEE
  5    GROUP BY DEPTNO
  6    HAVING AVG(SAL) > 10000
  7  );

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         1 HR                   GEORGE

SQL> SELECT * FROM DEPT_TEST
  2  WHERE DEPTNO IN (
  3    SELECT DEPTNO
  4    FROM EMPLOYEE
  5    WHERE SAL > 5000
  6    GROUP BY DEPTNO
  7    HAVING COUNT(*) > 3
  8  );

no rows selected

SQL> SELECT * FROM EMPLOYEE
  2  WHERE EMPNO NOT IN (
  3    SELECT EMPNO
  4    FROM EMP_LEAVES
  5    WHERE LEAVETYPE = 'S'
  6      AND TO_CHAR(STDATE, 'MMYYYY') = TO_CHAR(TO_DATE('31-JUL-2001', 'DD-MON-YYYY'), 'MMYYYY')
  7  );

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01
       101 GEORGE                    12000          1 PM                   12-JUL-01

SQL> SELECT * FROM EMPLOYEE
  2  WHERE SAL = (
  3    SELECT MAX(SAL)
  4    FROM EMPLOYEE
  5  );

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01

SQL>
SQL> SELECT * FROM EMPLOYEE
  2  WHERE SAL > (
  3    SELECT AVG(SAL)
  4    FROM EMPLOYEE
  5    WHERE TO_CHAR(DJ, 'YYYY') = '2001'
  6  );

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01

SQL> SELECT * FROM DEPT_TEST
  2  WHERE DEPTNO NOT IN (
  3    SELECT DEPTNO FROM EMPLOYEE
  4    WHERE TO_CHAR(DJ, 'YYYY') = '2001'
  5  );

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         3 IT                   GARRY

SQL> DELETE FROM EMP_LEAVES
  2  WHERE EMPNO = (
  3    SELECT MAX(EMPNO) FROM EMPLOYEE
  4  );

1 row deleted.

SQL> SELECT E.*
  2  FROM EMPLOYEE E
  3  JOIN DEPT_TEST D ON E.DEPTNO = D.DEPTNO
  4  WHERE D.DEPTNAME = 'PRODUCTION'
  5    AND E.EMPNO IN (
  6      SELECT EMPNO
  7      FROM EMP_LEAVES
  8      GROUP BY EMPNO
  9      HAVING SUM(ENDDATE - STDATE) > 20
 10  );

no rows selected

SQL> SELECT * FROM EMP_LEAVES
  2  WHERE EMPNO IN (
  3    SELECT EMPNO
  4    FROM EMPLOYEE
  5    WHERE SAL > 10000
  6      AND MONTHS_BETWEEN(TO_DATE('31-JUL-2001','DD-MON-YYYY'), DJ) <= 6
  7  );

     EMPNO L STDATE    ENDDATE
---------- - --------- ---------
       102 S 23-JUL-01 25-JUL-01
       101 C 27-JUL-01 28-JUL-01

SQL> SELECT *
  2  FROM EMPLOYEE E
  3  WHERE (
  4    SELECT COUNT(*)
  5    FROM EMPLOYEE
  6    WHERE SAL > E.SAL
  7  ) < 5;

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01

SQL> SELECT * FROM EMPLOYEE E
  2  WHERE 5 > (
  3      SELECT COUNT(DISTINCT SAL)
  4      FROM EMPLOYEE
  5      WHERE SAL > E.SAL
  6  );

     EMPNO EMPNAME                     SAL     DEPTNO DESG                 DJ
---------- -------------------- ---------- ---------- -------------------- ---------
       101 GEORGE                    12000          1 PM                   12-JUL-01
       102 BILL                      12000          2 PM                   14-JUL-01
       107 JOEL                       8000          2 SP                   15-JUL-01
       108 ROBERTS                    7500          2 PRO                  15-JUL-01
       109 HERBERT                    8000          4 SA                   22-JUL-01

SQL> UPDATE EMPLOYEE E
  2  SET SAL = (
  3      SELECT AVG(SAL)
  4      FROM EMPLOYEE
  5      WHERE DEPTNO = E.DEPTNO
  6  )
  7  WHERE EMPNO = 102;

1 row updated.

SQL> SELECT * FROM DEPT_TEST
  2  WHERE DEPTNO IN (
  3      SELECT E.DEPTNO
  4      FROM EMPLOYEE E
  5      JOIN EMP_LEAVES EL ON E.EMPNO = EL.EMPNO
  6      GROUP BY E.DEPTNO
  7      HAVING SUM(EL.ENDDATE - EL.STDATE) = (
  8          SELECT MAX(TOTAL_LEAVES)
  9          FROM (
 10              SELECT SUM(EL2.ENDDATE - EL2.STDATE) AS TOTAL_LEAVES
 11              FROM EMPLOYEE E2
 12              JOIN EMP_LEAVES EL2 ON E2.EMPNO = EL2.EMPNO
 13              GROUP BY E2.DEPTNO
 14          )
 15      )
 16  );

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         2 Finance              BILL

SQL> CREATE TABLE TEMPLOYEE AS
  2  SELECT EMPNO, EMPNAME, SAL, DJ AS JOINDATE, DESG, DEPTNO
  3  FROM EMPLOYEE;

Table created.

SQL> DROP TABLE EMPLOYEE;
DROP TABLE EMPLOYEE
           *
ERROR at line 1:
ORA-02449: unique/primary keys in table referenced by foreign keys
Help: https://docs.oracle.com/error-help/db/ora-02449/


SQL> SELECT constraint_name, table_name
  2  FROM user_constraints
  3  WHERE r_constraint_name IN (
  4    SELECT constraint_name
  5    FROM user_constraints
  6    WHERE table_name = 'EMPLOYEE' AND constraint_type IN ('P', 'U')
  7  );

CONSTRAINT_NAME
----------------------------------------------------------------------------------------------------
TABLE_NAME
----------------------------------------------------------------------------------------------------
EMP_LEAVES_EMPNO_FK
EMP_LEAVES


SQL>
SQL> ALTER TABLE EMP_LEAVES DROP CONSTRAINT constraint_name;
ALTER TABLE EMP_LEAVES DROP CONSTRAINT constraint_name
                                       *
ERROR at line 1:
ORA-02443: Cannot drop constraint  - nonexistent constraint
Help: https://docs.oracle.com/error-help/db/ora-02443/


SQL> -- Replace constraint_name with the actual constraint found above
SQL>
SQL> ALTER TABLE EMP_LEAVES DROP CONSTRAINT EMP_LEAVES_EMPNO_FK;

Table altered.

SQL> DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;

Table dropped.

SQL> RENAME TEMPLOYEE TO EMPLOYEE;

Table renamed.

SQL> DECLARE
  2    SAL_103 EMPLOYEE.SAL%TYPE;
  3  BEGIN
  4    -- Get salary of employee 103
  5    SELECT SAL INTO SAL_103 FROM EMPLOYEE WHERE EMPNO = 103;
  6
  7    -- Update salary of 103 with salary of 101
  8    UPDATE EMPLOYEE
  9    SET SAL = (SELECT SAL FROM EMPLOYEE WHERE EMPNO = 101)
 10    WHERE EMPNO = 103;
 11
 12    -- Update salary of 101 with previously saved salary of 103
 13    UPDATE EMPLOYEE
 14    SET SAL = SAL_103
 15    WHERE EMPNO = 101;
 16
 17    COMMIT;
 18  END;
 19  /
DECLARE
*
ERROR at line 1:
ORA-01403: no data found
ORA-06512: at line 5
Help: https://docs.oracle.com/error-help/db/ora-01403/


SQL> ED
Wrote file afiedt.buf

  1  DECLARE
  2    SAL_103 EMPLOYEE.SAL%TYPE;
  3  BEGIN
  4    -- Get salary of employee 103
  5    SELECT SAL INTO SAL_103 FROM EMPLOYEE WHERE EMPNO = 103;
  6    -- Update salary of 103 with salary of 101
  7    UPDATE EMPLOYEE
  8    SET SAL = (SELECT SAL FROM EMPLOYEE WHERE EMPNO = 101)
  9    WHERE EMPNO = 103;
 10    -- Update salary of 101 with previously saved salary of 103
 11    UPDATE EMPLOYEE
 12    SET SAL = SAL_103
 13    WHERE EMPNO = 101;
 14    COMMIT;
 15* END;
 16  /
DECLARE
*
ERROR at line 1:
ORA-01403: no data found
ORA-06512: at line 5
Help: https://docs.oracle.com/error-help/db/ora-01403/


SQL> SELECT * FROM EMPLOYEE WHERE EMPNO = 103;

no rows selected

SQL> SELECT * FROM TEMPLOYEE;
SELECT * FROM TEMPLOYEE
              *
ERROR at line 1:
ORA-00942: table or view "C##SCOTT"."TEMPLOYEE" does not exist
Help: https://docs.oracle.com/error-help/db/ora-00942/


SQL> SELECT * FROM EMPLOYEE;

     EMPNO EMPNAME                     SAL JOINDATE  DESG                     DEPTNO
---------- -------------------- ---------- --------- -------------------- ----------
       101 GEORGE                    12000 12-JUL-01 PM                            1
       102 BILL                       9167 14-JUL-01 PM                            2
       107 JOEL                       8000 15-JUL-01 SP                            2
       108 ROBERTS                    7500 15-JUL-01 PRO                           2
       109 HERBERT                    8000 22-JUL-01 SA                            4

SQL> DECLARE
  2    SAL_107 EMPLOYEE.SAL%TYPE;
  3  BEGIN
  4    -- Get salary of employee 107
  5    SELECT SAL INTO SAL_107 FROM EMPLOYEE WHERE EMPNO = 107;
  6
  7    -- Update salary of 107 with salary of 101
  8    UPDATE EMPLOYEE
  9    SET SAL = (SELECT SAL FROM EMPLOYEE WHERE EMPNO = 101)
 10    WHERE EMPNO = 107;
 11
 12    -- Update salary of 101 with previously saved salary of 107
 13    UPDATE EMPLOYEE
 14    SET SAL = SAL_107
 15    WHERE EMPNO = 101;
 16
 17    COMMIT;
 18  END;
 19  /

PL/SQL procedure successfully completed.

SQL> CREATE OR REPLACE PROCEDURE NEWLEAVE(
  2    PEMPNO IN NUMBER,
  3    PLT IN CHAR
  4  ) IS
  5    STATUS NUMBER(1) := 0;  -- to track validation step
  6    CNT NUMBER(3);
  7    TNL NUMBER(2);
  8    NL NUMBER(2) := 0;  -- initialize to zero to avoid null issues
  9  BEGIN
 10    -- Check whether employee number is valid
 11    SELECT 1 INTO CNT
 12    FROM EMPLOYEE
 13    WHERE EMPNO = PEMPNO;
 14
 15    STATUS := 1;  -- employee found, now check leave type
 16
 17    -- Check whether leave type is valid and get max leaves allowed
 18    SELECT NOLEAVES INTO TNL
 19    FROM LEAVES
 20    WHERE LEAVETYPE = PLT;
 21
 22    -- Check whether employee is already on leave (leave with ENDDATE IS NULL)
 23    SELECT COUNT(*) INTO CNT
 24    FROM EMP_LEAVES
 25    WHERE EMPNO = PEMPNO AND ENDDATE IS NULL;
 26
 27    IF CNT <> 0 THEN
 28      RAISE_APPLICATION_ERROR(-20120, 'EMPLOYEE IS ALREADY ON LEAVE');
 29    END IF;
 30
 31    -- Check how many leaves of this type the employee has already consumed
 32    SELECT NVL(SUM(NVL(ENDDATE, SYSDATE) - STDATE), 0) INTO NL
 33    FROM EMP_LEAVES
 34    WHERE EMPNO = PEMPNO AND LEAVETYPE = PLT;
 35
 36    IF NL >= TNL THEN
 37      RAISE_APPLICATION_ERROR(-20130, 'ALREADY CONSUMED TOTAL NUMBER OF LEAVES IN THIS LEAVETYPE');
 38    END IF;
 39
 40    -- Insert new leave record with STDATE = SYSDATE and ENDDATE = NULL
 41    INSERT INTO EMP_LEAVES(EMPNO, LEAVETYPE, STDATE, ENDDATE)
 42    VALUES (PEMPNO, PLT, SYSDATE, NULL);
 43
 44    COMMIT;
 45
 46  EXCEPTION
 47    WHEN NO_DATA_FOUND THEN
 48      IF STATUS = 0 THEN
 49        RAISE_APPLICATION_ERROR(-20110, 'EMPLOYEE NUMBER IS NOT FOUND');
 50      ELSE
 51        RAISE_APPLICATION_ERROR(-20120, 'LEAVETYPE IS NOT FOUND');
 52      END IF;
 53    WHEN OTHERS THEN
 54      RAISE_APPLICATION_ERROR(SQLCODE, SQLERRM);
 55  END NEWLEAVE;
 56  /

Procedure created.

SQL> EXEC NEWLEAVE(101, 'S');

PL/SQL procedure successfully completed.

SQL> /

Procedure created.

SQL> CREATE OR REPLACE FUNCTION GETHSEMPNAMES RETURN VARCHAR2 IS
  2    CURSOR HSEMP_CURSOR IS
  3      SELECT EMPNAME
  4      FROM EMPLOYEE
  5      WHERE SAL = (SELECT MAX(SAL) FROM EMPLOYEE);
  6
  7    ALLNAMES VARCHAR2(4000) := '';
  8  BEGIN
  9    FOR REC IN HSEMP_CURSOR LOOP
 10      IF LENGTH(ALLNAMES) > 0 THEN
 11        ALLNAMES := ALLNAMES || ', ';
 12      END IF;
 13      ALLNAMES := ALLNAMES || REC.EMPNAME;
 14    END LOOP;
 15    RETURN ALLNAMES;
 16  END;
 17  /

Function created.

SQL> SELECT GETHSEMPNAMES FROM DUAL;

GETHSEMPNAMES
----------------------------------------------------------------------------------------------------
JOEL

SQL> SELECT * FROM DEPT
  2  WHERE HOD LIKE '%C%A%';
WHERE HOD LIKE '%C%A%'
      *
ERROR at line 2:
ORA-00904: "HOD": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT * FROM DEPT
  2  WHERE DEPTNO > 10 AND DEPTNAME LIKE '%A';
WHERE DEPTNO > 10 AND DEPTNAME LIKE '%A'
                      *
ERROR at line 2:
ORA-00904: "DEPTNAME": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT * FROM DEPT_TEST
  2  WHERE HOD LIKE '%C%A%';

no rows selected

SQL>
SQL> SELECT * FROM DEPT_TEST
  2  WHERE DEPTNO > 10 AND DEPTNAME LIKE '%A';

no rows selected

SQL> DESC DEPT_TEST;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 DEPTNO                                                NOT NULL NUMBER(2)
 DEPTNAME                                                       VARCHAR2(20)
 HOD                                                            VARCHAR2(20)

SQL> SELECT * FROM DEPT_TEST;

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         1 HR                   GEORGE
         2 Finance              BILL
         3 IT                   GARRY

SQL> SELECT * FROM DEPT_TEST
  2  WHERE DEPTNO < 10 AND DEPTNAME LIKE '%A';

no rows selected

SQL>  SELECT * FROM DEPT_TEST WHERE DEPTNO < 10 AND DEPTNAME LIKE '%A%';

no rows selected

SQL>  SELECT * FROM DEPT_TEST WHERE DEPTNO =3 AND DEPTNAME LIKE '%A%';

no rows selected

SQL> SELECT * FROM DEPT_TEST
  2  WHERE HOD LIKE '%G%';

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         1 HR                   GEORGE
         3 IT                   GARRY

SQL> ``
SP2-0042: unknown command "``" - rest of line ignored.
Help: https://docs.oracle.com/error-help/db/sp2-0042/
SQL>  SELECT * FROM DEPT_TEST  SELECT * FROM DEPT_TESTSP2-0042: unknown command "`" - rest of line ignored.
Help: https://docs.oracle.com/error-help/db/sp2-0042/
SQL>  SELECT * FROM DEPT_TEST WHERE HOD LIKE '%G%';

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         1 HR                   GEORGE
         3 IT                   GARRY

SQL> SELECT EMPNO, LEAVETYPE, TO_CHAR(STDATE, 'MONTH') AS START_MONTH,
  2         TO_CHAR(ENDDATE, 'MONTH') AS END_MONTH
  3  FROM EMP_LEAVES
  4  WHERE TO_CHAR(STDATE, 'MM') != TO_CHAR(ENDDATE, 'MM');

no rows selected

SQL> SELECT *
  2  FROM EMPLOYEE
  3  WHERE TO_CHAR(DJ, 'YYYY') = '2001';
WHERE TO_CHAR(DJ, 'YYYY') = '2001'
              *
ERROR at line 3:
ORA-00904: "DJ": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> -- Instead of SYSDATE (current date), use a fixed date like 01-JAN-2001
SQL>
SQL> TO_CHAR(DJ, 'YYYY') = '2001'
SP2-0734: unknown command beginning "TO_CHAR(DJ..." - rest of line ignored.
Help: https://docs.oracle.com/error-help/db/sp2-0734/
SQL>
SQL> -- Or for month/year comparison:
SQL> TO_CHAR(STDATE, 'MMYYYY') = TO_CHAR(TO_DATE('01-JAN-2001', 'DD-MON-YYYY'), 'MMYYYY')
SP2-0734: unknown command beginning "TO_CHAR(ST..." - rest of line ignored.
Help: https://docs.oracle.com/error-help/db/sp2-0734/
SQL> SELECT *
  2  FROM EMP_LEAVES
  3  WHERE TO_CHAR(STDATE, 'MMYYYY') = '072001';

     EMPNO L STDATE    ENDDATE
---------- - --------- ---------
       102 S 23-JUL-01 25-JUL-01
       101 C 27-JUL-01 28-JUL-01

SQL> SELECT *
  2  FROM EMP_LEAVES
  3  WHERE TO_CHAR(ENDDATE, 'MMYYYY') = '062001';

no rows selected

SQL> SELECT EL1.*
  2  FROM EMP_LEAVES EL1, EMP_LEAVES EL2
  3  WHERE EL2.EMPNO = 106 AND EL2.LEAVETYPE = 'S'
  4    AND EL1.STDATE > EL2.STDATE;

no rows selected

SQL> SELECT * FROM DEPT
  2  WHERE DEPTNO IN (
  3      SELECT DEPTNO
  4      FROM EMPLOYEE
  5      WHERE EMPNAME LIKE '%KEVIN%'
  6  );

no rows selected

SQL> SELECT * FROM TEMPLOYEE;
SELECT * FROM TEMPLOYEE
              *
ERROR at line 1:
ORA-00942: table or view "C##SCOTT"."TEMPLOYEE" does not exist
Help: https://docs.oracle.com/error-help/db/ora-00942/


SQL> SELECT * FROM EMPLOYEE;

     EMPNO EMPNAME                     SAL JOINDATE  DESG                     DEPTNO
---------- -------------------- ---------- --------- -------------------- ----------
       101 GEORGE                     8000 12-JUL-01 PM                            1
       102 BILL                       9167 14-JUL-01 PM                            2
       107 JOEL                      12000 15-JUL-01 SP                            2
       108 ROBERTS                    7500 15-JUL-01 PRO                           2
       109 HERBERT                    8000 22-JUL-01 SA                            4

SQL> SELECT * FROM DEPT
  2  WHERE DEPTNO IN (
  3      SELECT DEPTNO
  4      FROM EMPLOYEE
  5      WHERE EMPNAME LIKE '%ROBERTS%'
  6  );

    DEPTNO DNAME          LOC
---------- -------------- -------------
         2 CLIENT/SERVER  BILL

SQL> SELECT MAX(total_leaves) FROM (
  2      SELECT SUM(ENDDATE - STDATE) AS total_leaves
  3      FROM EMP_LEAVES
  4      GROUP BY EMPNO
  5  );

MAX(TOTAL_LEAVES)
-----------------
                2

SQL> SELECT MAX(ENDDATE - STDATE) FROM EMP_LEAVES;

MAX(ENDDATE-STDATE)
-------------------
                  2

SQL> SELECT * FROM DEPT
  2  WHERE DEPTNO IN (
  3      SELECT DEPTNO
  4      FROM EMPLOYEE
  5      GROUP BY DEPTNO
  6      HAVING COUNT(*) > 5
  7  );

no rows selected

SQL> SELECT * FROM EMPLOYEE
  2  WHERE SAL = (SELECT MAX(SAL) FROM EMPLOYEE);

     EMPNO EMPNAME                     SAL JOINDATE  DESG                     DEPTNO
---------- -------------------- ---------- --------- -------------------- ----------
       107 JOEL                      12000 15-JUL-01 SP                            2

SQL> SELECT * FROM EMP_LEAVES
  2  WHERE EMPNO IN (
  3      SELECT EMPNO FROM EMPLOYEE WHERE DEPTNO = 4
  4  );

no rows selected

SQL> SELECT E.DEPTNO, COUNT(DISTINCT EL.EMPNO)
  2  FROM EMPLOYEE E
  3  JOIN EMP_LEAVES EL ON E.EMPNO = EL.EMPNO
  4  WHERE TO_CHAR(EL.STDATE, 'MMYY') = TO_CHAR(SYSDATE, 'MMYY')
  5  GROUP BY E.DEPTNO;

    DEPTNO COUNT(DISTINCTEL.EMPNO)
---------- -----------------------
         1                       1

SQL> SELECT * FROM EMPLOYEE
  2  WHERE EMPNO NOT IN (SELECT EMPNO FROM EMP_LEAVES);

     EMPNO EMPNAME                     SAL JOINDATE  DESG                     DEPTNO
---------- -------------------- ---------- --------- -------------------- ----------
       107 JOEL                      12000 15-JUL-01 SP                            2
       109 HERBERT                    8000 22-JUL-01 SA                            4

SQL> SELECT * FROM EMPLOYEE
  2  WHERE EMPNO IN (
  3      SELECT EMPNO FROM EMP_LEAVES
  4      WHERE TO_CHAR(STDATE, 'MMYY') = TO_CHAR(ADD_MONTHS(SYSDATE, -1), 'MMYY')
  5  )
  6  AND EMPNO NOT IN (
  7      SELECT EMPNO FROM EMP_LEAVES
  8      WHERE TO_CHAR(STDATE, 'MMYY') = TO_CHAR(SYSDATE, 'MMYY')
  9  );

no rows selected

SQL> SELECT * FROM DEPT
  2  WHERE DEPTNO IN (
  3      SELECT DEPTNO
  4      FROM EMPLOYEE
  5      WHERE EMPNO IN (
  6          SELECT EMPNO
  7          FROM EMP_LEAVES
  8          WHERE LEAVETYPE = 'S'
  9          GROUP BY EMPNO
 10          HAVING SUM(ENDDATE - STDATE) > 5
 11      )
 12      GROUP BY DEPTNO
 13      HAVING COUNT(DISTINCT EMPNO) >= 2
 14  );

no rows selected

SQL> SELECT * FROM DEPT
  2  WHERE DEPTNO IN (
  3      SELECT DEPTNO
  4      FROM EMPLOYEE
  5      WHERE EMPNO IN (
  6          SELECT EMPNO FROM EMP_LEAVES WHERE ENDDATE IS NULL
  7      )
  8  );

    DEPTNO DNAME          LOC
---------- -------------- -------------
         1 MAINFRAME      GEORGE
         2 CLIENT/SERVER  BILL

SQL> SELECT * FROM EMPLOYEE
  2  WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE HOD = 'BILL')
  3  OR EMPNO IN (
  4      SELECT EMPNO
  5      FROM EMP_LEAVES
  6      WHERE TRUNC(STDATE) = NEXT_DAY(TRUNC(SYSDATE) - 7, 'THURSDAY')
  7  );
WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE HOD = 'BILL')
                                               *
ERROR at line 2:
ORA-00904: "HOD": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT * FROM EMPLOYEE
  2  WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE HOD = 'BILL')
  3  OR EMPNO IN (
  4      SELECT EMPNO
  5      FROM EMP_LEAVES
  6      WHERE TRUNC(STDATE) = NEXT_DAY(TRUNC(SYSDATE) - 7, 'THURSDAY')
  7  );
WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE HOD = 'BILL')
                                               *
ERROR at line 2:
ORA-00904: "HOD": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT * FROM EMPLOYEE
  2  WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT_TEST WHERE HOD = 'BILL')
  3     OR EMPNO IN (
  4         SELECT EMPNO
  5         FROM EMP_LEAVES
  6         WHERE TRUNC(STDATE) = NEXT_DAY(TRUNC(SYSDATE) - 7, 'THURSDAY')
  7     );

     EMPNO EMPNAME                     SAL JOINDATE  DESG                     DEPTNO
---------- -------------------- ---------- --------- -------------------- ----------
       102 BILL                       9167 14-JUL-01 PM                            2
       107 JOEL                      12000 15-JUL-01 SP                            2
       108 ROBERTS                    7500 15-JUL-01 PRO                           2

SQL> SELECT * FROM EMPLOYEE E
  2  WHERE 2 > (
  3      SELECT COUNT(DISTINCT SAL)
  4      FROM EMPLOYEE
  5      WHERE SAL > E.SAL
  6  );

     EMPNO EMPNAME                     SAL JOINDATE  DESG                     DEPTNO
---------- -------------------- ---------- --------- -------------------- ----------
       102 BILL                       9167 14-JUL-01 PM                            2
       107 JOEL                      12000 15-JUL-01 SP                            2

SQL> SELECT * FROM LEAVES
  2  WHERE LEAVETYPE IN (
  3      SELECT LEAVETYPE
  4      FROM EMP_LEAVES
  5      GROUP BY LEAVETYPE
  6      HAVING COUNT(*) > 50
  7  );

no rows selected

SQL> UPDATE EMPLOYEE
  2  SET DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DEPTNAME = 'INTERNET')
  3  WHERE EMPNO = 104;
SET DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DEPTNAME = 'INTERNET')
                                            *
ERROR at line 2:
ORA-00904: "DEPTNAME": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> SELECT * FROM LEAVES
  2  WHERE LEAVETYPE IN (
  3      SELECT LEAVETYPE
  4      FROM EMP_LEAVES
  5      GROUP BY LEAVETYPE
  6      HAVING COUNT(*) > 50
  7  );

no rows selected

SQL> UPDATE EMPLOYEE
  2  SET DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DEPTNAME = 'INTERNET')
  3  WHERE EMPNO = 104;
SET DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DEPTNAME = 'INTERNET')
                                            *
ERROR at line 2:
ORA-00904: "DEPTNAME": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL>
SQL> UPDATE EMPLOYEE
  2  SET DEPTNO = (SELECT DEPTNO FROM DEPT_TEST WHERE DEPTNAME = 'INTERNET')
  3  WHERE EMPNO = 104;

0 rows updated.

SQL> SELECT * FROM DEPT_TEST WHERE DEPTNAME = 'INTERNET';

no rows selected

SQL> SELECT * FROM DEPT_TEST;

    DEPTNO DEPTNAME             HOD
---------- -------------------- --------------------
         1 HR                   GEORGE
         2 Finance              BILL
         3 IT                   GARRY

SQL> SELECT * FROM EMPLOYEE;

     EMPNO EMPNAME                     SAL JOINDATE  DESG                     DEPTNO
---------- -------------------- ---------- --------- -------------------- ----------
       101 GEORGE                     8000 12-JUL-01 PM                            1
       102 BILL                       9167 14-JUL-01 PM                            2
       107 JOEL                      12000 15-JUL-01 SP                            2
       108 ROBERTS                    7500 15-JUL-01 PRO                           2
       109 HERBERT                    8000 22-JUL-01 SA                            4

SQL> UPDATE EMPLOYEE
  2  SET DEPTNO = (SELECT DEPTNO FROM DEPT_TEST WHERE DEPTNAME = 'FINANCE')
  3  WHERE EMPNO = 102;

1 row updated.

SQL> CREATE TABLE NEWEMP AS
  2  SELECT EMPNO, EMPNAME, SAL, DEPTNO, DJ
  3  FROM EMPLOYEE;
SELECT EMPNO, EMPNAME, SAL, DEPTNO, DJ
                                    *
ERROR at line 2:
ORA-00904: "DJ": invalid identifier
Help: https://docs.oracle.com/error-help/db/ora-00904/


SQL> CREATE TABLE NEWEMP AS
  2  SELECT EMPNO, EMPNAME, SAL, DEPTNO, JOINDATE
  3  FROM EMPLOYEE;

Table created.

SQL> DROP TABLE EMPLOYEE;

Table dropped.

SQL> RENAME NEWEMP TO EMPLOYEE;

Table renamed.

SQL> DESC EMPLOYEE
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 EMPNO                                                          NUMBER(5)
 EMPNAME                                                        VARCHAR2(20)
 SAL                                                            NUMBER(5)
 DEPTNO                                                         NUMBER(2)
 JOINDATE                                                       DATE

SQL> COMMIT;

Commit complete.

SQL> SPOOL OFF
SQL>
