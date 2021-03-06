% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/guess_taxo_level.R
\name{guess_taxo_level}
\alias{guess_taxo_level}
\title{Guess the taxonomic level of Scientific Name}
\usage{
guess_taxo_level(name)
}
\arguments{
\item{name}{scientific name string to be checked}
}
\description{
Guesses the taxonomic level i.e. Genus, Species or Subspecies based on
number of words
}
\examples{
guess_taxo_level("Akodon longipilis")
guess_taxo_level("Akodon")
guess_taxo_level("Abrocoma cinerea shistacea")

}
\seealso{
Other Name functions: 
\code{\link{cast_canonical}()},
\code{\link{check_scientific}()},
\code{\link{expand_name}()},
\code{\link{list_higher_taxo}()},
\code{\link{melt_canonical}()}
}
\concept{Name functions}
