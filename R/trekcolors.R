#' Star Trek color palettes.
#'
#' A named list of Star Trek color palettes.
#'
#' @format A named list.
"trekpals"

#' Named Star Trek color palette
#'
#' Return a named Star Trek color palette from the \code{trekpals} dataset.
#'
#' @param id character, name of predefined palette. If missing, return all available palette names.
#'
#' @return character vector of hex colors or palette names
#' @export
#'
#' @examples
#' trekpal("lcars2357")
#' # leave id blank to list available names:
#' trekpal()
trekpal <- function(id){
  if(missing(id)) return(names(trekcolors::trekpals))
  if(!id %in% names(trekcolors::trekpals))
    stop("`id` is not a predefined palette name.", call. = FALSE)
  trekcolors::trekpals[[id]]
}
