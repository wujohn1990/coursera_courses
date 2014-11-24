best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  names(data) <- tolower(names(data))
  valid_states <- unique(data$state)
  valid_outcomes <- c('heart attack','heart failure','pneumonia')
  # check if arguments are valid
  if (!(state %in% valid_states)) {stop('invalid state')}
  if (!(outcome %in% valid_outcomes)) {stop('invalid outcome')}
  # outcome character to match data's column names
  column <- paste('hospital.30.day.death..mortality..rates.from.',gsub('[ ]','.',outcome),sep='')
  data <- data[ data$state==state,c('hospital.name',column) ]
  # order by hospital name
  data <- data[order(data$hospital.name),]
  suppressWarnings( data[,column] <- as.numeric(data[,column]) )
  result <- data[which.min(data[,column])[1],'hospital.name'] 
  return(as.character(result))
}