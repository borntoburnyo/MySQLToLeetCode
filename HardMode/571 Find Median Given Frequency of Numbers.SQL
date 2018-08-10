The Numbers table keeps the value of number and its frequency.

+----------+-------------+
|  Number  |  Frequency  |
+----------+-------------|
|  0       |  7          |
|  1       |  1          |
|  2       |  3          |
|  3       |  1          |
+----------+-------------+
In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

Write a query to find the median of all numbers and name the result as median.

SELECT AVG(n.Number) AS median 
FROM Numbers n LEFT JOIN
(
SELECT Number, @prev := @count AS prevNumber, (@count := @count + Frequency) AS countNumber
FROM Numbers, 
(SELECT @count := 0, @prev := 0, @total := (SELECT SUM(Frequency) FROM Numbers)) temp ORDER BY Number
) n2
ON n.Number = n2.Number
WHERE 
(prevNumber < floor((@total+1)/2) AND countNumber >= floor((@total+1)/2))
OR
(prevNumber < floor((@total+2)/2) AND countNumber >= floor((@total+2)/2));
