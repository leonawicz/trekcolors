#' Hex colors from LCARS color names
#'
#' Obtain hex colors from standard LCARS color names.
#'
#' These functions return the hex colors for LCARS color names. If no argument is provided, the functions return their respective LCARS color set.
#' These functions correspond to LCARS color palettes that contain named colors.
#' Other predefined LCARS color palettes are available but do not have names for each color.
#' You can see all LCARS palettes with \code{\link{lcars_pals}}.
#'
#' @param ... character, LCARS color names.
#'
#' @export
#' @name lcars_colors
#' @seealso \code{\link{lcars_pals}}
#'
#' @examples
#' lcars_colors()
lcars_colors <- function(...){
  x <- c(...)
  if(is.null(x)) .lcarscolors else .lcarscolors[x]
}

#' @export
#' @rdname lcars_colors
lcars_2357 <- function(...){
  x <- c(...)
  if(is.null(x)) .lcars2357 else .lcars2357[x]
}

#' @export
#' @rdname lcars_colors
lcars_2369 <- function(...){
  x <- c(...)
  if(is.null(x)) .lcars2369 else .lcars2369[x]
}

#' @export
#' @rdname lcars_colors
lcars_2375 <- function(...){
  x <- c(...)
  if(is.null(x)) .lcars2375 else .lcars2375[x]
}

#' @export
#' @rdname lcars_colors
lcars_2379 <- function(...){
  x <- c(...)
  if(is.null(x)) .lcars2379 else .lcars2379[x]
}

#' Palettes and palette generating functions based on LCARS colors
#'
#' Predefined and custom palettes based on LCARS colors.
#'
#' \code{lcars_pal} returns a predefined, qualitative LCARS color palette.
#' \code{lcars_color_pal} returns a palette generator based on specific colors.
#' \code{lcars_pals} is a function that takes no arguments and returns a list of all predefined LCARS palettes.
#'
#' Predefined palettes options for \code{palette} are \code{"2357"}, \code{"2369"}, \code{"2375"}, \code{"2379"},
#' \code{"alt"}, \code{"first_contact"}, \code{"nemesis"}, \code{"nx01"}, \code{"23c"}, \code{"29c"}, \code{"red_alert"} and \code{"cardassian"}.
#'
#' Custom palettes can also be constructed by passing a vector of colors to \code{palette} in \code{lcars_color_pal}.
#' This is useful for sequential and divergent palettes.
#' This is essentially a wrapper around \code{colorRampPalette} that understands LCARS color names.
#' It accepts any color, allowing you to still use a color like \code{"white"} or \code{"#FFFFFF"} as the midpoint in a divergent palette for example.
#' A special case is when you provide only a single color, e.g., \code{lcars_color_pal("husk")};
#' this is equivalent to \code{lcars_color_pal(c("white", "husk"))}.
#'
#' @param palette character, name of a single predefined LCARS palette; or a vector of LCARS or other colors. See details.
#' @param reverse logical, reverse color order.
#' @param ... additional arguments to pass to \code{colorRampPalette}.
#'
#' @return a palette generating function that takes an argument, \code{n}, the number of colors.
#' @export
#'
#' @examples
#' # All predefined LCARS palettes
#' lcars_pals()
#' # predefined palette
#' lcars_pal("2357")
#' # custom palettes
#' lcars_colors_pal("rust")(8) # sequential
#' lcars_colors_pal(c("pale-canary", "rust"))(8)
#' lcars_colors_pal(c("pale-canary", "rust"))(4)
#' lcars_colors_pal(c("mariner", "white", "rust"))(9) # divergent
lcars_pals <- function(){
  .lcars_pals
}

#' @export
#' @rdname lcars_pals
lcars_pal <- function(palette = "2357", reverse = FALSE){
  if(length(palette) > 1 || !palette %in% names(.lcars_pals))
    stop("Invalid LCARS palette name.", call. = FALSE)
  pal <- .lcars_pals[[palette]]
  if(reverse) rev(pal) else pal
}

#' @export
#' @rdname lcars_pals
lcars_colors_pal <- function(palette, reverse = FALSE, ...){
  pal <- palette
  if(length(pal) == 1) pal <- c("#FFFFFF", pal)
  idx <- pal %in% names(lcars_colors())
  if(any(idx)) pal[idx] <- lcars_colors(pal[idx])
  if(reverse) pal <- rev(pal)
  grDevices::colorRampPalette(pal, ...)
}

#' Color and fill scale functions for LCARS colors
#'
#' Scale functions used with ggplot2.
#'
#' @param palette character, name of palette in \code{lcars_pals}.
#' @param color character, LCARS color name for sequential palette.
#' @param low character, LCARS color name.
#' @param high character, LCARS color name.
#' @param discrete logical, discrete or continuous palette.
#' @param reverse logical, reverse color order.
#' @param dark logical, use black instead of white for the base color in sequential palette or midpoint in divergent palette.
#' @param divergent logical, use a divergent palette instead of two-color sequential palette.
#' @param ... additional arguments passed to \code{ggplot2::discrete_scale} or \code{ggplot2::scale_*_gradientn}, for discrete or continuous palettes, respectively.
#'
#' @export
#' @name scale_lcars
scale_color_lcars <- function(palette = "2357", discrete = TRUE, reverse = FALSE, ...){
  pal <- grDevices::colorRampPalette(lcars_pal(palette, reverse))
  if(discrete){
    ggplot2::discrete_scale("colour", paste0("lcars_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' @export
#' @rdname scale_lcars
scale_color_lcars1 <- function(color = "atomic-tangerine", discrete = TRUE, reverse = FALSE, dark = FALSE, ...){
  base <- if(dark) "#000000" else "#FFFFFF"
  color <- lcars_colors(color)
  pal <- c(base, color)
  if(reverse) pal <- rev(pal)
  pal <- grDevices::colorRampPalette(pal)
  if(discrete){
    ggplot2::discrete_scale("colour", names(color), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' @export
#' @rdname scale_lcars
scale_color_lcars2 <- function(low = "atomic-tangerine", high = "near-blue", discrete = TRUE, reverse = FALSE,
                               dark = FALSE, divergent = FALSE, ...){
  pal <- lcars_colors(c(low, high))
  base <- if(dark) "#000000" else "#FFFFFF"
  pal <- c(pal[1], if(divergent) base, pal[2])
  if(reverse) pal <- rev(pal)
  pal <- grDevices::colorRampPalette(pal)
  if(discrete){
    ggplot2::discrete_scale("colour", paste0(low, high, if(divergent) "div", sep = "_"), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}

#' @export
#' @rdname scale_lcars
scale_fill_lcars <- function(palette = "2357", discrete = TRUE, reverse = FALSE, ...){
  pal <- grDevices::colorRampPalette(lcars_pal(palette, reverse))
  if(discrete){
    ggplot2::discrete_scale("fill", paste0("lcars_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' @export
#' @rdname scale_lcars
scale_fill_lcars1 <- function(color = "atomic-tangerine", discrete = TRUE, reverse = FALSE, dark = FALSE, ...){
  base <- if(dark) "#000000" else "#FFFFFF"
  color <- lcars_colors(color)
  pal <- c(base, color)
  if(reverse) pal <- rev(pal)
  pal <- grDevices::colorRampPalette(pal)
  if(discrete){
    ggplot2::discrete_scale("fill", names(color), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' @export
#' @rdname scale_lcars
scale_fill_lcars2 <- function(low = "atomic-tangerine", high = "near-blue", discrete = TRUE, reverse = FALSE,
                               dark = FALSE, divergent = FALSE, ...){
  pal <- lcars_colors(c(low, high))
  base <- if(dark) "#000000" else "#FFFFFF"
  pal <- c(pal[1], if(divergent) base, pal[2])
  if(reverse) pal <- rev(pal)
  pal <- grDevices::colorRampPalette(pal)
  if(discrete){
    ggplot2::discrete_scale("fill", paste0(low, high, if(divergent) "div", sep = "_"), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}
