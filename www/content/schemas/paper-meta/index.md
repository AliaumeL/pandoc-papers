+++
title="Pandoc Papers Metadata Specification"
+++

You can find the [JSON Schema] specification of the
`paper-meta.yaml` file below. 

## Sample

```yaml
$schema: paper-meta.0.0.1.schema.json
title: "Title of the Research Paper"
short-title: "Optional short title"
repository: "where to find the source code"
abstract: |
  Abstract of the paper, using markdown syntax
author:
 - name: Full author name
   initials: F. A.
   email: fa@test.com
   orcid: 0000-0000-XXXX-XXXX
   website: https://fa-website.com
   funding: "some funding info here"
   affiliation:
     - name: University of Example
       country: Wonderland
       city: Example City
     - name: Another Institution
       country: Wonderland
       city: Another City
 - name: Second Author
   email: sa@test.com
classification:
  acm_12:
    - desc: " some description "
      priority: 500
      id: " acm id "
  msc_10:
    - desc: " some description "
      priority: 500
      id: " msc id "
keywords:
  - kw1
  - kw2
  - kw3
```

## Classifications 

The classifications can easily be entered into the metadata file using the
following webside [acm classification
finder](https://aliaumel.github.io/acm-classifications/). For now, the
specification only supports the following classification systems

- [x] [ACM 1998]
- [x] [MSC 2010]
- [x] [ACM 2012] 

These are the most commonly used classification systems in computer science and
mathematics. Other classifications may be added in future versions of the
specification.

[ACM 1998]: https://cran.r-project.org/web/classifications/ACM.html
[MSC 2010]: https://www.ams.org/msc
[ACM 2012]: https://www.acm.org/publications/class-2012



## Versions

- **latest**: Refers to the latest version of the schema.
  [schema file](./paper-meta.schema.json)
- **v.0.0.1**: Initial version, supporting basic metadata such as title,
  authors, abstract, keywords, and publication information.
  [schema file](./paper-meta.schema.json)


[JSON Schema]: https://json-schema.org/
