use requetes;

SELECT * from employees WHERE department_id IN (select department_id from employees WHERE last_name LIKE "%u%" GROUP BY department_id);
SELECT last_name, hire_date FROM employees WHERE job_id IN (SELECT job_id FROM employees WHERE last_name = "Davies") AND last_name != "Davies";
SELECT last_name, salary FROM employees WHERE manager_id IN (SELECT employee_id FROM employees WHERE last_name = "King");
SELECT last_name, salary, manager_id FROM employees WHERE manager_id IN (SELECT manager_id FROM employees WHERE last_name = "Abel") AND salary > (SELECT salary FROM employees WHERE last_name = "Davies");
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE job_id = "SA_MAN");
SELECT * FROM employees WHERE department_id = (SELECT department_id FROM employees WHERE last_name = "Davies") AND manager_id = (SELECT manager_id FROM employees WHERE last_name = "Davies");
SELECT last_name, job_id, manager_id FROM employees WHERE job_id IN (SELECT job_id FROM employees WHERE department_id IN (20, 50)) AND manager_id IN (SELECT manager_id FROM employees WHERE department_id IN (20, 50));