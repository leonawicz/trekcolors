context("palettes")

library(ggplot2)

test_that("trek_pal returns as expected", {
  expect_error(trek_pal("a"), "Invalid palette name.")
  x <- trek_pal()
  expect_is(x, "character")
  expect_equal(length(x), 35)
  expect_equal(length(trek_pal("lcars_series")), 31)
  expect_equal(trek_pal("starfleet", reverse = TRUE), rev(trek_pal("starfleet")))
})

test_that("view_trek_pals returns as expected", {
  file <- file.path(tempdir(), "test-plot.png")
  png(file)
  expect_is(p <- view_trek_pals(), "NULL")
  expect_is(view_trek_pals(c("starfleet", "starfleet2")), "NULL")
  dev.off()
  unlink(file, recursive = TRUE, force = TRUE)
})

test_that("trek scale functions return as expected", {
  p <- ggplot(diamonds, aes(carat, stat(count), color = cut, fill = cut)) +
    geom_density(position = "fill")
  expect_is(p + scale_color_trek("andorian") +
              scale_fill_trek("klingon"), "ggplot")
  p <- ggplot(diamonds, aes(carat, price)) + geom_bin2d()
  expect_is(p + scale_fill_trek("klingon", discrete = FALSE), "ggplot")
  p <- ggplot(diamonds, aes(carat, price)) +
    geom_density_2d(aes(color = ..level..))
  expect_is(p + scale_color_trek("andorian", discrete = FALSE), "ggplot")
})

test_that("LCARS helpers return as expected", {
  expect_equal(length(lcars_colors()), 31)
  expect_equal(length(lcars_2357()), 9)
  expect_equal(length(lcars_2357("tanoi")), 1)
  expect_equal(as.character(lcars_2357(c("a", "tanoi"))), c(NA, "#FFCC99"))
  expect_equal(length(lcars_2369()), 8)
  expect_equal(length(lcars_2369("tanoi")), 1)
  expect_equal(as.character(lcars_2369(c("a", "melrose"))), c(NA, "#9999FF"))
  expect_equal(length(lcars_2375()), 8)
  expect_equal(length(lcars_2375("tanoi")), 1)
  expect_equal(as.character(lcars_2375(c("a", "danub"))), c(NA, "#6688CC"))
  expect_equal(length(lcars_2379()), 8)
  expect_equal(length(lcars_2379("tanoi")), 1)
  expect_equal(as.character(lcars_2379(c("a", "husk"))), c(NA, "#BBAA55"))

  x <- lcars_pals()
  expect_is(x, "list")
  expect_equal(length(x), 12)

  expect_equal(lcars_pal(), as.character(lcars_2357()))
  expect_equal(lcars_pal("2369"), as.character(lcars_2369()))
  expect_equal(lcars_pal("2375"), as.character(lcars_2375()))
  expect_equal(lcars_pal("2379"), as.character(lcars_2379()))
  expect_error(lcars_pal(c("2357", "2365")), "Invalid LCARS palette name.")
  expect_error(lcars_pal("a"), "Invalid LCARS palette name.")
  expect_equal(lcars_pal(reverse = TRUE), rev(lcars_pal()))

  expect_is(lcars_colors_pal("2357"), "function")
  expect_is(lcars_colors_pal("2357", reverse = TRUE), "function")
  expect_is(lcars_colors_pal("blue-bell"), "function")
})

test_that("lcars scale functions return as expected", {
  p <- ggplot(diamonds, aes(carat, stat(count), color = cut, fill = cut)) +
    geom_density(position = "fill")
  expect_is(p + scale_fill_lcars("2357") + scale_color_lcars("2357"), "ggplot")
  expect_is(p + scale_fill_lcars1("atomic-tangerine", dark = TRUE,
                                  reverse = TRUE) +
              scale_color_lcars1("atomic-tangerine", dark = TRUE,
                                 reverse = TRUE), "ggplot")
  expect_is(p + scale_fill_lcars2("pale-canary", "danub", reverse = TRUE) +
              scale_color_lcars2("pale-canary", "danub", reverse = TRUE),
            "ggplot")

  p <- ggplot(diamonds, aes(carat, stat(count), color = cut, fill = cut)) +
    geom_density(position = "fill")
  expect_is(p + scale_fill_lcars2("pale-canary", "danub") +
              scale_color_lcars2("pale-canary", "danub"), "ggplot")
  expect_is(p + scale_fill_lcars2("pale-canary", "danub", divergent = TRUE) +
              scale_fill_lcars2("pale-canary", "danub", divergent = TRUE),
            "ggplot")
  expect_is(
    p +
      scale_fill_lcars2("pale-canary", "danub", dark = TRUE, divergent = TRUE) +
      scale_fill_lcars2("pale-canary", "danub", dark = TRUE, divergent = TRUE),
    "ggplot")

  p <- ggplot(diamonds, aes(carat, price)) + geom_bin2d()
  expect_is(p + scale_fill_lcars("2357", discrete = FALSE), "ggplot")
  expect_is(p + scale_fill_lcars1("rust", discrete = FALSE), "ggplot")
  expect_is(p + scale_fill_lcars2("rust", "danub", discrete = FALSE), "ggplot")
  p <- ggplot(diamonds, aes(carat, price)) +
    geom_density_2d(aes(color = ..level..))
  expect_is(p + scale_color_lcars("2357", discrete = FALSE), "ggplot")
  expect_is(p + scale_color_lcars1("tanoi", discrete = FALSE), "ggplot")
  expect_is(p + scale_color_lcars2("tanoi", "rust", discrete = FALSE), "ggplot")
})
