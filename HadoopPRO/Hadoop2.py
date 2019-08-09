#Import packages for MapReduce

class RatingsBreakdown(package name):
	def steps(self):
		return [
					package name(Mappers = self.mapper_get_ratings,
											Reducers = self.reducer_count_ratings)
				   ]
					
	def mapper_get_ratings(line):
		(user_id,movie_id,ratings,timestamp) = line.split('/t')
		yield ratings,1 
		
	def reducer_count_ratings(key,value):
		yield ratings, sum(value)

#if we'are running this code through CLI then,
if __name__ = '__main__':
	RatingsBreakdown.run()
	-------------
#Import packages for MapReduce

class RatingsBreakdown(package name):
	def steps(self):
		return [
					package name(Mappers = self.mapper_get_ratings,
											Reducers = self.reducer_count_ratings),
					package name(Reducers = self.reducer_sort_ratings)
				   ]
					
	def mapper_get_ratings(line):
		(user_id,movie_id,ratings,timestamp) = line.split('/t')
		yield movie_id,1 
		
	def reducer_count_ratings(key,value):
		yield key,str( sum(value)).zfill(5)
		
	def reducer_sort_ratings(key,value,count):
		for movie in movies:
			yield movie,count

#if we'are running this code through CLI then,
if __name__ = '__main__':
	RatingsBreakdown.run()