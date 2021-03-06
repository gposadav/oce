#' @param i Character string indicating the name of an item to extract.
#'
#' @param j Optional additional information on the `i` item.
#'
#' @param ... Optional additional information (ignored).
#'
#' @description
#' The \code{[[} method works for all `oce` objects, i.e.
#' objects inheriting from [oce-class].  The purpose
#' is to insulate users from the internal details of `oce`
#' objects, by looking for items within the various storage
#' slots of the object. Items that are not actually stored in
#' the object can also be extracted, including derived data such
#' as potential temperature, the units of measurement for
#' the data, data-quality flags, etc.
#'
#' @details
#'
#' A two-step process is used to try to find the
#' requested information. First, a class-specific function
#' tries to find it, but
#' if that fails, then a general function is used
#' (see next section).
#'
#' @section Details of the general method:
#'
#' If the specialized method produces no matches, the following generalized
#' method is applied. As with the specialized method, the procedure hinges
#' first on the values of `i` and, optionally, `j`. The work
#' proceeds in steps, by testing a sequence of possible conditions
#' in sequence.
#'
#' 1. A check is made as to whether `i` names one of the standard
#' `oce` slots. If so, `[[` returns the slot contents of that slot.
#' Thus, `x[["metadata"]]` will retrieve the `metadata` slot,
#' while `x[["data"]]` and `x[["processingLog"]]` return
#' those slots.
#'
#' 2. If `i` is a string ending in the
#' `"Unit"`, then the characters preceding that string
#' are taken to be the name of an item in the data object, and a list
#' containing the unit is returned. This list consists of an item
#' named `unit`, which is an [expression()], and
#' an item named `scale`, which is a string describing the
#' measurement scale.  If the string ends in `" unit"`, e.g.
#' `x[["temperature unit"]]` (note the space),
#' then just the expression is returned, and if it ends in
#' `" scale"`, then just the scale is returned.
#'
#' 3. If `i` is a string ending in `"Flag"`, then the corresponding
#' data-quality flag is returned (or `NULL` if there is no such flag).
#' For example, `x[["salinityFlag"]]` returns a vector of salinity
#' flags if `x` is a ctd object.
#'
#' 4. If `i` is `"sigmaTheta"`, then the value of
#' [swSigmaTheta()] is called with \code{x} as the sole
#' argument, and the results are returned. Similarly,
#' [swSigma0()] is used if `i="sigma0"`, and
#' [swSpice()] is used if `i="spice"`. Of course, these
#' actions only make sense for objects that contain
#' the relevant items within their `data` slot.
#'
#' 5. After these possibilities are eliminated,
#' the action depends on whether `j` has been provided.
#' If `j` is not provided, or is the string `""`,
#' then `i` is sought
#' in the `metadata` slot, and then in the `data` slot,
#' returning whichever is found first.  In other words, if `j`
#' is not provided, the `metadata` slot takes preference over
#' the `data` slot. However, if `j` is provided, then
#' it must be either the string `"metadata"` or `"data"`,
#' and it directs where to look.
#'
#' If none of the above-listed conditions holds, then `NULL` is returned,
#' without the issuance of a warning or error message. (This silent operation
#' is employed so that `[[` will behave like the normal R version.)
#'
#' @family functions that extract parts of oce objects

