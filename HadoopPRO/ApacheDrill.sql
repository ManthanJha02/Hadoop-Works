Show Databases;

SELECT * FROM hive.movielens.ratings LIMIT 10;

SELECT * FROM mongo.movielens.users LIMIT 10;

SELECT  u.occupation, COUNT(*)
FROM hive.movielens.ratings r
JOIN mongo.movielens.users u
ON r.user_id = u.user_id
GROUP BY u.occupation
ORDER BY u.occupation
LIMIT 10;