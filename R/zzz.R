.onLoad <- function(libname, pkgname) {
}

.onAttach <- function(libname, pkgname) {
    if (interactive()) {
        # Extract version information
        version <- utils::packageVersion("packageSkeleton")

        # Define a friendly startup message
	message_text <- paste0(
	    magenta(bold("\uD83C\uDF89 packageSkeleton v", version)), " - ", toOrdinal::toOrdinalDate("2024-12-3"), "\n",
	    "\U1F4A1 Tip: ", magenta(bold("> help(\"packageSkeleton\")")), "\n",
	    "\U1F310 Docs: ", magenta(bold("https://centerforassessment.github.io/packageSkeleton")), "\n",
	    "\u2728 Happy packageSkeletoning!"
	)

        # Display the startup message
        packageStartupMessage(message_text)
    }
}
