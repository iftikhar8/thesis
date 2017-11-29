get_factor_proportion <- function(x) {
  cbind(freq = table(x), percentage = round(prop.table(table(x))*100, 2))
  #x %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
}