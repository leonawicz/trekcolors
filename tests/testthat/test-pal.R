context("palettes")

test_that("trekpal returns as expected", {
  expect_error(trekpal("a"), "`id` is not a predefined palette name.")
  x <- trekpal()
  expect_is(x, "character")
  expect_equal(length(x), 53)
  expect_equal(length(trekpal("lcarscolors")), 31)
})
