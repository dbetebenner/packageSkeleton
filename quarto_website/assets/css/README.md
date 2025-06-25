# CSS Organization

This directory contains CSS files for the main website, while content-specific styling is organized within each content directory for better modularity.

## File Structure

### Main Website Styles
- `website-styles.css` - Basic website styles and font imports
- `website-custom.scss` - Main website customization (navbar, layout, etc.)
- `documents.css` - Styling for the documents landing page

### Content-Specific Styles (Located in Content Directories)

#### Documents (`content/documents/assets/css/`)
- `documents-shared.css` - Shared styles for all documents
- `document-styles.css` - Document-specific overrides

#### Presentations (`content/presentations/assets/css/`)
- `presentations-shared.css` - Shared styles for all presentations
- `presentation-styles.css` - Presentation-specific overrides

## CSS Architecture

### Separation of Concerns

1. **Main Website Styles**: Applied across the entire website
   - `website-styles.css` - Basic typography and imports
   - `website-custom.scss` - Main website customization
   - `documents.css` - Documents landing page grid and cards

2. **Content-Specific Styles**: Applied to specific content types
   - **Documents**: Located in `content/documents/assets/css/`
   - **Presentations**: Located in `content/presentations/assets/css/`

### Benefits of Content-Specific Organization

1. **Co-location**: CSS is located with the content it styles
2. **Modularity**: Each content type has its own styling system
3. **Maintainability**: Easy to find and modify specific styles
4. **Reusability**: Styles can be shared within content types
5. **Performance**: Only load the CSS needed for each content type
6. **Scalability**: Easy to add new content types with their own styling
7. **Asset Path Management**: Relative paths work correctly for each context

## Usage

### Main Website
The main website uses all core styles plus page-specific styles as needed.

### Individual Documents
Documents in `content/documents/` use:
- `assets/css/documents-shared.css` - Common document styling
- `assets/css/document-styles.css` - Context-specific overrides

### Individual Presentations
Presentations in `content/presentations/` use:
- `assets/css/presentations-shared.css` - Common presentation styling
- `assets/css/presentation-styles.css` - Context-specific overrides

## Adding New Styles

1. **Global website changes**: Edit files in `assets/css/`
2. **Document changes**: Edit files in `content/documents/assets/css/`
3. **Presentation changes**: Edit files in `content/presentations/assets/css/`
4. **New content type**: Create `content/newtype/assets/css/` structure

## Best Practices

1. **Use CSS custom properties** for asset paths to handle different contexts
2. **Keep styles modular** - one file per major functionality
3. **Use semantic class names** that describe the purpose, not appearance
4. **Include responsive design** in each CSS file
5. **Document complex CSS** with comments
6. **Co-locate CSS with content** for better organization

## File Dependencies

```
Main Website:
website-styles.css (base)
    ↓
website-custom.scss (main site)
    ↓
documents.css (page-specific)

Documents:
content/documents/assets/css/documents-shared.css
    ↓
content/documents/assets/css/document-styles.css

Presentations:
content/presentations/assets/css/presentations-shared.css
    ↓
content/presentations/assets/css/presentation-styles.css
```

## Content-Specific Architecture

This approach provides several advantages:

1. **Clear Ownership**: Each content type owns its styling
2. **Easier Maintenance**: Changes to one content type don't affect others
3. **Better Organization**: Related files are grouped together
4. **Simplified Paths**: Asset paths are relative to the content directory
5. **Independent Development**: Teams can work on different content types independently 