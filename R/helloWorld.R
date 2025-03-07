#' Hello World in Multiple Languages
#' 
#' @title Multi-language Hello World Function
#' @description Returns "Hello, World!" in various languages using the Hello_World dataset
#' 
#' @param language Character string specifying the language (default: "English")
#' @param random Logical indicating whether to return a random language greeting (default: FALSE)
#' @param include_meta Logical indicating whether to include metadata (default: FALSE)
#' 
#' @return A list containing the greeting and optional metadata
#' @export
#' @import data.table
#' @importFrom utils data
#' 
#' @examples
#' helloWorld()  # Returns English greeting
#' helloWorld("spanish")  # Returns Spanish greeting
#' helloWorld(random = TRUE)  # Returns random language greeting
#' helloWorld(include_meta = TRUE)  # Returns greeting with metadata
#' 
helloWorld <- function(language = "English", random = FALSE, include_meta = FALSE) {
    # Input validation
    if (!is.character(language)) {
        stop("Language must be a character string")
    }
    
    # Function to format response
    format_response <- function(greeting, lang, meta = FALSE) {
        response <- list(
            status = "success",
            greeting = greeting,
            language = lang
        )
        
        if (meta) {
            response[['metadata']] <- list(
                available_languages = sort(unique(packageSkeleton::Hello_World[["language"]])),
                total_languages = uniqueN(packageSkeleton::Hello_World, by = "language"),
                timestamp = Sys.time()
            )
        }
        
        return(response)
    }
    
    # Handle random selection
    if (random) {
        selected <- packageSkeleton::Hello_World[sample(.N, 1)]
        return(format_response(selected[['hello_world_greeting']], selected[['language']], include_meta))
    }
    
    # Normal language selection
    language_lower <- tolower(language)
    greeting_row <- packageSkeleton::Hello_World[language_lower == tolower(language)]
    
    if (nrow(greeting_row) == 0L) {
        return(list(
            status = "error",
            message = sprintf("Language '%s' not found. Use include_meta=TRUE to see available languages.", language)
        ))
    }
    
    return(format_response(greeting_row[['hello_world_greeting']], greeting_row[['language']], include_meta))
}

#' Get Available Languages
#' 
#' @title List Available Languages
#' @description Returns a list of all available languages in the Hello_World dataset
#' 
#' @return A character vector of available languages
#' @export
#' @import data.table
#' 
getAvailableLanguages <- function() {
    return(packageSkeleton::Hello_World[["language"]])
}
