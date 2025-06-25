# Document Styling Guide

This directory contains documents that can be rendered individually with proper styling. The styling approach uses content-specific CSS files located within the documents directory for better organization and modularity.

## File Structure

```
content/documents/
├── assets/
│   └── css/
│       ├── documents-shared.css      # Shared styles for all documents
│       └── document-styles.css       # Document-specific overrides
├── an_introduction_to_hello_world.qmd
└── README.md
```

## YAML Front Matter Template

For new documents in this directory, use this template:

```yaml
---
title: "Your Document Title"
author: "Author Name"
date: "YYYY-MM-DD"
format:
  html:
    toc: false
    number-sections: false
    html: true
    page-layout: full
    theme: cosmo
    self-contained: true
    css: 
      - assets/css/documents-shared.css
      - assets/css/document-styles.css
    include-after: |
      <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,600" rel="stylesheet" type="text/css">
---
```

## Key Benefits

1. **Content-Specific Organization**: CSS is co-located with the content it styles
2. **No Path Issues**: Asset paths are relative to the content directory
3. **Shared Styling**: Common styles are maintained in `documents-shared.css`
4. **Document-Specific Overrides**: Each document can have custom styling via `document-styles.css`
5. **Consistent Look**: All documents maintain the same visual identity
6. **Easy Maintenance**: Changes to shared styles apply to all documents
7. **Self-Contained**: `self-contained: true` prevents 404 errors for Quarto libraries
8. **Modular Architecture**: Each content type (documents, presentations) has its own styling

## Rendering

To render a document individually:

```bash
quarto render document-name.qmd
```

The document will be styled properly and can be shared as a standalone HTML file.

## CSS Architecture

### Documents-Shared.css
Contains all the common styling for documents:
- Asset path definitions using CSS custom properties
- Base typography and layout
- Document header styling
- Code block and link styling
- Responsive design

### Document-Styles.css
Contains document-specific overrides and customizations:
- Context-specific asset path overrides
- Document-specific layout adjustments
- Custom styling for special content types

## Customization

To add document-specific styles, edit `assets/css/document-styles.css`. For global document changes, edit `assets/css/documents-shared.css`.

## How It Works

The styling system works by:

1. **Content-Specific CSS**: CSS files are located within the content directory they style
2. **Asset Path Management**: CSS custom properties handle asset paths for the specific context
3. **Shared + Specific**: Common styles in shared file, overrides in specific file
4. **Automatic Styling**: CSS targets standard HTML elements so no HTML wrappers are needed
5. **Responsive Design**: Styling automatically adapts to different screen sizes
6. **Self-Contained**: All necessary resources are embedded in the HTML file

## Troubleshooting

If you see 404 errors for Quarto libraries when rendering individually, make sure `self-contained: true` is included in the YAML front matter. This embeds all necessary CSS and JavaScript directly in the HTML file. 