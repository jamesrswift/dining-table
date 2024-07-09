# The `dining-table` Package
<div align="center">Version 0.1.0</div>

Implements a layer on top of table to allow the user to define a table by column rather than by row, to automatically handle headers and footers, to implement table footnotes, to handle nested column quirks for you, to handle rendering nested data structures.

Basically, if you are tabulating data where each row is an observation, and some features (columns) are to be grouped (a common case for scientific data) then this package might be worth checking out. Another use case is where you have multiple tables with identical layouts, and you wish to keep them all consistent with one another.

## Template adaptation checklist

- [ ] Fill out `README.md`
  - Change the `my-package` package name, including code snippets
  - Check section contents and/or delete sections that don't apply
- [ ] Fill out `typst.toml`
  - See also the [typst/packages README](https://github.com/typst/packages/?tab=readme-ov-file#package-format)
    if configured correctly, whenever you create a tag `v...`, your package will be pushed onto a branch on the `REGISTRY_REPO`, from which you can then create a pull request against [typst/packages](https://github.com/typst/packages/)
- [ ] (add your actual code, docs and tests)
- [ ] remove this section from the README

## Getting Started

These instructions will get you a copy of the project up and running on the typst web app. Perhaps a short code example on importing the package and a very simple teaser usage.

```typ
#import "@preview/dining-table:0.1.0"

#show: my-show-rule.with()
#my-func()
```

## Usage

A more in-depth description of usage. Any template arguments? A complicated example that showcases most if not all of the functions the package provides? This is also an excellent place to signpost the manual.

```typ
#import "@preview/my-package:0.1.0": *

#let my-complicated-example = ...
```