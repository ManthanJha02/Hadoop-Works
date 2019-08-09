#Spark using RDD

if __name__ = "__main__":
	#The main script which creates the sparkContext
	conf = SparkConf().setAppName("WorstMovies")
	sc = SparkContext(conf = connf)
	
	#Load Up our MovieID -> movie name LookUp Table
	movieNames = loadMovieNames()
	
	#Get the Raw Text File
	lines = sc.textFile("hdfs::://admin/manthan/u.data")
	
	#convert to (MovieID,(ratings,1.0))
	movieRatings = lines.map(parseInput)
	
	#Reduce to (MovieID,(sumOfRatings,totalRatings))
	ratingsTotalCount = movieRatings.reduceByKey(lambda movie1,movie2 :(movie1[0] + movie2[0])
	
	#Map to (movieId, avgRatinng)
	avgRatings = ratingsTotalCount.mapValues(lambda totalCount : totalCount(0) / totalCount)
	
	#sort by averageRating
	sortedMovies = avgRatings.sortBy(lambda x: x[1])
	
	#take top 10 results
	results = sortedMovies.take(10)
	
	#print them out
	for result in results:
		print [movieNames[result[0], result[1])
		
----------------- Functions ---------------------------
def loadMovieNames():
	movieNames = {}
	with open ("ml-100k/u.item") as f:
		for line in f:
			fields = line.split('|')
			movieNames = [int (fields[0]) = fields[1]
	return movieNames
	
def parseInput(line):
	fields = line.split()
	return (int (fields[1],float(fields[2], 1.0))
	===========================================================================================================
	#Spark using Datasets (For every dataset operation in Spark one needs to import spark session)
	
	
	if __name__ = "__main__"
	spark = SparkSession.builder.appName("PopularMovies").getOrCreate()
	
	
	movieNames = loadMovieNames()
	
	#Get the raw data
	lines = spark.sparkContext.textFile("hdfs://admin/manthan/u.data")<br />

	#convert it into RDD of row object 
	movies = lines.map(parseInput)
	
	#convert that to a DataFrame
	movieDataset = spark.createDataFrame(movies)
	
	#compute avg rating for each movieID
	avgRatings = movieDataset.groupBy("movieID).avg("rating")
	
	#count ratings for each movieID
	counts = movieDataset.groupBy("movieID").count()
	
	#Join avg and count together
	avgAndCount = counts.join(avgRatings,"movieID")
	
	filerCount = avgAndCount.filter("count > 10")
	
	#Get top 10 results
	topTen = filterCount.orderBy("avg(rating)").take(10)
	
	#print the result 
	for movie in topTen:
		print(movieNames[movie[0]], movie[1], movie[2])
		
spark.stop()

-----------------Functions-------------------
def loadMovieNames():
	movieNames = {}
	with open ("ml-100k/u.item") as f:
		for line in f:
			fields = line.split('|')
			movieNames = [int (fields[0]) = fields[1]
	return movieNames
	
def parseInput():
	fields = line.split()
	return Row(movieID = int(field[1]),rating = float(field[2]))
	