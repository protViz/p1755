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
  ratios[,1] <- gsub("\\[|\\]","",ratios[,1])
  ratios[,4] <- log2(ratios[,3])
  colnames(ratios) <- c("Pepsequence", "concentration", "logfoldchange" , "log2fc")
  ratios<-ratios[order(ratios$Pepsequence),]
  return(ratios)
}
