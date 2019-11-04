use requetes;

#SELECT first_name, job_title FROM employees JOIN jobs ON employees.job_id=jobs.job_id WHERE commission_pct IS NULL;
#SELECT first_name, department_name FROM employees JOIN departments ON employees.department_id=departments.department_id;
#SELECT department_name, first_name FROM departments JOIN employees ON departments.manager_id=employees.employee_id;
/* SELECT first_name, city FROM employees
    JOIN departments ON employees.department_id=departments.department_id
        JOIN locations ON departments.location_id=locations.location_id; */
/* SELECT first_name, city FROM employees 
    JOIN departments ON employees.department_id=departments.department_id
        JOIN locations ON departments.location_id=locations.location_id
            WHERE city IN("Toronto", "Seattle"); */
/* SELECT first_name, department_name, country_name, region_name FROM employees
    JOIN departments ON employees.department_id=departments.department_id
        JOIN locations ON departments.location_id=locations.location_id
            JOIN countries ON locations.country_id=countries.country_id
                JOIN regions ON countries.region_id=regions.region_id; */