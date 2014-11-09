corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  result<-numeric()
  for (f in list.files(directory)){
    file<-paste('./',directory,'/', f,sep='')
    data<-read.csv(file,header=T)
    nobs<-sum(complete.cases(data[,c('sulfate','nitrate')]))
    if(nobs>threshold){
      result<-c(result,cor(data$sulfate,data$nitrate,use='na.or.complete'))
    }
  }
  return(result)  
  
}