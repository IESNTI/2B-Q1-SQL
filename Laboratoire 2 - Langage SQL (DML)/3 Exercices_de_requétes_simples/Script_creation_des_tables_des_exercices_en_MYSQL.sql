drop database if exists  requetes;
create database requetes;
use requetes;

# Les 11 instructions ci-dessous permettent de supprimer les tables (si nécessaire)
# Drop table job_grades;
# Drop table job_history;

# ALTER TABLE employees
# 	drop foreign key  emp_manager_fk;
# ALTER TABLE employees
# 	drop foreign key emp_job_fk;
# ALTER TABLE employees
# 	drop foreign key emp_dept_fk;

# Drop table jobs;
# Drop table departments;
# Drop table employees;
# Drop table locations;
# Drop table countries;
# Drop table regions;


CREATE TABLE regions
    ( region_id    INT   NOT NULL, 
	region_name    VARCHAR(25)  
    ) engine = INNODB;

CREATE UNIQUE INDEX reg_id_pk
ON regions (region_id);

ALTER TABLE regions
ADD ( CONSTRAINT reg_id_pk
       		 PRIMARY KEY (region_id)
    ) ;



CREATE TABLE countries 
    ( country_id      CHAR(2)  NOT NULL 
    , country_name    VARCHAR(40) 
    , region_id       INT 
    , CONSTRAINT     country_c_id_pk 
        	     PRIMARY KEY (country_id) 
    )  
     engine = INNODB; 

ALTER TABLE countries
ADD ( CONSTRAINT countr_reg_fk
        	 FOREIGN KEY (region_id)
          	  REFERENCES regions(region_id) 
    ) ;




CREATE TABLE locations
    ( location_id    INT(4)
    , street_address VARCHAR(40)
    , postal_code    VARCHAR(12)
    , city       VARCHAR(30) NOT NULL
    , state_province VARCHAR(25)
    , country_id     CHAR(2)
   ) engine = INNODB;

CREATE UNIQUE INDEX loc_id_pk
ON locations (location_id) ;

ALTER TABLE locations
ADD ( CONSTRAINT loc_id_pk
       		 PRIMARY KEY (location_id)
    , CONSTRAINT loc_c_id_fk
       		 FOREIGN KEY (country_id)
        	  REFERENCES countries(country_id) 
    ) ;





CREATE TABLE departments
    ( department_id    INT(4)
    , department_name  VARCHAR(30) NOT NULL
    , manager_id       INT(6)
    , location_id      INT(4)
   ) engine = INNODB;

CREATE UNIQUE INDEX dept_id_pk
ON departments (department_id) ;

ALTER TABLE departments
ADD ( CONSTRAINT dept_id_pk
       		 PRIMARY KEY (department_id)
    , CONSTRAINT dept_loc_fk
       		 FOREIGN KEY (location_id)
        	  REFERENCES locations (location_id)
     ) ;





CREATE TABLE jobs
    ( job_id         VARCHAR(10)
    , job_title      VARCHAR(35)  NOT NULL
    , min_salary     INT(6)
    , max_salary     INT(6)
    ) engine = INNODB;

CREATE UNIQUE INDEX job_id_pk 
ON jobs (job_id) ;

ALTER TABLE jobs
ADD ( CONSTRAINT job_id_pk
      		 PRIMARY KEY(job_id)
    ) ;





CREATE TABLE employees
    ( employee_id    INT(6)
    , first_name     VARCHAR(20)
    , last_name      VARCHAR(25)  NOT NULL
    , email          VARCHAR(25) NOT NULL
    , phone_INT   VARCHAR(20)
    , hire_date      DATE  NOT NULL
    , job_id         VARCHAR(10) NOT NULL
    , salary         DECIMAL(8,2)
    , commission_pct DECIMAL(2,2)
    , manager_id     INT(6)
    , department_id  INT(4)
    , CONSTRAINT     emp_salary_min
                     CHECK (salary > 0) 
    , CONSTRAINT     emp_email_uk
                     UNIQUE (email)
    ) engine = INNODB;

CREATE UNIQUE INDEX emp_emp_id_pk
ON employees (employee_id) ;


ALTER TABLE employees
ADD ( CONSTRAINT     emp_emp_id_pk
                     PRIMARY KEY (employee_id)
    , CONSTRAINT     emp_dept_fk
                     FOREIGN KEY (department_id)
                      REFERENCES departments(department_id)
    , CONSTRAINT     emp_job_fk
                     FOREIGN KEY (job_id)
                      REFERENCES jobs (job_id)
    , CONSTRAINT     emp_manager_fk
                     FOREIGN KEY (manager_id)
                      REFERENCES employees(employee_id)
    ) ;






CREATE TABLE job_history
    ( employee_id   INT(6) NOT NULL
    , start_date    DATE NOT NULL
    , end_date      DATE NOT NULL
    , job_id        VARCHAR(10) NOT NULL
    , department_id INT(4)
    , CONSTRAINT    jhist_date_interval
                    CHECK (end_date > start_date)
   ) engine = INNODB;

CREATE UNIQUE INDEX jhist_emp_id_st_date_pk 
ON job_history (employee_id, start_date) ;

ALTER TABLE job_history
ADD ( CONSTRAINT jhist_emp_id_st_date_pk
      PRIMARY KEY (employee_id, start_date)
    , CONSTRAINT     jhist_job_fk
                     FOREIGN KEY (job_id)
                     REFERENCES jobs(job_id)
    , CONSTRAINT     jhist_emp_fk
                     FOREIGN KEY (employee_id)
                     REFERENCES employees(employee_id)
    , CONSTRAINT     jhist_dept_fk
                     FOREIGN KEY (department_id)
                     REFERENCES departments(department_id)
    ) ;




COMMIT;






 




INSERT INTO regions VALUES 
        ( 1
        , 'Europe' 
        );

INSERT INTO regions VALUES 
        ( 2
        , 'Americas' 
        );

INSERT INTO regions VALUES 
        ( 3
        , 'Asia' 
        );

INSERT INTO regions VALUES 
        ( 4
        , 'Middle East and Africa' 
        );




INSERT INTO countries VALUES 
        ( 'US'
        , 'United States of America'
        , 2 
        );

INSERT INTO countries VALUES 
        ( 'CA'
        , 'Canada'
        , 2 
        );


INSERT INTO countries VALUES 
        ( 'UK'
        , 'United Kingdom'
        , 1 
        );


INSERT INTO countries VALUES 
        ( 'DE'
        , 'Germany'
        , 1 
        );



INSERT INTO locations VALUES 
        ( 1400 
        , '2014 Jabberwocky Rd'
        , '26192'
        , 'Southlake'
        , 'Texas'
        , 'US'
        );

INSERT INTO locations VALUES 
        ( 1500 
        , '2011 Interiors Blvd'
        , '99236'
        , 'South San Francisco'
        , 'California'
        , 'US'
        );


INSERT INTO locations VALUES 
        ( 1700 
        , '2004 Charade Rd'
        , '98199'
        , 'Seattle'
        , 'Washington'
        , 'US'
        );

INSERT INTO locations VALUES 
        ( 1800 
        , '460 Bloor St. W.'
        , 'ON M5S 1X8'
        , 'Toronto'
        , 'Ontario'
        , 'CA'
        );


INSERT INTO locations VALUES 
        ( 2500 
        , 'Magdalen Centre, The Oxford Science Park'
        , 'OX9 9ZB'
        , 'Oxford'
        , 'Oxford'
        , 'UK'
        );




INSERT INTO departments VALUES 
        ( 10
        , 'Administration'
        , 200
        , 1700
        );

INSERT INTO departments VALUES 
        ( 20
        , 'Marketing'
        , 201
        , 1800
        );
                                

INSERT INTO departments VALUES 
        ( 50
        , 'Shipping'
        , 124
        , 1500
        );
                
INSERT INTO departments VALUES 
        ( 60 
        , 'IT'
        , 103
        , 1400
        );
                
                
INSERT INTO departments VALUES 
        ( 80 
        , 'Sales'
        , 149
        , 2500
        );
                
INSERT INTO departments VALUES 
        ( 90 
        , 'Executive'
        , 100
        , 1700
        );

                
INSERT INTO departments VALUES 
        ( 110 
        , 'Accounting'
        , 205
        , 1700
        );


INSERT INTO departments VALUES 
        ( 190 
        , 'Contracting'
        , NULL
        , 1700
        );





INSERT INTO jobs VALUES 
        ( 'AD_PRES'
        , 'President'
        , 20000
        , 40000
        );
INSERT INTO jobs VALUES 
        ( 'AD_VP'
        , 'Administration Vice President'
        , 15000
        , 30000
        );

INSERT INTO jobs VALUES 
        ( 'AD_ASST'
        , 'Administration Assistant'
        , 3000
        , 6000
        );

INSERT INTO jobs VALUES 
        ( 'AC_MGR'
        , 'Accounting Manager'
        , 8200
        , 16000
        );

INSERT INTO jobs VALUES 
        ( 'AC_ACCOUNT'
        , 'Public Accountant'
        , 4200
        , 9000
        );
INSERT INTO jobs VALUES 
        ( 'SA_MAN'
        , 'Sales Manager'
        , 10000
        , 20000
        );

INSERT INTO jobs VALUES 
        ( 'SA_REP'
        , 'Sales Representative'
        , 6000
        , 12000
        );


INSERT INTO jobs VALUES 
        ( 'ST_MAN'
        , 'Stock Manager'
        , 5500
        , 8500
        );
INSERT INTO jobs VALUES 
        ( 'ST_CLERK'
        , 'Stock Clerk'
        , 2000
        , 5000
        );


INSERT INTO jobs VALUES 
        ( 'IT_PROG'
        , 'Programmer'
        , 4000
        , 10000
        );

INSERT INTO jobs VALUES 
        ( 'MK_MAN'
        , 'Marketing Manager'
        , 9000
        , 15000
        );

INSERT INTO jobs VALUES 
        ( 'MK_REP'
        , 'Marketing Representative'
        , 4000
        , 9000
        );



INSERT INTO employees VALUES 
        ( 100
        , 'Steven'
        , 'King'
        , 'SKING'
        , '515.123.4567'
        , str_to_date('17-JUN-1987', '%e-%b-%Y')
        , 'AD_PRES'
        , 24000
        , NULL
        , NULL
        , 90
        );

INSERT INTO employees VALUES 
        ( 101
        , 'Neena'
        , 'Kochhar'
        , 'NKOCHHAR'
        , '515.123.4568'
        , str_to_date('21-SEP-1989', '%e-%b-%Y')
        , 'AD_VP'
        , 17000
        , NULL
        , 100
        , 90
        );

INSERT INTO employees VALUES 
        ( 102
        , 'Lex'
        , 'De Haan'
        , 'LDEHAAN'
        , '515.123.4569'
        , str_to_date('13-JAN-1993', '%e-%b-%Y')
        , 'AD_VP'
        , 17000
        , NULL
        , 100
        , 90
        );

INSERT INTO employees VALUES 
        ( 103
        , 'Alexander'
        , 'Hunold'
        , 'AHUNOLD'
        , '590.423.4567'
        , str_to_date('03-JAN-1990', '%e-%b-%Y')
        , 'IT_PROG'
        , 9000
        , NULL
        , 102
        , 60
        );

INSERT INTO employees VALUES 
        ( 104
        , 'Bruce'
        , 'Ernst'
        , 'BERNST'
        , '590.423.4568'
        , str_to_date('21-MAY-1991', '%e-%b-%Y')
        , 'IT_PROG'
        , 6000
        , NULL
        , 103
        , 60
        );




INSERT INTO employees VALUES 
        ( 107
        , 'Diana'
        , 'Lorentz'
        , 'DLORENTZ'
        , '590.423.5567'
        , str_to_date('07-FEB-1999', '%e-%b-%Y')
        , 'IT_PROG'
        , 4200
        , NULL
        , 103
        , 60
        );

INSERT INTO employees VALUES 
        ( 124
        , 'Kevin'
        , 'Mourgos'
        , 'KMOURGOS'
        , '650.123.5234'
        , str_to_date('16-NOV-1999', '%e-%b-%Y')
        , 'ST_MAN'
        , 5800
        , NULL
        , 100
        , 50
        );


INSERT INTO employees VALUES 
        ( 141
        , 'Trenna'
        , 'Rajs'
        , 'TRAJS'
        , '650.121.8009'
        , str_to_date('17-OCT-1995', '%e-%b-%Y')
        , 'ST_CLERK'
        , 3500
        , NULL
        , 124
        , 50
        );

INSERT INTO employees VALUES 
        ( 142
        , 'Curtis'
        , 'Davies'
        , 'CDAVIES'
        , '650.121.2994'
        , str_to_date('29-JAN-1997', '%e-%b-%Y')
        , 'ST_CLERK'
        , 3100
        , NULL
        , 124
        , 50
        );

INSERT INTO employees VALUES 
        ( 143
        , 'Randall'
        , 'Matos'
        , 'RMATOS'
        , '650.121.2874'
        , str_to_date('15-MAR-1998', '%e-%b-%Y')
        , 'ST_CLERK'
        , 2600
        , NULL
        , 124
        , 50
        );

INSERT INTO employees VALUES 
        ( 144
        , 'Peter'
        , 'Vargas'
        , 'PVARGAS'
        , '650.121.2004'
        , str_to_date('09-JUL-1998', '%e-%b-%Y')
        , 'ST_CLERK'
        , 2500
        , NULL
        , 124
        , 50
        );


INSERT INTO employees VALUES 
        ( 149
        , 'Eleni'
        , 'Zlotkey'
        , 'EZLOTKEY'
        , '011.44.1344.429018'
        , str_to_date('29-JAN-2000', '%e-%b-%Y')
        , 'SA_MAN'
        , 10500
        , .2
        , 100
        , 80
        );


INSERT INTO employees VALUES 
        ( 174
        , 'Ellen'
        , 'Abel'
        , 'EABEL'
        , '011.44.1644.429267'
        , str_to_date('11-MAY-1996', '%e-%b-%Y')
        , 'SA_REP'
        , 11000
        , .30
        , 149
        , 80
        );


INSERT INTO employees VALUES 
        ( 176
        , 'Jonathon'
        , 'Taylor'
        , 'JTAYLOR'
        , '011.44.1644.429265'
        , str_to_date('24-MAR-1998', '%e-%b-%Y')
        , 'SA_REP'
        , 8600
        , .20
        , 149
        , 80
        );


INSERT INTO employees VALUES 
        ( 178
        , 'Kimberely'
        , 'Grant'
        , 'KGRANT'
        , '011.44.1644.429263'
        , str_to_date('24-MAY-1999', '%e-%b-%Y')
        , 'SA_REP'
        , 7000
        , .15
        , 149
        , NULL
        );


INSERT INTO employees VALUES 
        ( 200
        , 'Jennifer'
        , 'Whalen'
        , 'JWHALEN'
        , '515.123.4444'
        , str_to_date('17-SEP-1987', '%e-%b-%Y')
        , 'AD_ASST'
        , 4400
        , NULL
        , 101
        , 10
        );

INSERT INTO employees VALUES 
        ( 201
        , 'Michael'
        , 'Hartstein'
        , 'MHARTSTE'
        , '515.123.5555'
        , str_to_date('17-FEB-1996', '%e-%b-%Y')
        , 'MK_MAN'
        , 13000
        , NULL
        , 100
        , 20
        );

INSERT INTO employees VALUES 
        ( 202
        , 'Pat'
        , 'Fay'
        , 'PFAY'
        , '603.123.6666'
        , str_to_date('17-AUG-1997', '%e-%b-%Y')
        , 'MK_REP'
        , 6000
        , NULL
        , 201
        , 20
        );


INSERT INTO employees VALUES 
        ( 205
        , 'Shelley'
        , 'Higgins'
        , 'SHIGGINS'
        , '515.123.8080'
        , str_to_date('07-JUN-1994', '%e-%b-%Y')
        , 'AC_MGR'
        , 12000
        , NULL
        , 101
        , 110
        );

INSERT INTO employees VALUES 
        ( 206
        , 'William'
        , 'Gietz'
        , 'WGIETZ'
        , '515.123.8181'
        , str_to_date('07-JUN-1994', '%e-%b-%Y')
        , 'AC_ACCOUNT'
        , 8300
        , NULL
        , 205
        , 110
        );



INSERT INTO job_history
VALUES (102
       , str_to_date('13-JAN-1993', '%e-%b-%Y')
       , str_to_date('24-JUL-1998', '%e-%b-%Y')
       , 'IT_PROG'
       , 60);

INSERT INTO job_history
VALUES (101
       , str_to_date('21-SEP-1989', '%e-%b-%Y')
       , str_to_date('27-OCT-1993', '%e-%b-%Y')
       , 'AC_ACCOUNT'
       , 110);

INSERT INTO job_history
VALUES (101
       , str_to_date('28-OCT-1993', '%e-%b-%Y')
       , str_to_date('15-MAR-1997', '%e-%b-%Y')
       , 'AC_MGR'
       , 110);

INSERT INTO job_history
VALUES (201
       , str_to_date('17-FEB-1996', '%e-%b-%Y')
       , str_to_date('19-DEC-1999', '%e-%b-%Y')
       , 'MK_REP'
       , 20);

INSERT INTO job_history
VALUES  (141
        , str_to_date('24-MAR-1998', '%e-%b-%Y')
        , str_to_date('31-DEC-1999', '%e-%b-%Y')
        , 'ST_CLERK'
        , 50
        );

INSERT INTO job_history
VALUES  (124
        , str_to_date('01-JAN-1999', '%e-%b-%Y')
        , str_to_date('31-DEC-1999', '%e-%b-%Y')
        , 'ST_CLERK'
        , 50
        );

INSERT INTO job_history
VALUES  (200
        , str_to_date('17-SEP-1987', '%e-%b-%Y')
        , str_to_date('17-JUN-1993', '%e-%b-%Y')
        , 'AD_ASST'
        , 90
        );

INSERT INTO job_history
VALUES  (176
        , str_to_date('24-MAR-1998', '%e-%b-%Y')
        , str_to_date('31-DEC-1998', '%e-%b-%Y')
        , 'SA_REP'
        , 80
        );

INSERT INTO job_history
VALUES  (176
        , str_to_date('01-JAN-1999', '%e-%b-%Y')
        , str_to_date('31-DEC-1999', '%e-%b-%Y')
        , 'SA_MAN'
        , 80
        );

INSERT INTO job_history
VALUES  (200
        , str_to_date('01-JUL-1994', '%e-%b-%Y')
        , str_to_date('31-DEC-1998', '%e-%b-%Y')
        , 'AC_ACCOUNT'
        , 90
        );

ALTER TABLE departments
ADD ( CONSTRAINT dept_mgr_fk
      		 FOREIGN KEY (manager_id)
      		  REFERENCES employees (employee_id)
    ) ;


COMMIT;


CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  INT,
 highest_sal INT);

INSERT INTO job_grades
VALUES ('A', 1000, 2999);

INSERT INTO job_grades
VALUES ('B', 3000, 5999);

INSERT INTO job_grades
VALUES('C', 6000, 9999);

INSERT INTO job_grades
VALUES('D', 10000, 14999);

INSERT INTO job_grades
VALUES('E', 15000, 24999);

INSERT INTO job_grades
VALUES('F', 25000, 40000);

COMMIT;