type t

type selections

type diagnostics

val create :
  ?prefer_oldest:bool ->
  ?handle_avoid_version:bool ->
  ?prefer_installed:bool ->
  constraints:(Cudf_types.pkgname * (Cudf_types.relop * Cudf_types.version)) list ->
  Cudf.universe ->
  t
(** [create ~constraints universe] is a solver that gets candidates from [universe],
    filtering them using [constraints].

    @param prefer_oldest if [true] the solver is set to return the least
    up-to-date version of each package, if a solution exists. This is [false] by
    default.
    @before 0.4 the [prefer_oldest] parameter did not exist.

    @param handle_avoid_version if [true] the solver will try to avoid packages
    containing the [("avoid-version", `Int 1)] or [("avoid-version", `Bool true)]
    extra property (see {!Cudf.pkg_extra}). However, if a package both has
    this property and is installed, the solver will do as if the package didn't
    have the [avoid-version] property. This is [true] by default.
    @before 0.5 the [handle_avoid_version] parameter did not exist.

    @param prefer_installed if [true] the solver will try to prioritize keeping
    the versions of packages installed at their current version instead of
    the latest possible version. This is [false] by default.
    @before 0.5 the [prefer_installed] parameter did not exist. *)

val solve :
  t ->
  (Cudf_types.pkgname * [`Essential | `Recommended]) list ->
  (selections, diagnostics) result
(** [solve t packages] finds a compatible set of package versions that
    includes all packages in [packages] according to their requirement tag,
    and their required dependencies if needed. *)

val packages_of_result : selections -> (Cudf_types.pkgname * Cudf_types.version) list

val diagnostics : ?verbose:bool -> diagnostics -> string
(** [diagnostics d] is a message explaining why [d] failed, generated by
    performing another solve which doesn't abort on failure. *)
