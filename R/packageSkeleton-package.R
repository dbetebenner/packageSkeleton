# Package-level documentation

#' packageSkeleton: A GitHub Repository Template for R Package Development with Quarto Integration
#'
#' The \code{packageSkeleton} R package provides a comprehensive template to jumpstart the development of an R package, 
#' complete with a structured framework for coding, documentation, and version control. It simplifies the process of 
#' setting up an R package repository on GitHub, offering built-in integration with Quarto for generating a professional, 
#' customizable website to showcase package documentation and vignettes. This template is designed to help both new 
#' and experienced R developers streamline package creation while ensuring best practices in documentation and collaboration. 
#' With minimal setup, users can focus on building and sharing valuable tools within the R ecosystem.
#'
#' @details
#' \tabular{ll}{
#'   Package: \tab packageSkeleton \cr
#'   Type: \tab Package \cr
#'   Version: \tab 0.0-0.9 \cr
#'   Date: \tab 2025-7-9 \cr
#'   License: \tab MIT \cr
#'   LazyLoad: \tab yes \cr
#' }
#'
#' @docType package
#' @name packageSkeleton-package
#' @title A GitHub repository featuring a starter template for R package development, paired with a Quarto-powered website.
#' @keywords package
"_PACKAGE"

# Dataset documentation for Hello_World

#' Hello World Sample Dataset
#'
#' The \code{Hello_World} dataset provides a simple example with greetings in different languages, 
#' useful for illustrating basic data frame operations in R.
#'
#' @format A data frame with 10 rows and 2 variables:
#' \describe{
#'   \item{\code{Language}}{A character vector indicating the language of the Hello World greeting.}
#'   \item{\code{Hello_World_Greeting}}{A character vector containing the word "Hello" in different languages.}
#' }
#'
#' @source Manually created for demonstration purposes.
#'
#' @usage Hello_World
#'
#' @examples
#' # Display the Hello_World dataset
#' Hello_World
#'
#' # Access the greeting column
#' Hello_World$Hello_World_Greeting
#'
#' # Access the language column
#' Hello_World$Language
#'
#' @docType data
#' @name Hello_World
#' @keywords datasets
NULL
