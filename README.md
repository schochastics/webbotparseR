
<!-- README.md is generated from README.Rmd. Please edit that file -->

# webbotparseR <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/schochastics/webbotparseR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/schochastics/webbotparseR?branch=main)
[![R-CMD-check](https://github.com/schochastics/webbotparseR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/schochastics/webbotparseR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

webbotparseR allows to parse search engine results that where scraped
with the [WebBot](https://github.com/gesiscss/WebBot) browser extension.
A similar python library is [also
available](https://github.com/gesiscss/WebBot-tutorials).

## Installation

You can install the development version of webbotparseR like so:

``` r
remotes::install_github("schochastics/webbotparseR")
```

The package contains an example html from a google search on climate
change.

``` r
library(webbotparseR)
ex_file <- system.file("www.google.com_climatechange_text_2023-03-16_08_16_11.html", package = "webbotparseR")
```

Such search results can be parsed via the function
`parse_search_results()`. The parameter `engine` is used to specify the
search engine and the search type.

``` r
output <- parse_search_results(path = ex_file,engine = "google text")
output
#> # A tibble: 10 × 10
#>    title link  text  image page  posit…¹ searc…² type  query date               
#>    <chr> <chr> <chr> <chr> <chr>   <int> <chr>   <chr> <chr> <dttm>             
#>  1 What… http… Clim… data… 1           1 www.go… text  clim… 2023-03-16 08:16:11
#>  2 Home… http… Vita… data… 1           2 www.go… text  clim… 2023-03-16 08:16:11
#>  3 Vita… http… “Cli… data… 1           3 www.go… text  clim… 2023-03-16 08:16:11
#>  4 Clim… http… In c… data… 1           4 www.go… text  clim… 2023-03-16 08:16:11
#>  5 IPCC… http… The … data… 1           5 www.go… text  clim… 2023-03-16 08:16:11
#>  6 Clim… http… Comp… data… 1           6 www.go… text  clim… 2023-03-16 08:16:11
#>  7 Clim… http… Clim… <NA>  1           7 www.go… text  clim… 2023-03-16 08:16:11
#>  8 UNFC… http… What… data… 1           8 www.go… text  clim… 2023-03-16 08:16:11
#>  9 Clim… http… Clim… data… 1           9 www.go… text  clim… 2023-03-16 08:16:11
#> 10 Caus… http… This… data… 1          10 www.go… text  clim… 2023-03-16 08:16:11
#> # … with abbreviated variable names ¹​position, ²​search_engine
```

Note that images are always returned base64 encoded.

``` r
output$image[1]
#> [1] "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAABnRSTlMAAAAAAABupgeRAAAAMklEQVR4AWMAgYYG4hEdNJAHGoCIABvBJayhgcYaIAwaakCwydUA52MKYeeSCgZh4gMAXrJ9ASggqqAAAAAASUVORK5CYII="
```

The function `base64_to_img()` can be used to decode the image and save
it in an appropriate format.
