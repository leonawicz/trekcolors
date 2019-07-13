#' Star Trek color palettes.
#'
#' A named list of 53 Star Trek color palettes.
#'
#' @format A named list.
"trekpals"

#' Named Star Trek color palette
#'
#' Return a named Star Trek color palette from the \code{trekpals} dataset.
#'
#' Most of the palettes are qualitative, and not necessarily evenly spaced in terms of hue, saturation or brightness.
#' This is because most of the palettes come from logos, symbols, insignia and other simple representations.
#' However, several palettes have specifically been constructed as sequential or divergent if it made sense to do so based on the dominant colors present.
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
#'
#' # to view all palettes
#' view_trekpals()
trekpal <- function(id){
  if(missing(id)) return(names(trekcolors::trekpals))
  if(!id %in% names(trekcolors::trekpals))
    stop("`id` is not a predefined palette name.", call. = FALSE)
  trekcolors::trekpals[[id]]
}

#' @export
#' @rdname trekpal
view_trekpals <- function(){
  pals <- trekcolors::trekpals
  lab <- names(pals)
  n <- length(pals)
  nc <- unlist(lapply(pals, length))
  maxn <- max(nc)
  ylim <- c(0, n)
  opar <- graphics::par(mgp = c(2, 0.25, 0))
  on.exit(graphics::par(opar))
  graphics::plot(1, 1, xlim = c(0, maxn), ylim = ylim, type = "n",
    axes = FALSE, bty = "n", xlab = "", ylab = "")
  for(i in 1:n){
    nj <- nc[n + 1 - i]
    p <- pals[[n + 1 - i]]
    brks <- seq(from = 0, to = maxn, length = nj + 1)
    graphics::rect(xleft = brks[1:nj], ybottom = i - 1,
      xright = brks[2:(nj + 1)], ytop = i - 0.1, col = p, border = NA)
  }
  graphics::text(rep(-0.1, n), (1:n) - 0.6, labels = rev(lab),
    cex = 0.6, xpd = TRUE, adj = 1)
  graphics::title("Star Trek palettes")
  invisible()
}
