library(testthat)

# Load the package data
data(Hello_World, envir = environment())

test_that("Basic functionality works", {
    # Test default English greeting
    result <- helloWorld()
    expect_type(result, "list")
    expect_equal(result$status, "success")
    expect_equal(result$language, "English")
    expect_true(is.character(result$greeting))
    
    # Test Spanish greeting
    result_spanish <- helloWorld("spanish")
    expect_equal(result_spanish$status, "success")
    expect_equal(result_spanish$language, "Spanish")
    expect_true(is.character(result_spanish$greeting))
})

test_that("Random selection works", {
    # Test random selection
    result <- helloWorld(random = TRUE)
    expect_type(result, "list")
    expect_equal(result$status, "success")
    expect_true(!is.null(result$greeting))
    expect_true(!is.null(result$language))
    
    # Test that multiple random calls might give different results
    results <- replicate(10, helloWorld(random = TRUE), simplify = FALSE)
    unique_languages <- unique(sapply(results, function(x) x$language))
    # There should be a good chance of getting at least 2 different languages in 10 tries
    expect_true(length(unique_languages) > 1)
})

test_that("Metadata inclusion works", {
    result <- helloWorld(include_meta = TRUE)
    expect_true(!is.null(result$metadata))
    expect_true(is.list(result$metadata))
    expect_true(!is.null(result$metadata$available_languages))
    expect_true(!is.null(result$metadata$total_languages))
    expect_true(!is.null(result$metadata$timestamp))
    
    # Check that total_languages matches length of available_languages
    expect_equal(
        result$metadata$total_languages,
        length(result$metadata$available_languages)
    )
})

test_that("Error handling works", {
    # Test invalid language
    result <- helloWorld("nonexistent_language")
    expect_equal(result$status, "error")
    expect_true(grepl("not found", result$message))
    
    # Test invalid language type
    expect_error(helloWorld(123))
    expect_error(helloWorld(TRUE))
    expect_error(helloWorld(list()))
})

test_that("Case insensitivity works", {
    # Test different cases of the same language
    result1 <- helloWorld("english")
    result2 <- helloWorld("ENGLISH")
    result3 <- helloWorld("English")
    
    expect_equal(result1$greeting, result2$greeting)
    expect_equal(result2$greeting, result3$greeting)
})

test_that("getAvailableLanguages function works", {
    languages <- getAvailableLanguages()
    expect_type(languages, "character")
    expect_true(length(languages) > 0)
    expect_true(is.character(languages))
    expect_true(all(!is.na(languages)))
    expect_true(all(languages == sort(languages))) # Should be sorted
    
    # Check that all languages are unique
    expect_equal(length(languages), length(unique(languages)))
})

test_that("Combined functionality works", {
    # Test random with metadata
    result <- helloWorld(random = TRUE, include_meta = TRUE)
    expect_equal(result$status, "success")
    expect_true(!is.null(result$metadata))
    expect_true(!is.null(result$greeting))
    
    # Verify that the selected language is in the available languages
    expect_true(
        result$language %in% result$metadata$available_languages
    )
})
