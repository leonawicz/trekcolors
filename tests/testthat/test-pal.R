context("palettes")

test_that("trek_pal returns as expected", {
  expect_error(trek_pal("a"), "Invalid palette name.")
  x <- trek_pal()
  expect_is(x, "character")
  expect_equal(length(x), 39)
  expect_equal(length(trek_pal("lcars_series")), 31)
})
