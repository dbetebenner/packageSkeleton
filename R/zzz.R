.onLoad <- function(libname, pkgname) {
  # You can initialize package settings or environment variables here if needed
}

.onAttach <- function(libname, pkgname) {
  if (interactive()) {
    # Extract version information
    version <- packageVersion("packageSkeleton")
    formatted_version <- gsub("\\.", "-", as.character(version))  # Replace dots with dashes
    
    # Define a friendly startup message
    message_text <- paste0(
      magenta$bold("packageSkeleton"), " v", formatted_version, 
      " (11-4-2024)\n",
      "For help, type: ", magenta$bold("> help(\"packageSkeleton\")"), " or visit:\n",
      magenta$bold("https://centerforassessment.github.io/packageSkeleton")
    )
    
    # Display the startup message
    packageStartupMessage(message_text)
  }
}
