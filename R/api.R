#' Create Hello World API Application
#' 
#' @title Initialize Hello World API using RestRserve
#' @description Creates and configures a RestRserve application for the Hello World functionality
#' @return A configured RestRserve application object
#' @export
#' @import RestRserve
#' @examples
#' \dontrun{
#' app <- create_helloworld_api()
#' backend <- BackendRserve$new()
#' backend$start(app, http_port = 8000)
#' }
create_helloworld_api <- function() {
    app <- RestRserve::Application$new()
    
    # Configure CORS middleware
    app$add_middleware(RestRserve::Middleware$new(
        process_request = function(request, response) {
            response$set_header("Access-Control-Allow-Origin", "*")
            response$set_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
            response$set_header("Access-Control-Allow-Headers", "Content-Type")
            return(NULL)
        }
    ))
    
    # Error handler
    error_handler <- function(request, response, error) {
        response$set_content_type("application/json")
        response$set_body(jsonlite::toJSON(list(
            status = "error",
            message = as.character(error)
        ), auto_unbox = TRUE))
        response$set_status_code(400)
    }
    app$set_error_handler(error_handler)
    
    # Hello endpoint handler
    hello_handler <- function(request, response) {
        # Get query parameters with defaults
        language <- request$get_query_parameter("language", default = "English")
        random <- as.logical(request$get_query_parameter("random", default = "false"))
        include_meta <- as.logical(request$get_query_parameter("include_meta", default = "false"))
        
        # Call helloWorld function
        result <- helloWorld(
            language = language,
            random = random,
            include_meta = include_meta
        )
        
        response$set_content_type("application/json")
        response$set_body(jsonlite::toJSON(result, auto_unbox = TRUE))
    }
    
    # Languages endpoint handler
    languages_handler <- function(request, response) {
        result <- list(
            status = "success",
            languages = getAvailableLanguages()
        )
        
        response$set_content_type("application/json")
        response$set_body(jsonlite::toJSON(result, auto_unbox = TRUE))
    }
    
    # OpenAPI documentation handler
    openapi_handler <- function(request, response) {
        swagger_spec <- list(
            openapi = "3.0.0",
            info = list(
                title = "Hello World API",
                version = "1.0.0",
                description = "API for getting Hello World greetings in multiple languages"
            ),
            paths = list(
                "/hello" = list(
                    get = list(
                        summary = "Get Hello World greeting",
                        parameters = list(
                            list(
                                name = "language",
                                'in' = "query",
                                description = "Language for the greeting",
                                required = FALSE,
                                schema = list(type = "string", default = "English")
                            ),
                            list(
                                name = "random",
                                'in' = "query",
                                description = "Get a random language greeting",
                                required = FALSE,
                                schema = list(type = "boolean", default = FALSE)
                            ),
                            list(
                                name = "include_meta",
                                'in' = "query",
                                description = "Include metadata about available languages",
                                required = FALSE,
                                schema = list(type = "boolean", default = FALSE)
                            )
                        ),
                        responses = list(
                            "200" = list(
                                description = "Successful response"
                            )
                        )
                    )
                ),
                "/languages" = list(
                    get = list(
                        summary = "Get available languages",
                        responses = list(
                            "200" = list(
                                description = "List of available languages"
                            )
                        )
                    )
                )
            )
        )
        
        response$set_content_type("application/json")
        response$set_body(jsonlite::toJSON(swagger_spec, auto_unbox = TRUE, pretty = TRUE))
    }
    
    # Register endpoints
    app$add_get("/hello", hello_handler)
    app$add_get("/languages", languages_handler)
    app$add_get("/openapi.json", openapi_handler)
    
    # Add OPTIONS handlers for CORS
    app$add_options("/hello", function(req, res) { res$set_status_code(204) })
    app$add_options("/languages", function(req, res) { res$set_status_code(204) })
    
    return(app)
}

#' Run Hello World API
#' 
#' @title Start Hello World API Server
#' @description Starts the Hello World API server using RestRserve
#' @param port The port number to listen on (default: 8000)
#' @param host The host address to listen on (default: "127.0.0.1")
#' @return None
#' @export
#' @examples
#' \dontrun{
#' run_helloworld_api(port = 8000)
#' }
run_helloworld_api <- function(port = 8000, host = "127.0.0.1") {
    app <- create_helloworld_api()
    backend <- RestRserve::BackendRserve$new()
    backend$start(app, http_port = port, host = host)
} 