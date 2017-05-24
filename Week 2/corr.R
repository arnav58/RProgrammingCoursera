corr <- function( directory, threshold = 0 ) {
	## Reading all file names into a vector
	filesInDir <- paste( directory, as.character(list.files( directory )), sep = "/")

	## Read dataframe with id, nobs pairs using complete function defined earlier
	allCompleteCases <- complete(directory)

	## Storing all nobs values in matrix
	allCompleteCount <- allCompleteCases$nobs

	## Storing all ids of monitors with complete cases greater than threshold
	monitorsAboveThreshold <- allCompleteCases$id[allCompleteCount > threshold]

	## Defining numeric matrix
	correlationVector <- rep(0, length(monitorsAboveThreshold))

	x <- 1
	for( monitorId in monitorsAboveThreshold) {
		## Reading data for each file with complete cases more than threshold
		dataInFile <- read.csv(filesInDir[monitorId])
		
		## Calculating correlation, excluding rows with NA
		correlationVector[x] <- cor(dataInFile$sulfate, dataInFile$nitrate, use="complete.obs")
		x <- x + 1
	}

	correlationVector
}