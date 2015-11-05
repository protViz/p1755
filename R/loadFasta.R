#' get sequences of msqc1 proteins
#'
#' @export
#' @examples
#' loadMSQC1Fasta()[[1]]
#'
loadMSQC1Fasta<-function(){
  file = file.path(path.package("p1755"),"extdata/msqc1-sequences.fasta")
  msqc1 <- readPeptideFasta(file)
  return(msqc1)
}

#' get set difference of msqc1 proteins and fgcz contaminants
#'
#' @export
#' @examples
#' loadContaminantsNoMSQC1Fasta()[[1]]
#'
loadContaminantsNoMSQC1Fasta<-function(){
  require(pepfdr)

  contaminants <- loadContaminantsFasta()
  msqc1 <- loadMSQC1Fasta()

  toremove <- NULL
  for(i in 1:length(msqc1)){
    idx <- grep(msqc1[[i]],contaminants)
    toremove<-c(toremove,idx)
  }
  contNoMSQC1 <- contaminants[-toremove]
}
