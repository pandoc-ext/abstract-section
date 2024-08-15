# Abstract nested in a div

The abstract section can be nested below a div.

``` markdown {#input}
::: {.frontmatter}
# Abstract

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
deserunt mollit anim id est laborum.

# Preface

* Phasellus purus.
* Praesent fermentum tempor tellus.
* Proin quam nisl, tincidunt et, mattis eget, convallis nec, purus.
:::

# Lorem Ipsum

Quo dolore molestiae et laboriosam occaecati explicabo corrupti.
Earum expedita ducimus quaerat est quam ut molestiae. Illum
deleniti vel labore facilis et cum est.
```

As with other placements of the abstract, it is removed from the
main document and placed in the metadata.

``` markdown {#output}
---
abstract: |
  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
  officia deserunt mollit anim id est laborum.
---

::: frontmatter
# Preface

-   Phasellus purus.
-   Praesent fermentum tempor tellus.
-   Proin quam nisl, tincidunt et, mattis eget, convallis nec, purus.
:::

# Lorem Ipsum

Quo dolore molestiae et laboriosam occaecati explicabo corrupti. Earum
expedita ducimus quaerat est quam ut molestiae. Illum deleniti vel
labore facilis et cum est.
```
