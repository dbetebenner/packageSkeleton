\docType{data}
\name{Hello_World}
\alias{Hello_World}
\title{Hello World Sample Dataset}
\format{
  A data frame with 10 rows and 2 variables:
  \describe{
    \item{\code{Language}}{A character vector indicating the language of the Hello World greeting.}
    \item{\code{Hello_World_Greeting}}{A character vector containing the word "Hello" in different languages.}
  }
}

\source{
  Manually created for demonstration purposes.
}

\usage{
Hello_World
}

\examples{
# Display the hello_world dataset
Hello_World

# Access the greeting column
Hello_World$Hello_World_Greeting

# Access the language column
Hello_World$Language
}
\description{
The \code{Hello_World} dataset provides a simple example with greetings in different languages, useful for illustrating basic data frame operations in R.
}
