#'Streamline descriptive analysis of quantitative data matrices
#'@name p1755
#'@docType package
#'@import dplyr
#@importFrom grDevices dev.off heat.colors
#@importFrom graphics abline axis image layout lines pairs plot points text
#@importFrom stats cor.test dist hclust mad median p.adjust qqplot runmed t.test
#@importFrom caret confusionMatrix
#@importFrom pROC roc


NULL
# hack to supress _no visible binding for global variable _ warning in R CMD check.
#utils::globalVariables(c("ratio"), add = TRUE)
print("loading package p1755")
