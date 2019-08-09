CREATE VIEW topMoviesID as
SELECT movieID, count(movieID) as ratingCount
FROM ratings
GROUP BY movieID
ORDER BY ratingCount DESC; 

#To Join tables as per movie id - > names

SELECT n.title, ratingCount
FROM topMoviesID t 
JOIN names n 
ON t.movieID = n.movieID; 
-----------
CREATE VIEW topRatings as
SELECT movieID,avg(rating) as rate,count(movieID) as mvRate
FROM ratings
WHERE rate >= (SELECT max(rating) from ratings)
LIMIT 10;


SELECT n.title,rate
FROM topRatings t
JOIN names n
ON t.movieID = n.movieID
WHERE mvRate > 10;

---------------------------------------------------- MySQL----------------------------------------------------------------

SELECT movies.title, COUNT(ratings.movie_id) AS ratingCount
FROM movies
INNER JOIN ratings
ON movies.id = ratings.movie_id
GROUP BY movies.title
ORDER BY ratingCount;