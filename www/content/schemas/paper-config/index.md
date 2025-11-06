+++
title="Pandoc Papers Template Configuration Specification"
+++

You can find the [JSON Schema] specification of the
`paper-config.yaml` file below. 

## Sample

```yaml
$schema: paper-config.0.0.1.json
draft: true # allows todos, comments, and other draft features
anonymous: false # hides author information for anonymous submissions
camera-ready: false # disables line-numbers and other `reviewer` oriented features
libraries: # additional LaTeX libraries to include in the preamble
  - custom-library.tex
  - other-library.tex
appendix: # appendix files to include at the end of the document
  - appendix-a.tex
  - appendix-b.tex
bibliography: # bibliography files to use for references
  - references.bib
  - more-references.bib
```

## Versions

- **latest**: Refers to the latest version of the schema. [schema
  file](paper-config.schema.json)
- **v.0.0.1**: Initial version, supporting basic metadata such as title,
  authors, abstract, keywords, and publication information. [schema
  file](paper-config.schema.json)


[JSON Schema]: https://json-schema.org/
