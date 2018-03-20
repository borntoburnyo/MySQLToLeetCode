The Employee table holds all employees. Every employee has an Id,
and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who earn the top three salaries 
in each of the department. For the above tables, your SQL query 
should return the following rows.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+


SELECT 
	d.Name AS department,
	e.Name AS Employee,
	e.Salary AS Salary
FROM
	Employee AS e, 
	Department AS d
WHERE 
	(SELECT 
		COUNT(DISTINCT(Salary))
	FROM 
		Employee
	WHERE
		DepartmentId = e.DepartmentId 
		AND Salary > e.Salary) < 3
	AND e.DepartmentId = d.Id
ORDER BY 
	e.DepartmentId, e.Salary 
DESC;	
	


SELECT 
	d.Name AS Department, 
	e.Name AS Employee, 
	e.Salary AS Salary
FROM 
	(
		SELECT e1.Name,
			e1.Salary,
			e1.DepartmentId
		FROM 
			Employee AS e1
			JOIN Employee AS e2
		WHERE 
			e1.DepartmentId = e2.DepartmentId
			AND e1.Salary <= e2.Salary
		GROUP BY 
			e1.Id 
		HAVING 
			COUNT(DISTINCT(e2.Salary)) <= 3
		) AS e 
	JOIN Department AS d
		ON e.DepartmentId = d.Id
ORDER BY 
	d.Name,
	e.Salary
DESC;	
	
		
		 






















