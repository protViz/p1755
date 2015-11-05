#' create SQLite database from maxquant txt results
#'
#' @param path2MQ  path to MaxQuant combined/txt folder
#' @param sqliteLocation where to write the sqliteDB (folder)
#' @param sqlname name of database file
#' @export
#'
createSQLiteDB <- function( path2MQ , sqliteLocation = NULL , sqlname=NULL){
  if(is.null(sqliteLocation)){
    sqliteLocation = path2MQ
  }
  if(is.null(sqlname)){
    sqlname="my_mqdb.sqlite3"
  }

  files <- dir(path2MQ)
  filesf <- dir(path2MQ, full.names = T)
  files <- data_frame(files,filesf)

  info <- file.info(files$filesf)
  stopifnot(files$filesf == rownames(info))
  files <- tbl_df(data.frame(files, info))
  glimpse(files)

  files <- filter(files, size > 0)
  files <- files[ grep("\\.txt",files$files),]

  mqdata <-list()
  for(file in files$filesf){
    mqdata[[file]] <- read.csv(file,sep="\t",stringsAsFactors = FALSE)
  }
  stopifnot(names(mqdata) == files$filesf)

  names <- files$files
  names <- gsub("\\.txt", "",files$files)
  names <- gsub("[[:space:]]", "", names)
  names <- gsub("[[:punct:]]", "", names)
  names(mqdata) <- names

  library(DBI)
  if(file.exists(file.path(sqliteLocation,sqlname))){
    file.remove(file.path(sqliteLocation,sqlname))
  }

  my_mqdb <- src_sqlite(file.path(sqliteLocation,sqlname), create=TRUE)

  for( i in 1:length(mqdata)){
    tmp<-copy_to(my_mqdb, mqdata[[i]], name=names(mqdata)[i], temporary = FALSE)
  }
  dbDisconnect(my_mqdb$con)
}
