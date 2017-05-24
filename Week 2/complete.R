complete <- function( directory, id = 1:332 ) {
	## Reading all file names into a vector
	filesInDir <- paste( directory, as.character(list.files( directory )), sep = "/")
	
	## Defining a count matrix, all initialized to 0s
	count_nobs <- rep( 0, length(id))

	## Iterating over all ids
	x <- 1
	for( i in id) {
		## Reading the data for iterated file path
		dataInFile <- read.csv(filesInDir[i])
		
		## Updating count matrix with count of all complete rows
		count_nobs[x] <- sum(complete.cases(dataInFile))
		x <- x + 1
	}
	
	## Forming the dataframe of id, nobs pair
	completeRowCount <- data.frame( id = id, nobs = count_nobs)

	## Returning Dataframe
	completeRowCount
}