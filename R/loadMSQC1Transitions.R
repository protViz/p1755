#' load table with transitions
#'
#' @export
#' @examples
#' head(loadMSQC1Transitions())
#'
loadMSQC1Transitions<-function(){

  file <- file.path(path.package("p1755"),"extdata/msqc1-table2.csv")
  targets<-read.csv(file , stringsAsFactors = FALSE )
  sp <- targets[,1]
  cnamessplit <- strsplit(as.character(sp), split= "\\(|\\)")
  mrm<-do.call("rbind",cnamessplit)

  mrm[,1] <- gsub("^\\s+|\\s+$", "", mrm[,1])
  mrm = data.frame( mrm , targets[,2:ncol(targets)])

  colnames( mrm )[1:7] <- c("Protein Name", "uniprotID","Peptide","monoMass","z","Q1.mz","Q3.mz")
  return(mrm)
}
