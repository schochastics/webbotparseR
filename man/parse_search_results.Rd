% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parser.R
\name{parse_search_results}
\alias{parse_search_results}
\title{Parse search engine results}
\usage{
parse_search_results(path, engine, selectors = "latest")
}
\arguments{
\item{path}{character. either a path to a file that contains search results or a path to a directory containing search engine result files}

\item{engine}{character.}

\item{selectors}{either character or a \code{webbot_selectors} S3 object. For character, it represents the selectors version and valid choices are listed
in \code{selectors_versions} and "latest" (select the latest version). You can also supply your own \code{webbot_selectors} object.}
}
\value{
a tibble of parsed search engine results
}
\description{
Parse search engine results
}
\examples{
search_html <- system.file(
    "www.google.com_climatechange_text_2023-03-16_08_16_11.html",
    package = "webbotparseR")

parse_search_results(search_html, engine = "google text")
}
