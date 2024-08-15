It is common for certain works to include two abstracts, one in
English and one in the local language of an academic institution.
E.g., theses published at many German universities must have a
German "Zusammenfassung" in addition to the English "Abstract".

The filter can be configured to support those additional
abstract-like sections as well. The identifiers of the sections
must be listed in the `section-identifiers` field below the
`abstract-section` metadata entry. E.g.:

``` markdown {#input}
---
abstract-section:
  section-identifiers:
    - abstract
    - sammanfattning
---

# Abstract

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
ut aliquip ex ea commodo consequat. Duis aute irure dolor in
reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur.

# Sammanfattning {#sammanfattning}

Nullam tristique diam non turpis. Praesent fermentum tempor tellus.
Donec vitae dolor.

* * * * *

Quo dolore molestiae et laboriosam occaecati explicabo corrupti.
```

This will place the *Abstract* in the `abstract` variable as
before, but will also collect the contents of a *Sammanfattning*
section and place it in the `sammanfattning` field, where it can
be used for further processing, e.g., with a custom template.

``` markdown {#output}
---
abstract: |
  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
  nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
  reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
  pariatur.
sammanfattning: |
  Nullam tristique diam non turpis. Praesent fermentum tempor tellus.
  Donec vitae dolor.
---

Quo dolore molestiae et laboriosam occaecati explicabo corrupti.
```
