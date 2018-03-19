Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200.
If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

/*
One without default LIMIT, OFFSET function
Basically, give rank to each distinct Salary
*/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    SELECT DISTINCT(E3.Salary) 
    FROM (SELECT E1.Salary, (
      SELECT COUNT(DISTINCT E2.Salary) 
      FROM Employee E2 
      WHERE E2.Salary >= E1.Salary) Rank
      FROM Employee E1) E3
    WHERE Rank = N
  );
END 

/*
Faster solution
*/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT 
BEGIN
SET N = N - 1; 
  RETURN (
    SELECT DISTINCT Salary 
    FROM Employee 
    ORDER BY Salary DESC 
    LIMIT 1
    OFFSET N
  )
END
