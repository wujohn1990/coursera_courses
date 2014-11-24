rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
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
  # order by the rate
  data<- data[order(data[,column]),]
  data<- data[!is.na(data[,column]), ]
  # figure the rank
  if (num=='best') num=1
  if (num=='worst') num=nrow(data)
  if ( !(num %in% c('best','worst')) & !is.numeric(num) ) stop('invalid num')
  if (num>nrow(data)){
    return(NA)
  } else {
    return(as.character(data[num,'hospital.name' ]))
  }

}