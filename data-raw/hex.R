#install.packages("hexSticker")
library(hexSticker)
library(ggplot2)
pkg <- basename(getwd())
user <- "leonawicz"
account <- "github"

url <- paste0(user, ".", account, ".io/", pkg)
out <- paste0("man/figures/logo.png")
dir.create("man/figures", showWarnings = FALSE)
x <- grid::rasterGrob(png::readPNG("data-raw/bg.png"), interpolate = TRUE)
g <- ggplot() + theme_void() + theme_transparent() + annotation_custom(x)

hex_plot <- function(out, mult = 1){
  sticker(
    g, s_x = 1, s_y = 1, s_width = 2.5, s_height = 2.5,
    package = pkg, p_y = 1, p_color = "black", p_size = 20,
    h_color = "black", h_fill = trek_pal("starfleet2")[5], h_size =  1.4,
    url = url, u_color = "black", u_size = 3,
    white_around_sticker = TRUE, filename = out
  )
}

hex_plot(out)
