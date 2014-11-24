rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  names(data) <- tolower(names(data))
  valid_outcomes <- c('heart attack','heart failure','pneumonia')
  # check if arguments are valid
  if (!(outcome %in% valid_outcomes)) {stop('invalid outcome')}
  # outcome character to match data's column names
  column <- paste('hospital.30.day.death..mortality..rates.from.',gsub('[ ]','.',outcome),sep='')
  data <- data[ ,c('state','hospital.name',column) ]
  # character to numeric
  suppressWarnings( data[,column] <- as.numeric(data[,column]) )
  # order by state, hospital name
  data <- data[order(data$state,data$hospital.name),]
  state_list <-split(data,data$state)
  result<-sapply(state_list,function(x){
    x<- x[!is.na(x[,column]), ]
    x<- x[order(x[,column]),]
    # figure the rank
    if (num=='best') num=1
    if (num=='worst') num=nrow(x)
    if ( !(num %in% c('best','worst')) & !is.numeric(num) ) stop('invalid num')
    if (num>nrow(data)){
      return(c(NA,x$state[1]))
    } else {
      return(c(as.character(x[num,'hospital.name']),x$state[1]))
    }
  })
  result<-t(result)
  result<-as.data.frame(result)
  names(result)<-c('hospital','state')
  return(result)
}