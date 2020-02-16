# love2d-template

A template for writing games with [Love2D](https://love2d.org/) using
[Fennel](https://fennel-lang.org/). Includes several features out of the box:

- A standard library, provided by:
  - A version of [Lume](https://github.com/rxi/lume), with some bugfixes applied.
  - `stdlib.fnl`, written expressly for this project.
- A stackable mode system, provided by `mode-stack.fnl`

**TODO**

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

## License

MIT Open Source Licensed. Refer to `LICENSE` for more information.
