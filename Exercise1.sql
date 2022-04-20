create table EmployeesTablensalloum(EmloyeeIDNO varchar2(5),Salary number, benefits number, position varchar2(10));
select *
from EmployeesTablensalloum;
insert into EmployeesTablensalloum
values('010',75000,15000,'Maganer');
insert into EmployeesTablensalloum
values('105',65000,15000,'Maganer');
insert into EmployeesTablensalloum
values('152',60000,10000,'Maganer');
insert into EmployeesTablensalloum
values('215',60000,12000,'Maganer');
insert into EmployeesTablensalloum
values('244',50000,12000,'Staff');
insert into EmployeesTablensalloum
values('300',45000,10000,'Staff');
insert into EmployeesTablensalloum
values('335',40000,10000,'Staff');
insert into EmployeesTablensalloum
values('400',32000,7500,'EntryLevel');
insert into EmployeesTablensalloum
values('441',28000,7500,'EntryLevel');

--Develop a query that gives the smallest/minimum figure of the Benefits column, of the employees who are Managers.
select MIN(E.benefits)
from EmployeesTablensalloum E
where e.position like 'Maganer';
--Develop a query that gives the employeeidno and the maximum salary of employees by position.

















--EXERCISE 3
CREATE TABLE DEPT 
(
  DEPTNO NUMBER (2) NOT NULL PRIMARY KEY,
  DNAME VARCHAR2 (14),
  LOC VARCHAR2 (13)
);

INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (40, 'OPERATIONS', 'BOSTON');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (50, 'KERNEL', '1');
COMMIT;

CREATE TABLE EMP 
(
  EMPNO NUMBER (4) NOT NULL,
  ENAME VARCHAR2 (10),
  JOB VARCHAR2 (9),
  MGR NUMBER (4),
  HIREDATE DATE,
  SAL NUMBER (7,2),
  COMM NUMBER (7,2),
  DEPTNO NUMBER (2) CONSTRAINT FK_EMP REFERENCES DEPT (DEPTNO)
);

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7369, 'SMITH', 'CLERK',    7902, 800.00,   NULL,   20);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7499, 'ALLEN', 'SALESMAN', 7698, 1600.00,  300.00, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7521, 'WARD',  'SALESMAN', 7698, 1250.00,  500.00, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7566, 'JONES', 'MANAGER',  7839, 2975.00,  NULL,    20);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7654, 'MARTIN','SALESMAN', 7698, 1250.00,  1400.00, 30);
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7698, 'BLAKE', 'MANAGER',  7839, 2850.00,  NULL,    30); 
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7782, 'CLARK', 'MANAGER',  7839, 2450.00,  NULL,    10); 
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7788, 'SCOTT', 'ANALYST',  7566, 3000.00,  NULL,    20); 
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7839, 'KING',  'PRESIDENT',NULL, 5000.00,  NULL,    10); 
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7844, 'TURNER','SALESMAN', 7698, 1500.00,  0.00,    30); 
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7876, 'ADAMS', 'CLERK',    7788, 1100.00,  NULL,    20); 
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7900, 'JAMES', 'CLERK',    7698, 950.00,   NULL,    30); 
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7902, 'FORD',  'ANALYST',  7566, 30000.00, NULL,    20); 
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO) VALUES (7934, 'MILLER','CLERK',    7782, 1300.00, NULL,    40); 
COMMIT;

SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,E.SAL,row_number() 
                     over (partition by D.DEPTNO order by E.SAL DESC) SEQ_SAL_DEPARTMENT,
        lead(E.sal, 1, 0) over(partition by D.deptno order by E.sal desc) next_lower_sal,
          lag(E.sal, 1, 0) over(partition by D.deptno order by E.sal desc) prev_higher_sal

FROM EMP E,DEPT D
WHERE D.DEPTNO=E.DEPTNO;

--EXERCISE 4
Create table EMP
(
  EID                  NUMBER,
  ENAME          VARCHAR2 (60),
  DEPTNO        NUMBER,
  SAL                 NUMBER,
  HIREDATE     DATE
);

Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) Values (1, 'CLARK', 10, 2450, to_date('19-06-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) Values (2, 'KING', 10, 5000, to_date('01-11-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (3, 'MILLER', 10, 1300, to_date('23-01-1982', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (4, 'ADANS', 20, 1100, to_date('01-01-1983', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (5, 'FORD', 20, 3000, to_date('01-12-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (6, 'JONES', 20, 2975, to_date('01-04-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (7, 'SCOTT', 20, 3000, to_date('01-12-1982', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (8, 'SMITH', 20, 800, to_date('01-12-1980', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (9, 'ALLEN', 30, 1600, to_date('01-02-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (10, 'BLAKE', 30, 2850, to_date('01-05-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (11, 'JAMES', 30, 950, to_date('01-12-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (12, 'MARTIN', 30, 1250, to_date('01-09-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (13, 'TURNER', 30, 1500, to_date('01-09-1981', 'dd-mm-yyyy'));
Insert into EMP (EID, ENAME, DEPTNO, SAL, HIREDATE) values (14, 'WARD', 30, 1250, to_date('01-02-1981', 'dd-mm-yyyy')); 
COMMIT;

SELECT *
FROM EMP

SELECT EID,ENAME,HIREDATE,first_value(HIREDATE) over(partition by deptno order BY HIREDATE) LAST_HIRE_DATE,(HIREDATE-first_value(HIREDATE) over(partition by deptno order BY HIREDATE)) DAYS,
(HIREDATE-LAST_value(HIREDATE) over(partition by deptno order BY HIREDATE)) DAYS2,LAST_value(HIREDATE) over(partition by deptno order BY HIREDATE) FIRST_HIRE_DATE
FROM EMP


Select  deptno, 
          ename,
          sal,
          first_value(ename) over(partition by deptno order by sal) min_sal
  From EMP


--EXERCISE 5

CREATE TABLE SALES
(
       SALE_ID              INTEGER,
       PRODUCT_ID     INTEGER,
       YEAR                    INTEGER,
       Quantity             INTEGER,
       PRICE                   INTEGER
);
INSERT INTO SALES VALUES ( 1, 100, 2008, 10, 5000);
INSERT INTO SALES VALUES ( 2, 100, 2009, 12, 5000);
INSERT INTO SALES VALUES ( 3, 100, 2010, 25, 5000);
INSERT INTO SALES VALUES ( 4, 100, 2011, 16, 5000);
INSERT INTO SALES VALUES ( 5, 100, 2012, 8,  5000);

INSERT INTO SALES VALUES ( 6, 200, 2010, 10, 9000);
INSERT INTO SALES VALUES ( 7, 200, 2011, 15, 9000);
INSERT INTO SALES VALUES ( 8, 200, 2012, 20, 9000);
INSERT INTO SALES VALUES ( 9, 200, 2008, 13, 9000);
INSERT INTO SALES VALUES ( 10,200, 2009, 14, 9000);

INSERT INTO SALES VALUES ( 11, 300, 2010, 20, 7000);
INSERT INTO SALES VALUES ( 12, 300, 2011, 18, 7000);
INSERT INTO SALES VALUES ( 13, 300, 2012, 20, 7000);
INSERT INTO SALES VALUES ( 14, 300, 2008, 17, 7000);
INSERT INTO SALES VALUES ( 15, 300, 2009, 19, 7000);
COMMIT;

SELECT *
FROM SALES;

SELECT SUM(QUANTITY) products_sold , YEAR
FROM SALES 
GROUP BY YEAR;


SELECT SUM(QUANTITY) products_sold , PRODUCT_ID
FROM SALES 
GROUP BY PRODUCT_ID;

Select SALE_ID,PRODUCT_ID,QUANTITY,
          sum(QUANTITY) over (PARTITION by PRODUCT_ID ORDER BY SALE_ID) as running_total
         -- sum(sal) over (partition by deptno order by ename) as dept_total
  from SALES;
  
  
SELECT SALE_ID,PRODUCT_ID,PRICE,lag(PRICE, 2, 0) over(partition by PRODUCT_ID ORDER BY 1  ) PREVIOUS_SALES_AMOUNT
FROM SALES;


select  SALE_ID,PRICE,PRODUCT_ID ,QUANTITY,
          listagg(QUANTITY, '; ') within  GROUP(order by PRODUCT_ID) over (partition by PRICE) emp_list

          FROM SALES

--EXERCISE 6

  CREATE TABLE JOB(EMPNO NUMBER,ENAME VARCHAR2(20),JOB VARCHAR2(20),SAL NUMBER,DEPT NUMBER);
 INSERT INTO JOB 
 VALUES(7369,   'SMITH',      'CLERK' ,       800,	   10);
 INSERT INTO JOB 
 VALUES( 7839  ,' KING   ',   ' PRESIDENT  ',  5000	 ,  30);
 INSERT INTO JOB 
 VALUES(7902 , ' FORD ',     ' ANALYST   ',   3000	,   30);
 INSERT INTO JOB 
 VALUES( 7788  , 'SCOTT'     ,' ANALYST '    , 3000	  , 30);
 INSERT INTO JOB 
 VALUES(7566 ,  'JONES'     , 'MANAGER  ',    2975	,   20);
 INSERT INTO JOB 
 VALUES(7698   ,'BLAKE',      'MANAGER '   ,  2850	,   20);
 INSERT INTO JOB 
 VALUES(7782,   'CLARK',     ' MANAGER ',     2450,	   20);
 INSERT INTO JOB 
 VALUES( 7499,  ' ALLEN ' ,   ' SALESMAN'   ,  1600,	   20);
 INSERT INTO JOB 
 VALUES(  7844,   'TURNER'     ,'SALESMAN '  ,  1500,	   20);
 INSERT INTO JOB 
 VALUES( 7934   ,'MILLER'    , 'CLERK'   ,     1300	,   20);
 INSERT INTO JOB 
 VALUES(7654   ,'MARTIN '   ,' SALESMAN  '  , 1250	,   10	);
 INSERT INTO JOB 
 VALUES(7521   ,'WARD'       ,'SALESMAN'    , 1250	,   10);
 INSERT INTO JOB 
 VALUES(7876   ,'ADAMS',      'CLERK'       , 1100	,   10);
 INSERT INTO JOB 
 VALUES(7900   ,'JAMES',      'CLERK'       , 950	,   10);

     
COMMIT;                 
      
     SELECT*
     FROM JOB
      
    SELECT AVG(SAL)
    FROM JOB
    
SELECT DEPT,ENAME ,(SELECT AVG(SAL)
    FROM JOB
    )
FROM JOB


