[![CI](https://github.com/AliaumeL/pandoc-papers/actions/workflows/ci.yaml/badge.svg)](https://github.com/AliaumeL/pandoc-papers/actions/workflows/ci.yaml)

[![Deploy static content to Pages](https://github.com/AliaumeL/pandoc-papers/actions/workflows/github-pages.yaml/badge.svg)](https://github.com/AliaumeL/pandoc-papers/actions/workflows/github-pages.yaml)

# pandoc-papers

A collection of [pandoc] templates for various conferences and journals, with
opinionated variables, packages and options. The idea is to provide a 
consistent and easy-to-use set of templates that are based one 
formalised metadata file.

The metadata file can be used regardless of the templates, to provide machine
readable and human readable information about the paper, that can be used to
index and better reference the paper. The metadata file should be named
`paper-meta.yaml` file, and be placed at the root of the paper's repository.
Its content is described in the `paper-meta.schema.json` file, and sample files
can be found in the `examples/` directory.

## Usage 

### Using Defaults Files (Recommended)

After installation with `make install`, the simplest way to use these templates 
is with the defaults files:

```bash
pandoc \
  --defaults=pandoc-papers-<style>     \
  --metadata-file=paper-meta.yaml      \
  --metadata="some-key:some-value"     \
  --output=paper.tex                   \
  <your-document>.md
```

Where `<style>` is one of: `acmart`, `lipics`, `lncs`, or `plain`.

### Manual Usage

You can also use the templates directly without installation:

```bash
pandoc \
  --lua-filter=filters/git-meta.lua              \
  --template=<template-name>/<template-main>.tex \
  --metadata-file=paper-meta.yaml                \
  --metadata="some-key:some-value"               \
  --output=paper.<template-main>.tex             \
  <your-document>.md
```

## Installation

### Automated Installation (Recommended)

The easiest way to install the templates is using the provided Makefile:

```bash
make install
```

This will install all templates, filters, and defaults files to your Pandoc data directory.

You can then use the templates with:
```bash
pandoc --defaults=pandoc-papers-acmart input.md -o output.tex
pandoc --defaults=pandoc-papers-lipics input.md -o output.tex
pandoc --defaults=pandoc-papers-lncs input.md -o output.tex
pandoc --defaults=pandoc-papers-plain input.md -o output.tex
```

To remove the installation:
```bash
make remove
```

### Manual Installation

Alternatively, you can manually put these templates in the `$HOME/.pandoc/templates/` directory 
on unix-like systems, or `%APPDATA%\pandoc\templates\` on Windows.

## Available templates

- [x] [article](https://www.latex-project.org/help/documentation/article/)
- [x] [lipics](https://lipics-conference.github.io/lipics-v2024/)
- [x] [lncs](https://www.springer.com/gp/computer-science/lncs)
- [x] [acmart](https://www.acm.org/publications/proceedings-template)

Note that in the templates, classical packages are included and configured in
an opinionated way. In particular, I use the `ensps-colorscheme` package to
provide a consistent color scheme across all templates, and the `knowledge` to
manage internal links in the documents.

## Status

This repository is in an early stage and the templates were created whenever I
needed to publish a paper in a specific style. The repository now includes a
`Makefile` for easy installation and removal of templates and defaults files.

## Contributing

Every contribution is welcome.

## Dependencies

- [pandoc](https://pandoc.org/) - a universal document converter


[pandoc]: https://pandoc.org/


