% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adp.sontek.R
\name{read.adp.sontek.serial}
\alias{read.adp.sontek.serial}
\title{Read a serial Sontek ADP file}
\usage{
read.adp.sontek.serial(
  file,
  from = 1,
  to,
  by = 1,
  tz = getOption("oceTz"),
  longitude = NA,
  latitude = NA,
  type = c("adp", "pcadp"),
  beamAngle = 25,
  orientation,
  monitor = FALSE,
  processingLog,
  debug = getOption("oceDebug"),
  ...
)
}
\arguments{
\item{file}{a connection or a character string giving the name of the file
to load.  (For \code{read.adp.sontek.serial}, this is generally a list of
files, which will be concatenated.)}

\item{from}{indication of the first profile to read.  This can be an
integer, the sequence number of the first profile to read, or a POSIXt time
before which profiles should be skipped, or a character string that converts
to a POSIXt time (assuming UTC timezone).  See \dQuote{Examples}, and make
careful note of the use of the \code{tz} argument. If \code{from} is not
supplied, it defaults to 1.}

\item{to}{an optional indication of the last profile to read, in a
format as described for \code{from}.  As a special case, \code{to=0} means
to read the file to the end.  If \code{to} is not supplied, then it defaults
to 0.}

\item{by}{an optional indication of the stride length to use while walking through
the file.  If this is an integer, then \code{by-1} profiles are skipped
between each pair of profiles that is read, e.g. the default \code{by=1}
means to read all the data.  (For RDI files \emph{only}, there are some
extra features to avoid running out of memory; see \dQuote{Memory considerations}.)}

\item{tz}{character string indicating time zone to be assumed in the data.}

\item{longitude}{optional signed number indicating the longitude in degrees
East.}

\item{latitude}{optional signed number indicating the latitude in degrees
North.}

\item{type}{a character string indicating the type of instrument.}

\item{beamAngle}{angle between instrument axis and beams, in degrees.}

\item{orientation}{optional character string specifying the orientation of the
sensor, provided for those cases in which it cannot be inferred from the
data file.  The valid choices are \code{"upward"}, \code{"downward"}, and
\code{"sideward"}.}

\item{monitor}{boolean, set to \code{TRUE} to provide an indication of progress
in reading the file, either by printing a dot for each profile or by writing
a textual progress bar with \code{\link[=txtProgressBar]{txtProgressBar()}}.}

\item{processingLog}{if provided, the action item to be stored in the log.
(Typically only provided for internal calls; the default that it provides is
better for normal calls by a user.)}

\item{debug}{a flag that turns on debugging.  Set to 1 to get a moderate
amount of debugging information, or to 2 to get more.}

\item{\dots}{optional additional arguments that some (but not all)
\verb{read.adp.*()} functions pass to lower-level functions.}
}
\value{
An \linkS4class{adp} object.
The contents of that object make sense for the particular instrument
type under study, e.g. if the data file contains
NMEA strings, then navigational data will be stored in an item
called \code{nmea} in the \code{data} slot).
}
\description{
Read a Sontek acoustic-Doppler profiler file, in a serial form that
is possibly unique to Dalhousie University.
}
\seealso{
Other things related to adp data: 
\code{\link{[[,adp-method}},
\code{\link{[[<-,adp-method}},
\code{\link{ad2cpHeaderValue}()},
\code{\link{adp-class}},
\code{\link{adpEnsembleAverage}()},
\code{\link{adp_rdi.000}},
\code{\link{adp}},
\code{\link{as.adp}()},
\code{\link{beamName}()},
\code{\link{beamToXyzAdpAD2CP}()},
\code{\link{beamToXyzAdp}()},
\code{\link{beamToXyzAdv}()},
\code{\link{beamToXyz}()},
\code{\link{beamUnspreadAdp}()},
\code{\link{binmapAdp}()},
\code{\link{enuToOtherAdp}()},
\code{\link{enuToOther}()},
\code{\link{handleFlags,adp-method}},
\code{\link{is.ad2cp}()},
\code{\link{plot,adp-method}},
\code{\link{read.adp.ad2cp}()},
\code{\link{read.adp.nortek}()},
\code{\link{read.adp.rdi}()},
\code{\link{read.adp.sontek}()},
\code{\link{read.adp}()},
\code{\link{read.aquadoppHR}()},
\code{\link{read.aquadoppProfiler}()},
\code{\link{read.aquadopp}()},
\code{\link{rotateAboutZ}()},
\code{\link{setFlags,adp-method}},
\code{\link{subset,adp-method}},
\code{\link{subtractBottomVelocity}()},
\code{\link{summary,adp-method}},
\code{\link{toEnuAdp}()},
\code{\link{toEnu}()},
\code{\link{velocityStatistics}()},
\code{\link{xyzToEnuAdpAD2CP}()},
\code{\link{xyzToEnuAdp}()},
\code{\link{xyzToEnu}()}
}
\author{
Dan Kelley and Clark Richards
}
\concept{things related to adp data}
