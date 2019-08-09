select movie_id, count(movie_id) as rarings
from movie_ratings
group by movie_id
order by ratings desc limit 5;
----------
select movie_name
from movie_ratings
where movie_id = 50;