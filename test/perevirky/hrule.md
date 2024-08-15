Normally, the abstract ends when a new section begins. However, no
all documents start with a section. An horizontal rule can be used
mark the end of the abstract in such a case.

``` markdown {#input}
::: {.frontmatter}
# Abstract

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
officia deserunt mollit anim id est laborum.

---

Mauris vel erat tincidunt, venenatis elit ac, luctus augue.
Aliquam sed hendrerit augue. Donec finibus mi et dolor semper, non
malesuada nulla ullamcorper.
:::

# Lorem Ipsum

Quo dolore molestiae et laboriosam occaecati explicabo corrupti.
Earum expedita ducimus quaerat est quam ut molestiae. Illum
deleniti vel labore facilis et cum est. Est nemo est vel ad.
```

``` markdown {#output}
---
abstract: |
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
  eiusmod tempor incididunt ut labore et dolore magna aliqua.

  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
  officia deserunt mollit anim id est laborum.
---

::: frontmatter
Mauris vel erat tincidunt, venenatis elit ac, luctus augue. Aliquam sed
hendrerit augue. Donec finibus mi et dolor semper, non malesuada nulla
ullamcorper.
:::

# Lorem Ipsum

Quo dolore molestiae et laboriosam occaecati explicabo corrupti. Earum
expedita ducimus quaerat est quam ut molestiae. Illum deleniti vel
labore facilis et cum est. Est nemo est vel ad.
```
