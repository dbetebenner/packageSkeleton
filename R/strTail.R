#' Returns the Last \code{n} Characters of a String, with Support for Negative Values
#'
#' The \code{strTail} function extracts the last \code{n} characters of a provided string. 
#' If \code{n_char} is positive, it returns the last \code{n_char} characters; if negative, 
#' it returns all but the first \code{abs(n_char)} characters. The function handles input validation, 
#' ensuring that \code{n_char} is within the bounds of the string length. It’s useful for quickly 
#' trimming strings to desired lengths.
#'
#' @param string Character string or vector of character strings.
#' @param n_char Number of characters to take from the tail (starting at the last character) of the 
#' string (or vector of strings). A positive value returns the last \code{n_char} characters, 
#' while a negative value removes the first \code{abs(n_char)} characters from the start. Defaults to 1.
#'
#' @details The \code{strTail} function is commonly used to extract the last few characters from a 
#' character string or each string in a vector of character strings. This is helpful when you need to 
#' retrieve suffixes or the end portion of strings. The function supports both positive and negative values 
#' for \code{n_char}. For positive values, the function returns the last \code{n_char} characters, while 
#' for negative values, it excludes the first \code{abs(n_char)} characters from the start of each string.
#'
#' @return The function returns a character string or a vector of character strings, depending on the input. 
#' The output consists of the last \code{n_char} characters from each string in the input. If \code{n_char} 
#' is negative, the result excludes the first \code{abs(n_char)} characters from each string.
#'
#' @author Damian W. Betebenner \email{dbetebenner@nciea.org}
#'
#' @examples
#' # Example 1: Last two characters of each state name
#' strTail(state.name, 2)
#'
#' # Example 2: Last three characters of a single string
#' strTail("California", 3)
#'
#' # Example 3: Remove the first two characters from each string in a vector
#' strTail(c("apple", "banana", "cherry"), -2)
#'
#' # Example 4: Get the last character of each month name
#' strTail(month.name, 1)
#'
#' # Example 5: Handle a vector of different length strings
#' strTail(c("wolf", "elephant", "giraffe"), 4)
#'
#' @keywords misc models
#' @export
`strTail` <- 
function(
	string,
	n_char = 1) {

	# Ensure n_char is an integer and within valid bounds
	if (!is.numeric(n_char) || n_char != as.integer(n_char)) {
		stop("n_char must be an integer.")
	}
  
	# Apply the function to each element of the vector
	result <- sapply(string, function(str) {
		if (!is.character(str)) {
			stop("Each element must be a character string.")
		}
    
		string_len <- nchar(str)
    
		if (abs(n_char) > string_len) {
			stop("n_char is out of bounds for string: ", str)
		}
    
		if (n_char < 0) {
			substr(str, -n_char + 1, string_len)
		} else {
			substr(str, max(1, string_len - n_char + 1), string_len)
		}
	})

	names(result) <- NULL  # Remove names from the result
	return(result)
} ### END strTail function
