[![CI](https://github.com/AliaumeL/pandoc-papers/actions/workflows/ci.yaml/badge.svg)](https://github.com/AliaumeL/pandoc-papers/actions/workflows/ci.yaml)

[![Deploy static content to Pages](https://github.com/AliaumeL/pandoc-papers/actions/workflows/github-pages.yaml/badge.svg)](https://github.com/AliaumeL/pandoc-papers/actions/workflows/github-pages.yaml)

# pandoc-papers

A collection of [pandoc] templates for various conferences and journals, with
opinionated variables, packages and options. The idea is to provide a 
consistent and easy-to-use set of templates that are based one 
formalised metadata file.

## Installation

You can put the content of the `pandoc-paper` subfolder in the
`$HOME/.pandoc/templates/` directory on unix-like systems, or
`%APPDATA%\pandoc\templates\` on Windows.

## Available templates

- [x] [article](https://www.latex-project.org/help/documentation/article/)
- [x] [lipics](https://lipics-conference.github.io/lipics-v2024/)
- [x] [lncs](https://www.springer.com/gp/computer-science/lncs)
- [x] [acmart](https://www.acm.org/publications/proceedings-template)
- [x] [ieeetran](https://www.ieee.org/conferences/publishing/templates)

Note that in the templates, classical packages are included and configured in
an opinionated way. In particular, I use the `knowledge` package to manage
internal links in the documents.

## Status

This repository is in an early stage and the templates were created whenever I
needed to publish a paper in a specific style.

## Contributing

Every contribution is welcome.

## Dependencies

- [pandoc](https://pandoc.org/) - a universal document converter


[pandoc]: https://pandoc.org/


