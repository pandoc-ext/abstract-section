The abstract section must occur at the highest level *upto that
point*. So a lower level can be used, as long as the abstract
heading is not nested below another section.

``` markdown {#input}
## Abstract

Nullam eu ante vel est convallis dignissim. Fusce suscipit, wisi nec
facilisis facilisis, est dui fermentum leo, quis tempor ligula erat
quis odio. Nunc porta vulputate tellus.

## Lorem Ipsum

Quo dolore molestiae et laboriosam occaecati explicabo corrupti. Earum
expedita ducimus quaerat est quam ut molestiae. Illum deleniti vel
labore facilis et cum est. Est nemo est vel ad. Assumenda consequatur
rerum officiis atque officia. Est nihil iste cumque ad qui.
```

The abstract is still moved as expected:

``` markdown {#output}
---
abstract: |
  Nullam eu ante vel est convallis dignissim. Fusce suscipit, wisi nec
  facilisis facilisis, est dui fermentum leo, quis tempor ligula erat
  quis odio. Nunc porta vulputate tellus.
---

## Lorem Ipsum

Quo dolore molestiae et laboriosam occaecati explicabo corrupti. Earum
expedita ducimus quaerat est quam ut molestiae. Illum deleniti vel
labore facilis et cum est. Est nemo est vel ad. Assumenda consequatur
rerum officiis atque officia. Est nihil iste cumque ad qui.
```
