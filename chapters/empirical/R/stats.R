performFishersTest <- function(countdata) {
  matrix <- acast(countdata,depth ~ stage,value.var="count")
  ft <- fisher.test(matrix,alternative="two.sided")
  print(ft)
  if(ft$p.value < 0.05)  {
    mult <- fisher.multcomp(matrix,"bonferroni")
    print(mult)
  }
  return(ft)
}

performChiSqTest <- function(countdata) {
  matrix <- acast(countdata, depth ~ stage, value.var="count")
  ft <- chisq.test(matrix)
  print(ft)
  return(ft)
}


performChiSqPostHocTest <- function(countdata) {
  library('rcompanion')
  matrix <- acast(countdata, depth ~ stage, value.var="count")
  post_hoc <- pairwiseNominalIndependence(matrix,
                                fisher = FALSE,
                                gtest  = FALSE,
                                chisq  = TRUE,
                                method = "fdr")
  print(post_hoc)
  return(post_hoc)
}