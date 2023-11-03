-- ques 1
SELECT * 
FROM employees

SELECT * 
FROM employees

-- ques 2

SELECT  concat(first_name,' ',last_name) as Employee,hire_date
FROM employees

-- ques 3
SELECT concat(first_name,' ',last_name) as Employee,job_id as title
FROM employees

-- ques 4
SELECT concat(first_name,' ',last_name) as NAME,department_id,hire_date,job_id as Title
FROM employees
where job_id like "%CLERK%"

-- ques 5

-- ques 6 
SELECT concat(first_name,' ',last_name) as NAME,salary
FROM employees
where salary > 2000

-- ques 7

SELECT concat(first_name,' ',last_name) as NAME,hire_date as 'Start Date'
FROM employees

-- ques 8
SELECT concat(first_name,' ',last_name) as NAME,hire_date as 'Start Date'
FROM employees
ORDER BY hire_date ASC;

-- ques 9
SELECT concat(first_name,' ',last_name) as NAME,salary
FROM employees
ORDER BY salary ASC;

-- QUES 10
SELECT concat(first_name,' ',last_name) as NAME,department_id,commission_pct
FROM employees
where commission_pct like "____"
ORDER BY salary ASC;

-- ques 11
SELECT concat(first_name,' ',last_name) as NAME,job_title
FROM employees as e join jobs as j 
on e.job_id = j.job_id
where manager_id IS NULL

-- QUES 12
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR job_id= 'ST_CLERK')
AND salary NOT IN (2500, 3500, 5000);

-- second paper
-- QUES 1
SELECT MAX(salary),MIN(salary),AVG(salary),sum(commission_pct)
FROM employees


-- QUES 2
SELECT department_id,sum(salary),sum(commission_pct)
FROM employees
group by department_id

-- QUES 3
SELECT department_id,count(employee_id) as Total_employees
FROM employees
group by department_id

-- ques 4
SELECT department_id,sum(salary)
FROM employees
group by department_id

-- ques 5
SELECT concat(first_name,' ',last_name) as NAME,commission_pct
FROM employees
where commission_pct IS NULL

-- QUES 6
SELECT concat(first_name,' ',last_name) as NAME,department_id,
case 
when commission_pct IS NULL then "NO COMMISSION" 
ELSE commission_pct
end as "commission list"
FROM employees

-- QUES 7
SELECT concat(first_name,' ',last_name) as NAME,department_id,salary * 2,
case 
when commission_pct IS NULL then "NO COMMISSION"

ELSE commission_pct * 2 
end as "commission_list"
FROM employees

-- QUES 8
SELECT first_name,department_id
FROM employees
group by department_id,first_name
having count(first_name)>1

-- QUES 9
SELECT sum(salary),manager_id
FROM employees
group by manager_id

-- QUES 10
SELECT concat(e.first_name," ",e.last_name) as employeename,
concat(m.first_name," ",m.last_name) as managername
FROM employees as e left join employees as m
on e.manager_id=m.employee_id

-- ques 11
/*SELECT concat(first_name," ",last_name) as NAME,department_id,salary
FROM employees
where last_name like "_a%"*/

SELECT m.first_name,m.last_name,m.department_id,avg(e.salary)
from employees as e left join employees as m
on e.manager_id = m.employee_id
group by m.first_name,m.last_name, m.department_id
having m.last_name like "_a%"

-- ques 12 
/*SELECT avg(salary),department_id
FROM employees
group by department_id
order by department_id ASC
*/
SELECT avg(salary),department_id
FROM employees
group by department_id
having avg(salary) > (SELECT avg(salary)
FROM employees)



-- ques 13
SELECT MAX(salary),department_id
FROM employees
group by department_id

-- ques 14
SELECT first_name,
case
when commission_pct IS NOT NULL THEN  (salary*10)/100
when commission_pct IS NULL then 1
end
"salary-new"
from employees
 
-- paper 3

/*1 Write a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label. */

SELECT last_name,
    CONCAT(
        lower(SUBSTRING(last_name, 1, 1)), -- Capitalize the first letter
       --  LOWER(SUBSTRING(last_name, 2, 1)), -- Lowercase the 2nd letter
--         UPPER(SUBSTRING(last_name, 3, 1)), -- Capitalize the 3rd letter-- 
        LOWER(SUBSTRING(last_name, 2, 5))     -- Lowercase the rest of the letters
    ) AS Formatted_Last_Name
FROM employees

/* 2
Write a query that displays the employee's first name and last name along with a " in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined.*/

SELECT first_name,last_name,concat(first_name,"-",last_name) as fullname,hire_date
from employees


/* 3
Write a query to display the employee's last name and if half of the salary is greater than
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
1500 each. Provide each column an appropriate label. 

*/

SELECT last_name,salary as old_salary,
case
when salary/2 > 10000 then salary + (salary*10)/100 
else salary + (salary * 11.5)/100 + 1500
end as new_salary
from employees

/* 4. 
Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
department id, salary and the manager name all in Upper case, if the Manager name
consists of 'z' replace it with '$! 
*/

SELECT CONCAT(
        SUBSTRING(e.first_name, 1, 2), -- First two characters of employee_id
        '00',                        -- Append two zeros
        SUBSTRING(e.first_name,2,6),    -- Remaining characters of employee_id
        'E'                          -- Append 'E' at the end
    ) AS Formatted_Employee_ID,
    UPPER(e.department_id) AS Department_ID,
    UPPER(e.salary) AS Salary,
    REPLACE(UPPER(m.first_name), 'Z', '$!') AS Manager_Name
    
FROM
   employees as e join employees as m
   on e.manager_id=m.employee_id
   
   
   
   
  
  SELECT
    CONCAT(UPPER(LEFT(last_name, 1)), LOWER(SUBSTRING(last_name, 2))) AS Formatted_Last_Name,
    LENGTH(last_name) AS Name_Length
FROM
   employees
WHERE
    last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY
    last_name;

-- 6
SELECT last_name,
LPAD(convert(salary,CHAR),15,'$') as 'SALARY'
from employees

-- 7 
INSERT INTO employees (first_name)
VALUES (illi);

INSERT INTO employees (first_name)
VALUES ('illi');


SELECT first_name
FROM employees
WHERE LOWER(REPLACE(first_name, ' ', '')) = LOWER(REVERSE(REPLACE(first_name, ' ', '')));



INSERT INTO employees (employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES
 ('207','illi','Gietz','WGIETZ','51hr5.123.8181','1994-06-07','AC_ACCOUNT','8300.00',NULL,'205','110'),
 ('208','Ava','Gietz','WGIETZ','51hr5.123.8181','1994-06-07','AC_ACCOUNT','8300.00',NULL,'205','110'),
 ('209','iti','Gietz','WGIETZ','51hr5.123.8181','1994-06-07','AC_ACCOUNT','8300.00',NULL,'205','110');

  
  -- 8
  select first_name,concat(upper(substring(first_name,1,1)),lower(substring(first_name,2)))
  from employees
  
  -- 9
  select substring_Index(street_address," ",2),street_address
  from locations
  
  select substring_index(substring_index(street_address," "
  

-- 11
select e.first_name,j.job_title
from employees as e join jobs as j on e.job_id = j.job_id
where j.job_id = (select job_id from employees where first_name = 'Trenna')


-- 12
select e.first_name,d.department_name,e.department_id
from employees as e join department as d on e.department_id = d.department_id
join location as l on d.location_id = l.location_id
where l.city = 


-- hr paper 4 ques 1

SELECT e.last_name,e.department_id,d.department_name
from employees as e join departments as d on e.department_id = d.department_id

-- 2
SELECT e.job_id,d.department_id,l.location_id,l.state_province
from employees as e join departments as d on d.department_id join locations as l on l.location_id
where d.department_id = 40

-- 3
SELECT e.last_name,d.department_name,l.city,l.location_id,e.commission_pct 
from employees as e join departments as d on d.department_id join locations as l on l.location_id
where e.commission_pct is not null

-- 4
Select e.last_name,d.department_name
from employees as e join departments as d on d.department_id
where e.last_name like '%a%'

-- 5
SELECT e.last_name,e.job_id,d.department_name,d.department_id,l.location_id
from employees as e join departments as d on d.department_id join locations as l on l.location_id
where city like 'Tokyo'


