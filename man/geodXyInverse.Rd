% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geod.R
\name{geodXyInverse}
\alias{geodXyInverse}
\title{Inverse Geodesic Calculation}
\usage{
geodXyInverse(x, y, longitudeRef, latitudeRef, debug = getOption("oceDebug"))
}
\arguments{
\item{x}{value of x in metres, as given by \code{\link[=geodXy]{geodXy()}}}

\item{y}{value of y in metres, as given by \code{\link[=geodXy]{geodXy()}}}

\item{longitudeRef}{reference longitude, as supplied to \code{\link[=geodXy]{geodXy()}}}

\item{latitudeRef}{reference latitude, as supplied to \code{\link[=geodXy]{geodXy()}}}

\item{debug}{an integer specifying whether debugging information is
to be printed during the processing. This is a general parameter that
is used by many \code{oce} functions. Generally, setting \code{debug=0}
turns off the printing, while higher values suggest that more information
be printed. If one function calls another, it usually reduces the value of
\code{debug} first, so that a user can often obtain deeper debugging
by specifying higher \code{debug} values.}
}
\value{
a data frame containing \code{longitude} and \code{latitude}
}
\description{
The calculation is done by finding a minimum value of a cost
function that is the vector difference between (\code{x},\code{y})
and the corresponding values returned by \code{\link[=geodXy]{geodXy()}}.
See \dQuote{Caution}.
}
\details{
The minimum is calculated in C for speed, using the \code{nmmin} function
that is the underpinning for the Nelder-Meade version of the R function
\code{\link[=optim]{optim()}}. If you find odd results, try setting \code{debug=1}
and rerunning, to see whether this optimizer is having difficulty
finding a minimum of the mismatch function.
}
\section{Caution}{
 This scheme is without known precedent in the literature, and
users should read the documentation carefully before deciding to use it.
}

\seealso{
Other functions relating to geodesy: 
\code{\link{geodDist}()},
\code{\link{geodGc}()},
\code{\link{geodXy}()}
}
\concept{functions relating to geodesy}
