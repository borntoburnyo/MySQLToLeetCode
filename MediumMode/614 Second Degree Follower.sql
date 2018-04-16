In facebook, there is a follow table with two columns: followee, follower.

Please write a sql query to get the amount of each follower’s follower if he/she has one.

For example:

+-------------+------------+
| followee    | follower   |
+-------------+------------+
|     A       |     B      |
|     B       |     C      |
|     B       |     D      |
|     D       |     E      |
+-------------+------------+
should output:

+-------------+------------+
| follower    | num        |
+-------------+------------+
|     B       |  2         |
|     D       |  1         |
+-------------+------------+
Explaination:

Both B and D exist in the follower list, when as a followee, B’s follower is C and D, and D’s follower is E. 

A does not exist in follower list.

Note:

Followee would not follow himself/herself in all cases.

Please display the result in follower’s alphabet order.

SELECT 
  t1.follower AS follower,
  COUNT(DISTINCT t2.follower) AS num
FROM 
  follow AS t1
JOIN
  follow AS t2
    ON t1.follower = t2.followee
GROUP BY 
  t2.followee
ORDER BY 
  t1.follower
ASC;
    
