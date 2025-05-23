# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Gatsby-based knowledge base for programming articles and technical documentation. The repository serves as a personal knowledgebase with content organized in MDX format under `src/articles/`.

## Common Commands

- **Start development server**: `npm run develop` or `npm start`
- **Build production site**: `npm run build`
- **Serve built site**: `npm run serve`
- **Clean build cache**: `npm run clean`
- **Create new article**: `npm run article:new` (runs the interactive `create-new-article.sh` script)

## Architecture & Content Structure

### Article Organization
- All articles are stored as MDX files in `src/articles/programming/`
- Articles are categorized by technology/topic: `ASTs/`, `aws/`, `bash/`, `git/`, `js/`, `servers/`, `system-design/`, `work/`
- Each article has frontmatter with: `title`, `languages`, `topics`, `skillLevel`, `needsHelp`

### Content Schema
Programming articles follow this frontmatter structure:
```yaml
title: Article Title
languages:
  - javascript
  - bash
topics:
  - topic1
  - topic2
skillLevel: 1-5 (difficulty rating)
needsHelp: true/false (indicates if article needs improvement)
resources:
  - title: Resource Name
    linkUrl: https://example.com
```

### Key Components
- **Templates**: Located in `templates/` directory - `generic.mdx` and `system-design.mdx` for new articles
- **Scripts**: Utility scripts in `scripts/` for data processing and name abbreviation
- **Pages**: Gatsby pages in `src/pages/` with basic React structure
- **Static Assets**: Images and media in `static/images/`

### Article Creation Workflow
1. Run `npm run article:new` to launch the interactive script
2. Select template type (generic or system-design)
3. Choose output directory (defaults to `output/`)
4. Provide filename (extension added automatically)
5. Script copies template to specified location

## Development Notes

- This is a Gatsby site with no complex build requirements
- MDX files support both markdown and JSX components
- No testing framework or linting configuration detected
- Static images should be placed in `static/images/` directory
- The site uses standard Gatsby file-based routing