# CSS Organization

This directory contains the streamlined CSS architecture for the packageSkeleton website, featuring a consolidated design system with advanced styling and animations.

## File Structure

### Main Website Styles
- `website-custom.scss` - **Primary stylesheet** containing all core website styling (527 lines)
- `documents.css` - Specialized styling for the documents landing page

### Consolidated Design System

As of the latest update, this directory uses a **consolidated approach** where:
- ✅ `website-custom.scss` serves as the single source of truth for all main styling
- ✅ Content-specific styles remain modular (e.g., `documents.css`)
- ✅ Eliminated redundant files for cleaner architecture

## CSS Architecture

### Primary Stylesheet (`website-custom.scss`)

This comprehensive SCSS file includes:

#### **Core Design System**
- **Color Palette**: Sophisticated grey/black theme with RGB(237,237,235) base
- **Typography**: Professional font stack with enhanced heading hierarchy
- **SCSS Variables**: Logo paths and customizable defaults

#### **Advanced Navbar System**
- **Dynamic Background**: Smooth color transitions on scroll
- **Logo Integration**: Hover effects with color switching
- **Responsive Dropdown Menus**: 
  - Rounded corners with subtle shadows
  - Animated caret rotation (up ↔ down)
  - Inset hover effects with multi-layer shadows
  - Active state indication (black text + caret)

#### **Interactive Elements**
- **Link Styling**: Consistent grey-to-black hover transitions
- **Anchor Links**: Smooth color transitions with no underlines
- **Navigation**: Clean sidebar styling without underlines
- **Code Blocks**: Enhanced backgrounds and borders

#### **Advanced Animations**
- **Smooth Transitions**: 0.3s ease timing throughout
- **Hover Effects**: Left-to-right underline animations
- **Dropdown Animations**: Caret rotation with state management
- **Scroll Effects**: Dynamic navbar shrinking

### Specialized Styling (`documents.css`)

The documents page maintains its own dedicated stylesheet for:
- **Document Cards**: Grid layout with hover animations
- **Typography**: Document-specific heading and text styling  
- **Interactive Elements**: Buttons, tags, and action components
- **Responsive Design**: Mobile-optimized layouts

## Technical Implementation

### Color System
```scss
// Primary background colors
$body-bg: rgb(237, 237, 235);
body { background-color: rgb(237, 237, 235); }
body.shrink { background-color: rgb(237, 237, 238); }

// Dropdown menu colors
background-color: rgb(227, 227, 225);
hover: rgb(237, 237, 235);

// Link colors
default: #7c7c7c;
hover: #000;
```

### Advanced Shadow Effects
```scss
// Multi-layer inset shadows for dropdown items
box-shadow: inset 0 2px 4px rgba(222, 222, 220, 0.8), 
            inset 0 1px 2px rgba(222, 222, 220, 0.8),
            inset 0 -1px 2px rgba(222, 222, 220, 0.8),
            inset 0 -2px 4px rgba(222, 222, 220, 0.8);
```

### JavaScript Integration

The CSS works in conjunction with JavaScript for:
- **Dropdown State Management**: Caret rotation and color changes
- **Scroll Effects**: Dynamic navbar shrinking
- **Smooth Animations**: State transitions and hover effects

## File Organization

### Current Structure
```
assets/css/
├── website-custom.scss  (527 lines - MAIN STYLESHEET)
│   ├── SCSS Variables & Defaults
│   ├── Body & Layout Styling  
│   ├── Advanced Navbar System
│   ├── Dropdown Menu Animations
│   ├── Link & Typography Styling
│   ├── Enhanced Code Blocks
│   └── Responsive Design
└── documents.css        (197 lines - PAGE-SPECIFIC)
    ├── Document Grid Layout
    ├── Card Components
    ├── Interactive Elements
    └── Mobile Responsiveness
```

### Consolidation Benefits

1. **Performance**: Reduced HTTP requests (2 files vs. 4 previously)
2. **Maintainability**: Single source of truth for main styling
3. **Consistency**: Unified color palette and design language
4. **Modularity**: Page-specific styles remain separate

## Usage & Development

### Making Changes

1. **Global styling**: Edit `website-custom.scss`
   - Navbar, dropdowns, links, typography
   - Color scheme and animations
   - Interactive elements

2. **Document page**: Edit `documents.css`
   - Document cards and grid layout
   - Page-specific components

### Best Practices

1. **SCSS Variables**: Use `$variable-name` for reusable values
2. **Consistent Timing**: Use 0.3s ease for most transitions
3. **Color Harmony**: Maintain grey/black theme consistency
4. **Progressive Enhancement**: Ensure basic functionality without JavaScript
5. **Mobile-First**: Design for mobile, enhance for desktop

### Adding New Features

1. **New animations**: Follow existing transition patterns (0.3s ease)
2. **Color additions**: Extend the grey/black palette thoughtfully
3. **Interactive elements**: Maintain consistent hover states
4. **Responsive design**: Test across device sizes

## Technical Dependencies

### Quarto Integration
```yaml
# _quarto.yml configuration
theme:
  - cosmo
  - ./assets/css/website-custom.scss
css: 
  - ./assets/css/documents.css
```

### JavaScript Dependencies
- `scroll.js` - Navbar shrinking and dropdown management
- `jquery` - DOM manipulation and event handling
- Bootstrap classes - Dropdown state management (.show, .open) 