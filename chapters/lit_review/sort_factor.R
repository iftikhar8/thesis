SortFactorBySize <- function(x) {
  # Reorders the factor by size, which is useful for printing figures
  #
  # Args:
  #   x: The factor to be re-ordered
  #
  # Returns:
  #   The sorted factor
  factor(x, levels = names(sort(table(x))))
}