#' load theoretical Heavy Light ratios
#'
#' @export
#' @examples
#' tt<-(loadTheoryHLRatios())
#' dim(tt)
loadTheoryHLRatios <- function(){
  file <- file.path(path.package("p1755"),"extdata/theoryRatios.txt")
  ratios<-read.csv(file , stringsAsFactors = FALSE , header=FALSE,sep=" ")
  colnames(ratios)<-c("peptide","concentration","ratio")
  return(ratios)
}
