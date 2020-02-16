# love2d-template

A template for writing games with [Love2D](https://love2d.org/) using
[Fennel](https://fennel-lang.org/). Includes several features out of the box:

## Installation

This guide assumes that you already have Love2D installed. If not, head over to
[their website](https://love2d.org/) and install it first. Installation of this
template constitutes cloning it, and redefining your remote to be your own Git
repository:

```bash
$ git clone https://github.com/crockeo/love2d-template
$ cd love2d-template
$ git remote rm origin
$ git remote add origin <URL of your git repo>
```

## Documentation

### stdlib

`stdlib` contains most of the general-purpose functionality that are:

1. Not included in Lua's standard library
2. Not included in Lume
3. Useful for writing games with Fennel / Love2D.

It is separated into subgroups, depending on the exact function. Below you'll
find an enumeration of each subgroup, along with documentation about its
functions.

#### math

`round`

`sign`

TODO

#### table

`call-on`

`print`

`union`

TODO

### mode-stack

TODO

## License

MIT Open Source Licensed. Refer to `LICENSE` for more information.
