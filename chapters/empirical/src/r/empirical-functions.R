is_overdispersed <- function(model) {
  # ## number of variance parameters in 
  # ## an n-by-n variance-covariance matrix
  # vpars <- function(m) {
  #   nrow(m)*(nrow(m)+1)/2
  # }
  # model.df <- sum(sapply(VarCorr(model),vpars))+length(fixef(model))
  # rdf <- nrow(model.frame(model))-model.df
  
  ## Alternative (newer) number of variance parameters https://github.com/lme4/lme4/issues/220
  rdf <- df.residual(model)
  
  ## Test
  rp <- residuals(model, type="pearson")
  Pearson.chisq <- sum(rp^2)
  prat <- Pearson.chisq/rdf # Dispersion. chris added
  pval <- pchisq(Pearson.chisq, df=rdf, lower.tail=FALSE)
  c(chisq=Pearson.chisq,ratio=prat,rdf=rdf,p=pval)
}

get_percentage_zeros <- function(data) {
  data %>%
    group_by(family, conc) %>%
    summarise (n = n()) %>%
    mutate(freq = n / sum(n)) %>%
    filter(conc == 0)
}
