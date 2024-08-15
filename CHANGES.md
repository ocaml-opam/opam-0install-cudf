v0.5.0 (15/08/2024)
-------------------

- Remove opam-0install (the project has been split off from opam-0install-cudf)

- Avoid global mutable state. This allows the solver to be potentially called
  multiple times without causing differences in output. (@kit-ty-kate #4)

- Add support for the avoid-version flag. This is enabled by default and can be
  disabled by setting the new `?handle_avoid_version` parameter to `false`.
  (@kit-ty-kate #2 #3)

- Add a new `?prefer_installed` parameter to encourage keeping installed
  packages if possible. (@kit-ty-kate #3)

- Add some tests (@kit-ty-kate #2 #3)

v0.4.3 (28/04/2022)
-------------------

- Add `?opam_version` to `Dir_context.std_env` (@emillon #36).
  It defaults to the version of opam libraries, but in some cases (e.g.
  ocaml-ci) it is useful to inject a value that comes from an external
  opam process.

- Sort `Reject` after `RealImpl` (@emillon #33).
  This improves error messages by displaying Rejects first.

- Expose diagnostics rolemap in Solver (@NathanReb #31).
  Allows library users to provide extra help on error.

- Cmdliner 1.1.0 compatibility (@dra27 #40)

- Fix compiler warnings from new fmt (@talex5 #32).

v0.4.2 (16/06/2021)
-------------------

- opam-0install: Upgrade to opam 2.1.0~rc (@kit-ty-kate #29)

- Upgrade to (lang dune 2.7) (@kit-ty-kate #29)

v0.4.1 (22/04/2021)
-------------------

- opam-0install-cudf: Remove unused (`cmdliner`) and unnecessary (`fmt`) dependencies
  for easier integration with opam.
  (@kit-ty-kate #28)

- opam-0install: Be explicit that `Ok` values are not passed to `Term.exit` (@talex5 #24)

v0.4 (09/10/2020)
----------------

- opam-0install-cudf: Fix conflict detection (@kit-ty-kate #20)

v0.3 (17/09/2020)
----------------

- opam-0install-cudf: Allow to tag packages as recommended when giving them to the solver (@kit-ty-kate #16)
  Recommanded packages might or might not be chosen by the solver depending on whether
  the most up-to-date Essential packages available are compatible with them.

- Add an option to get the least up-to-date version of each packages (@kit-ty-kate #18)
  Option available in both opam-0install and opam-0install-cudf libraries
  as well as a new --prefer-oldest option to the opam-0install binary.

- opam-0install-cudf: Remove the unnecessary dependency towards the opam library (@kit-ty-kate #15)

- Documentation: Add a link to API docs in the README (@talex5 #14 #17)

v0.2 (17/06/2020)
----------------

- Add a new `opam-0install-cudf` package (@kit-ty-kate #11).
  This uses opam's CUDF API, allowing the solver to be used directly from within opam.

- `Dir_context.std_env` now has some optional arguments, and also responds for `opam-version` (@talex5 #12).
  You will need to add an extra `()` argument to it to upgrade.

- Evaluate a package's `available` expression in `Dir_context` (@talex5 #12).
  This isn't needed for `Switch_context` because the switch does it for us, but
  `Dir_context` could return packages with `available: false`.

- Simplify the `CONTEXT` API (@talex5 #12).
  `candidates` now returns either `Ok opam` or `Error pkg` for each package.
  This is clearer than using an option type and avoids the need for a separate
  `load` function. It also makes it possible to filter packages based on the
  content of the opam file without having to load it twice. We also no longer
  bother loading the opam file for rejects (all we need is the name).

v0.1 (26/05/2020)
----------------

Initial release.
