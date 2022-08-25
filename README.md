abstract-section
==================================================================

[![GitHub build status][CI badge]][CI workflow]

Filter that ensures that "Abstract" sections are handled as
expected.

[CI badge]: https://img.shields.io/github/workflow/status/pandoc-ext/abstract-section/CI?logo=github
[CI workflow]: https://github.com/abstract-section/actions/workflows/ci.yaml


Abstract in a dedicated section
------------------------------------------------------------------

This filter allows to write a document abstract as normal sections
in the main text. It moves any section titled "abstract" from the
main text into the metadata. Most output format templates expect
the abstract to be given as part of the metadata, but writing body
text is easier and more natural.

``` markdown
# Abstract

Place abstract here.

Multiple paragraphs are possible.
```

Without this filter, the abstract would need to be placed in the
document's metadata. The additional indentation and formatting
requirements in YAML headers are frequently perceived as confusing
or annoying, especially when writing longer texts.

``` yaml
---
abstract: |
  Place abstract here.

  Multiple paragraphs are possible.
---
```


This filter modifies the document such that the abstract section
behaves as if it was passed as metadata. It does so by looking for
a top-level header whose ID is `abstract`. Pandoc auto-creates IDs
based on header contents, so a header titled *Abstract* will
satisfy this condition.^[1]

[1]: This requires the `auto_identifier` extension. It is
     enabled by default.

The abstract can be placed anywhere in the document.

The filter assumes that the abstract runs up until the next
heading or [horizontal rule], whichever comes first. Thus the
abstract can be placed at the beginning of a document whose text
doesn't start with a heading:

``` markdown
# Abstract

The abstract text includes this.

* * * *

This text is the beginning of the document.
```

[horizontal rule]: https://pandoc.org/MANUAL.html#horizontal-rules

Usage
------------------------------------------------------------------

The filter modifies the internal document representation; it can
be used with many publishing systems that are based on pandoc.

### Plain pandoc

Pass the filter to pandoc via the `--lua-filter` (or `-L`) command
line option.

    pandoc --lua-filter abstract-section.lua ...

### Quarto

Users of Quarto can install this filter as an extension with

    quarto install extension pandoc-ext/abstract-section

and use it by adding `abstract-section` to the `filters` entry in
their YAML header.

``` yaml
---
filters:
  - abstract-section
---
```

### R Markdown

Use `pandoc_args` to invoke the filter. See the [R Markdown
Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/lua-filters.html)
for details.

``` yaml
---
output:
  word_document:
    pandoc_args: ['--lua-filter=abstract-section.lua']
---
```

License
------------------------------------------------------------------

This pandoc Lua filter is published under the MIT license, see
file `LICENSE` for details.
