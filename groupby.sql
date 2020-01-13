select count(employee_id), SUM(salary) from employees;
select department_id, count(employee_id), MIN(salary), MAX(salary) from employees GROUP by department_id;
