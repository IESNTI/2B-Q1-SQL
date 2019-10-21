USE requetes;

SELECT Last_name, First_name, Department_id FROM employees ORDER BY Department_id, Last_name DESC;
SELECT Last_name, Salary*1.2 FROM employees;
SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 200;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;
SELECT * FROM employees WHERE Last_name IN("King", "Ernst", "Greenberg", "Chen");
SELECT DISTINCT department_id, job_id FROM employees;
SELECT Last_name, DATE_FORMAT(hire_date, 'embauché le %D %M %Y') FROM employees WHERE department_id = 20 OR department_id = 50;
SELECT Last_name FROM employees WHERE Last_name LIKE 'D%'
                                OR    Last_name LIKE 'a%'
                                OR    Last_name LIKE '_e%';
SELECT * FROM employees WHERE employee_id IN(100, 103, 124) AND salary NOT BETWEEN 2500 AND 4000 ORDER BY manager_id;
SELECT employee_id FROM employees WHERE department_id IS NULL;
SELECT DATE_FORMAT(hire_date, "DATE %D %M %Y") FROM employees;
SELECT employee_id FROM employees WHERE hire_date > DATE_FORMAT("01/02/1998", "%d/%m/%Y");