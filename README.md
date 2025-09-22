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

The simplest way to use these templates is to run the following command.

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

You can put these templates in the `$HOME/.pandoc/templates/` directory 
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
needed to publish a paper in a specific style. The repository lacks some
features that I use, such as a `Makefile` that automates the build process and
streamlines publishing to arXiv.

## Contributing

Every contribution is welcome.

## Dependencies

- [pandoc](https://pandoc.org/) - a universal document converter


[pandoc]: https://pandoc.org/


