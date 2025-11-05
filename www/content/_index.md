+++
+++


## Pandoc Papers

<div style="display: inline; float: right">
{{ img(id="logo.svg",
       alt="Pandoc Papers Logo. It is a folder icon containing the words `Pa` and `Pa` respectively in red and blue.")
}}
</div>

This is the official webpage corresponding to the [pandoc
papers][pandoc-papers] repository on GitHub. It aims to provide three things:

1. A centralised location for various academic [paper templates](@/templates/_index.md) that can be used
   using [pandoc].
2. A formalised metadata file, called [paper-meta](@/schemas/paper-meta.md) that
   serves as a machine readable specification of the various metadata applying
   to an academic paper.
3. A formalised [paper-config](@/schemas/paper-config.md) metadata format, that
   serves as a specification of the various configuration options that can be
   used when producing a paper.

### Why use `pandoc-papers` at all?

For a writer, the main advantage of using `pandoc-papers` is that it provides a
(non-intrusive) way to move between different journal templates, for instance
when submitting to different journals, producing [ArXiv] versions, or even
automatically switching between the draft, anonymous, and camera-ready versions
of a paper.

Furthermore, the `paper-meta` specification format allows one to easily share
metadata between different tools (exporting the abstract of a paper,
automatically importing co-authors), without having to produce arcane LaTeX
commands.

Finally, the templates are curated with sane defaults and opinionated options,
so that standard packages are already included, environments configured, thus
minimising friction when switching between templates. For a full list of
included packages and options, please refer to the documentation of each
template.

### Cheat sheet

Using `pandoc-papers` requires the following files in your paper's project folder:

1. A `paper-meta.yaml` file, containing the metadata of your paper, 
   whose content is described in the [paper-meta documentation].
2. A `paper.md` file, containing basic configuration for your paper, 
   whose content is described in the [paper-config documentation].
3. The name of a template to use, for instance `acmart`, `lipics`, etc.

From these files, you can produce your paper in the desired format by running
the following command:

```bash
pandoc --defaults=<template-name> -o output-name.tex
```

Available outputs include

- [x] *plain*
  using the `article` class with sane defaults.
- [x] [lipics](https://github.com/dagstuhl-publishing/styles)
  using the LIPIcs 2024 template.
- [x] [lncs](https://www.springer.com/gp/computer-science/lncs)
  using the Springer LNCS template.
- [x] [acmart](https://www.acm.org/publications/proceedings-template)
  using the ACM proceedings template.
- [ ] Plain metadata, to export the paper's metadata to an easily copy-pastable
  plain text file
- [ ] Bibtex, to export the paper's metadata into a ready to use Bibtex entry.


### Installing

To not reinvent the wheel, this project builds on top of the excellent [pandoc]
tool for document conversion. If you have not done so already, please install
pandoc by following the instructions on the [pandoc installation
page](https://pandoc.org/installing.html).

There are two ways to use `pandoc-papers`, depending on whether you want to use
it for a one-off project, or if you want to be able to use it regularly. Both
ways start by downloading the latest release of `pandoc-papers` from the
[GitHub releases page][pandoc-papers-releases].

1. For a one-off usage, simply extract the content of the release to your
   paper's project folder.
2. For a more permanent installation, extract the content of the release to
   your computer's [`pandoc` defaults folder][pandoc-defaults-folder], that is
   typically `~/.pandoc/defaults/` on Unix systems, and
   `%APPDATA%\pandoc\defaults\` on Windows systems.
   
Once you have done so, you can start using the various templates as follows

```bash
pandoc --defaults=<template-name> -o output.tex input.md
```

where `<template-name>` is the name of the template you want to use (for
instance, `lipics`, `acmart`, etc.) if you installed `pandoc-papers` in your
`pandoc` defaults folder, or the path to the template file if you are using it
in a one-off manner, which is typically `./pandoc-papers/<template-name>.yaml`.

For your convenience, a `Makefile` is provided in the release, allowing you
to simply run 

```bash
make paper.<template>.tex
```

By default, the `Makefile` can also produce `paper.<template>.pdf` files,
provided you have a working LaTeX installation on your computer. The
compilation to PDF is done by calling [latexmk] on the generated `.tex` file.


## (Not so) Frequently Asked Questions

### How do I build the PDF version of my paper?

The recommended way to use the templates is that the `paper.md` file contains
only include directives to actual content. In this situation, once you have
produced the `.tex` file of your paper using `pandoc`, you can use any tool you
prefer to compile the PDF, without ever interacting with `pandoc` again (until
your paper is rejected and you resubmit it to another venue, of course).

Since templates of conferences require specific styles (`.cls` and `.sty`
files) and images (such as logos), you need to ensure that these files are
available to the LaTeX compiler. The easiest way is to copy these files to your
paper's project folder (this will likely be done only once), they are located
in `pandoc-papers/defaults/<template-name>/`. Another option is to add the
folder containing these files to the `TEXINPUTS` environment variable.



[pandoc-papers]: https://github.com/AliaumeL/pandoc-papers
[pandoc]: https://pandoc.org/
[ArXiv]: https://arxiv.org/
[pandoc-defaults-folder]: https://pandoc.org/MANUAL.html#defaults-files
[latexmk]: https://ctan.org/pkg/latexmk
