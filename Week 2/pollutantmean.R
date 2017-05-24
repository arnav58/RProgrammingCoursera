pollutantmean <- function( directory, pollutant, id = 1:332) {
	## Reading all file names into a vector
	filesInDir <- paste( directory, as.character(list.files( directory )), sep = "/")
	
	## Defining a value matrix
	values <- c()

	## Iterating over all ids passed
	for( i in id) {
		## Reading the data for iterated file path
		dataInFile <- read.csv(filesInDir[i])

		## Appending all NA values to values matrix
		values <- c(values, as.numeric(unlist(na.omit(dataInFile[pollutant]))))
	}
	## Returning mean of all non NA values for the pollutant
	mean(values)
}