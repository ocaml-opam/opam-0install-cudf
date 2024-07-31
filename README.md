* [API docs](https://ocaml-opam.github.io/opam-0install-cudf)

**NOTE: opam-0install-cudf previously resided at together with opam-0install https://github.com/ocaml-opam/opam-0install-solver but has now been split into its own repository at https://github.com/ocaml-opam/opam-0install-cudf. The git history for both are the same, up until d19d6fe797d565f4df38823d8bb3df616adb6411**

# Introduction

Opam's default solver is designed to maintain a set of packages over time,
minimising disruption when installing new programs and finding a compromise
solution across all packages.

In many situations (e.g. CI, local roots or duniverse builds) this is not necessary, and we
can get a solution much faster by usin a different algorithm.

This package provides a generic solver library which uses 0install's solver library.
The library uses the [CUDF](https://gitlab.com/irill/cudf) library in order to interface
with opam as it is the format common used to talk to all the supported solvers.
