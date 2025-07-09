#!/bin/bash
# Script to compile dissertation in both HTML and PDF formats

echo "Compiling dissertation..."

# Compile HTML version first
echo "Rendering HTML version..."
quarto render --to html

if [ $? -eq 0 ]; then
    echo "HTML compilation successful!"
    echo "HTML version: ../../docs/dissertation/index.html"
    
    # Only try PDF if HTML worked
    echo "Rendering PDF version..."
    quarto render --to pdf
    
    if [ $? -eq 0 ]; then
        echo "PDF compilation successful!"
        echo "PDF version: ../../docs/dissertation/dissertation.pdf"
    else
        echo "PDF compilation failed. Check LaTeX setup."
        echo "HTML version is available at: ../../docs/dissertation/index.html"
    fi
else
    echo "HTML compilation failed. Check Quarto setup."
fi