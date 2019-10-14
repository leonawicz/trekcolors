#' Star Trek color palettes.
#'
#' A named list of 35 Star Trek color palettes.
#'
#' @format A named list.
"trekpals"

#' Star Trek color palettes
#'
#' Return a predefined Star Trek color palette from the \code{trekpals} dataset.
#'
#' Many of the palettes are qualitative, and not necessarily evenly spaced in terms of hue, saturation or brightness.
#' This is because many palettes come from logos, symbols, insignia and other simple representations.
#' However, several palettes have specifically been constructed as sequential or divergent if it made sense to do so based on the dominant colors present.
#' Additional special functions exist for the subset of LCARS palettes.
#'
#' @param palette character, name of predefined palette. If missing, return all available palette names.
#' @param reverse logical, reverse color order.
#'
#' @return character vector of hex colors or palette names
#' @export
#' @seealso \code{\link{lcars_pals}}, \code{\link{scale_lcars}}
#'
#' @examples
#' trek_pal("lcars_2357")
#' # leave palette blank to list available names:
#' trek_pal()
#'
#' # to view all palettes
#' view_trek_pals()
trek_pal <- function(palette, reverse = FALSE){
  if(missing(palette)) return(names(trekcolors::trekpals))
  if(!palette %in% names(trekcolors::trekpals))
    stop("Invalid palette name.", call. = FALSE)
  pal <- trekcolors::trekpals[[palette]]
  if(reverse) rev(pal) else pal
}

#' @export
#' @rdname trek_pal
view_trek_pals <- function(palette){
  pals <- if(missing(palette)) trekcolors::trekpals else trekcolors::trekpals[palette]
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

#' Color and fill scale functions for Star Trek palettes
#'
#' Scale functions used with ggplot2.
#'
#' Most palettes should be used as qualitative palettes. See \code{trekpals} to see how many colors are in each predefined palette.
#' Use \code{view_trek_pals()} to plot all palettes to see which may work best for your purposes.
#'
#' @param palette character, name of Star Trek palette. See \code{trek_pal()} for list of palette names.
#' @param discrete logical, discrete or continuous palette.
#' @param reverse logical, reverse color order.
#' @param ... additional arguments passed to \code{ggplot2::discrete_scale} or \code{ggplot2::scale_*_gradientn}, for discrete or continuous palettes, respectively.
#'
#' @export
#' @name scale_trek
#'
#' @examples
#' library(ggplot2)
#' d <- diamonds[diamonds$cut >= "Very Good", ]
#' ggplot(d, aes(carat, stat(count), fill = cut)) +
#'   geom_density(position = "fill") +
#'   scale_fill_trek("starfleet")
scale_color_trek <- function(palette = "starfleet", discrete = TRUE, reverse = FALSE, ...){
  pal <- grDevices::colorRampPalette(trek_pal(palette, reverse))
  if(discrete){
    ggplot2::discrete_scale("colour", palette, palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' @export
#' @rdname scale_trek
scale_fill_trek <- function(palette = "starfleet", discrete = TRUE, reverse = FALSE, ...){
  pal <- grDevices::colorRampPalette(trek_pal(palette, reverse))
  if(discrete){
    ggplot2::discrete_scale("fill", palette, palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
