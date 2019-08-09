from starbase import Connection

 c = Connection ("127.0.0.1","8000")
 
 ratings = c.table('ratings')
 
 if(ratings.exists()):
 	print(''Dropping the table'')
 	ratings.drop()
 	
 ratings.create('ratings')
 
 print("Parsing ml/100k ratings data\n")
 ratingFile = open("e:Downloads/moviedata/ml-100k/u.data", "r")
 
 #  Starbase has a batch interface to work in Hbase so here batch is an object  thar we're creating to get ratings table.
 batch = ratings.batch()
 
 for line in ratingFile:
 	(userID, movieID, rating, timeStamp) = line.split()
 	batch.update(userID, {'rating' : {movieID: rating}})
 	
 	ratingFile.close()
 	
 print ("Committing ratings data  to HBase  via REST service\n")
 batch.commit(finalize = True)
 
 print ("Get ratings for users")
 print ("Ratings for user ID 1 :")
 print(ratings.fetch("1")
 