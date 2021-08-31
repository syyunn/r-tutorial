findmin <- function(v) {
  m <- v[1]
  for (e in v) {
    if (e < m) {
      m <- e
    }
  }
  return(m)
}