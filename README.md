packageSkeleton
===========

[![R-CMD-check](https://github.com/CenterForAssessment/packageSkeleton/workflows/R-CMD-check/badge.svg)](https://github.com/CenterForAssessment/packageSkeleton/actions)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/packageSkeleton)](http://cran.r-project.org/package=packageSkeleton)
[![Development Version](https://img.shields.io/badge/devel-0.0--0.7-brightgreen.svg)](https://github.com/CenterForAssessment/packageSkeleton)
[![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg?style=flat)](https://github.com/CenterForAssessment/packageSkeleton/blob/master/LICENSE.md)

# Overview

The **packageSkeleton** repository provides a comprehensive, production-ready template for creating professional [R](https://cran.r-project.org/) packages with integrated [Quarto](https://quarto.org/) documentation websites. This skeleton eliminates the complexity of package setup by providing a fully configured development environment that includes automated testing, continuous integration, and professional documentation hosting—all ready to deploy on GitHub.

Transform your R scripts and workflows into a professional, shareable package in minutes rather than hours. Whether you're consolidating personal utilities, creating tools for your team, or contributing to the open-source community, this skeleton provides everything you need to get started immediately.

## 🚀 Quick Start

1. **Use this template**: Click "Use this template" on GitHub or clone this repository
2. **Rename**: Replace "packageSkeleton" with your package name throughout the project
3. **Customize**: Add your functions to `R/`, update `DESCRIPTION`, and modify documentation
4. **Deploy**: Push to GitHub - your package website will automatically deploy via GitHub Pages

[📖 **Detailed Setup Guide**](https://centerforassessment.github.io/packageSkeleton/articles/packageSkeleton.html) | [🌐 **Live Example**](https://centerforassessment.github.io/packageSkeleton/)

## 📦 What's Included

This skeleton provides a complete R package infrastructure:

### Core Package Structure
```
packageSkeleton/
├── R/                          # Your R functions
├── man/                        # Auto-generated documentation
├── vignettes/                  # Package tutorials and examples
├── tests/                      # Automated testing framework
├── data/                       # Package datasets
├── DESCRIPTION                 # Package metadata
├── NAMESPACE                   # Package namespace (auto-managed)
└── LICENSE.md                  # License information
```

### Documentation & Website
```
├── _quarto.yml                 # Website configuration
├── index.qmd                   # Homepage content
├── articles/                   # Vignettes and tutorials
├── reference/                  # Function documentation
└── .github/workflows/          # Automated deployment
```

### Development Tools
- **Automated Testing**: Pre-configured `testthat` framework
- **CI/CD Pipeline**: GitHub Actions for testing and deployment
- **Code Coverage**: Integrated coverage reporting
- **Documentation**: Automatic function documentation with `roxygen2`
- **Website Hosting**: Automated Quarto website deployment to GitHub Pages
- **Package Checks**: Comprehensive R CMD CHECK validation

## ✨ Key Features

- **Zero-Configuration Setup**: Clone and start developing immediately
- **Automated Documentation**: Functions documented with roxygen2 are automatically included in your website
- **Professional Styling**: Clean, responsive Quarto website with modern design
- **Continuous Integration**: Automated testing on multiple R versions and operating systems
- **Easy Customization**: Modular structure allows easy modification of any component
- **Version Control**: Git-ready with appropriate `.gitignore` and configuration files
- **Cross-Platform**: Works seamlessly on Windows, macOS, and Linux

## 🎯 Perfect For

### Data Scientists & Analysts
- **Personal Utility Libraries**: Consolidate your frequently-used data cleaning, visualization, and analysis functions
- **Workflow Automation**: Package repetitive tasks into reusable functions with professional documentation
- **Team Collaboration**: Share standardized tools and methodologies across your organization

### R Developers
- **Package Prototyping**: Quickly test and iterate on package ideas with full infrastructure
- **Best Practices**: Learn modern R package development through a well-structured example
- **Portfolio Projects**: Create professional showcases of your R capabilities

### Educators & Researchers
- **Course Materials**: Package datasets, functions, and tutorials for students
- **Research Tools**: Share reproducible analysis tools with the scientific community
- **Workshop Resources**: Provide participants with ready-to-use packages and documentation

## 🛠️ Installation & Setup

### Prerequisites
- **R** (≥ 4.0.0) and **RStudio** (recommended)
- **Git** for version control
- **GitHub account** for hosting and collaboration
- Basic familiarity with R package structure

### Essential R Packages
Install these packages to fully utilize the skeleton:
```r
# Core development tools
install.packages(c("devtools", "usethis", "roxygen2", "testthat"))

# Documentation and website
install.packages(c("quarto", "pkgdown"))
```

### Setup Steps
1. **Create your repository**:
   - Click "Use this template" on the GitHub repository page
   - Name your new repository (e.g., "myAwesomePackage")
   - Clone to your local machine

2. **Customize the package**:
   ```r
   # In RStudio, open the project and run:
   usethis::use_description(fields = list(
     Title = "Your Package Title",
     Description = "What your package does",
     `Authors@R` = "Your Name <email@example.com> [aut, cre]"
   ))
   ```

3. **Add your content**:
   - Place R functions in `R/` directory
   - Add datasets to `data/` directory  
   - Create vignettes in `vignettes/` directory
   - Write tests in `tests/testthat/` directory

4. **Build and check**:
   ```r
   # Document functions and build package
   devtools::document()
   devtools::check()
   
   # Build website locally
   quarto::quarto_render()
   ```

5. **Deploy**:
   - Push changes to GitHub
   - Enable GitHub Pages in repository settings
   - Your website will be available at `https://yourusername.github.io/yourpackage`

## 💡 Content Ideas

Transform your R work into a professional package:

### **Data Manipulation Tools**
```r
# Example: Custom data cleaning functions
clean_survey_data <- function(df, remove_incomplete = TRUE) {
  # Your data cleaning logic here
}
```

### **Analysis Wrappers**
```r
# Example: Simplified statistical analysis
quick_regression <- function(data, outcome, predictors) {
  # Wrapper for common regression tasks
}
```

### **Visualization Functions**
```r
# Example: Themed plotting functions
theme_publication <- function() {
  # Custom ggplot2 theme for publications
}
```

### **Domain-Specific Tools**
- **Finance**: Portfolio analysis, risk calculations
- **Education**: Assessment scoring, growth modeling  
- **Healthcare**: Clinical data processing, outcome analysis
- **Marketing**: Customer segmentation, campaign analysis

## 🔧 Advanced Features

### Automated Testing
The skeleton includes a comprehensive testing framework:
```r
# Example test structure in tests/testthat/
test_that("my_function works correctly", {
  expect_equal(my_function(2, 3), 5)
  expect_error(my_function("a", "b"))
})
```

### Custom Documentation
Leverage roxygen2 for professional documentation:
```r
#' Calculate Summary Statistics
#'
#' This function calculates descriptive statistics for a numeric vector.
#'
#' @param x A numeric vector
#' @param na.rm Logical, should NA values be removed?
#' @return A list of summary statistics
#' @examples
#' calc_summary(c(1, 2, 3, 4, 5))
#' @export
calc_summary <- function(x, na.rm = TRUE) {
  # Function implementation
}
```

### Website Customization
Modify `_quarto.yml` to customize your site:
```yaml
website:
  title: "Your Package Name"
  navbar:
    left:
      - text: "Home"
        file: index.qmd
      - text: "Reference"
        file: reference/index.qmd
```

## 🤝 Why Create an R Package?

Creating an R package isn't just for CRAN submissions—it's about **building better tools for yourself and your team**:

- **Efficiency**: Stop copying functions between projects
- **Documentation**: Force yourself to document your work properly
- **Testing**: Ensure your functions work correctly across different scenarios
- **Sharing**: Easily distribute your tools to colleagues and collaborators
- **Portfolio**: Demonstrate your R skills professionally
- **Learning**: Master R package development best practices

## 📚 Learning Resources

- [📖 **Complete Setup Guide**](https://centerforassessment.github.io/packageSkeleton/articles/packageSkeleton.html): Step-by-step instructions
- [🔗 **R Packages Book**](https://r-pkgs.org/): Comprehensive guide by Hadley Wickham
- [🔗 **Quarto Documentation**](https://quarto.org/): Learn to customize your website
- [🔗 **GitHub Actions**](https://docs.github.com/en/actions): Understand the CI/CD pipeline

## 🆘 Support & Contributing

- **Issues**: Report bugs or request features via GitHub Issues
- **Discussions**: Ask questions and share ideas in GitHub Discussions  
- **Contributing**: Pull requests welcome! See `CONTRIBUTING.md` for guidelines
- **Community**: Join the broader R package development community

---

**Ready to start building?** [Use this template](https://github.com/CenterForAssessment/packageSkeleton/generate) and create your first R package today! 🎉

---

**Produced with double the love ❤️❤️ by:**

[Damian Betebenner](https://github.com/dbetebenner/packageSkeleton)

[Erik Whitfield](https://github.com/erwx)

[Brian Harrold](https://github.com/stat-brain)

[Nathan Dadey](https://github.com/ndadey) 
