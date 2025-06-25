# Presentation Styling Guide

This directory contains presentations that can be rendered individually with proper styling. The styling approach uses content-specific CSS files located within the presentations directory for better organization and modularity.

## File Structure

```
content/presentations/
├── assets/
│   └── css/
│       ├── presentations-shared.css   # Shared styles for all presentations
│       └── presentation-styles.css    # Presentation-specific overrides
├── packageSkeleton_Presentation.qmd
└── README.md
```

## YAML Front Matter Template

For new presentations in this directory, use this template:

```yaml
---
title: "Your Presentation Title"
author: "Author Name"
date: "YYYY-MM-DD"
format:
  revealjs:
    theme: default
    css: 
      - assets/css/presentations-shared.css
      - assets/css/presentation-styles.css
    include-after: |
      <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,600" rel="stylesheet" type="text/css">
---
```

## Key Benefits

1. **Content-Specific Organization**: CSS is co-located with the content it styles
2. **No Path Issues**: Asset paths are relative to the content directory
3. **Shared Styling**: Common presentation styles are maintained in `presentations-shared.css`
4. **Presentation-Specific Overrides**: Each presentation can have custom styling via `presentation-styles.css`
5. **Consistent Look**: All presentations maintain the same visual identity
6. **Easy Maintenance**: Changes to shared styles apply to all presentations
7. **Modular Architecture**: Each content type (documents, presentations) has its own styling

## Rendering

To render a presentation individually:

```bash
quarto render presentation-name.qmd
```

The presentation will be styled properly and can be shared as a standalone HTML file.

## CSS Architecture

### Presentations-Shared.css
Contains all the common styling for presentations:
- Asset path definitions using CSS custom properties
- Reveal.js slide styling
- Typography and layout for slides
- Code block and link styling
- Navigation and progress bar styling
- Responsive design

### Presentation-Styles.css
Contains presentation-specific overrides and customizations:
- Context-specific asset path overrides
- Presentation-specific layout adjustments
- Custom styling for special slide types

## Customization

To add presentation-specific styles, edit `assets/css/presentation-styles.css`. For global presentation changes, edit `assets/css/presentations-shared.css`.

## How It Works

The styling system works by:

1. **Content-Specific CSS**: CSS files are located within the content directory they style
2. **Asset Path Management**: CSS custom properties handle asset paths for the specific context
3. **Shared + Specific**: Common styles in shared file, overrides in specific file
4. **Reveal.js Integration**: Styles target Reveal.js classes for proper slide formatting
5. **Responsive Design**: Styling automatically adapts to different screen sizes

## Presentation-Specific Features

The presentations use Reveal.js for slide functionality:
- **Navigation**: Arrow keys and click navigation
- **Progress Bar**: Shows presentation progress
- **Speaker Notes**: Available in speaker view
- **Export Options**: Can export to PDF, PowerPoint, etc. 