USE requetes;

/* SELECT Last_name, First_name, Department_id FROM employees ORDER BY Department_id, Last_name DESC; */
/* SELECT Last_name, Salary*1.2 FROM employees; */
/* SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 200; */
/* SELECT * FROM employees WHERE commission_pct IS NOT NULL; */
/* SELECT * FROM employees WHERE Last_name IN("King", "Ernst", "Greenberg", "Chen"); */
/* SELECT DISTINCT department_id, job_id FROM employees; */
SELECT Last_name, hire_date FROM employees WHERE department_id = 20 AND department_id = 50;