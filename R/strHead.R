`strHead` <- 
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
				substr(str, 1, string_len + n_char)
			} else {
				substr(str, 1, min(n_char, string_len))  # Ensure it doesn't exceed string length
			}
		})

		names(result) <- NULL  # Remove names from the result
		return(result)
} ### END strHead function