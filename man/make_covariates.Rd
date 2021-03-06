% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_covariates.R
\name{make_covariates}
\alias{make_covariates}
\title{Format habitat covariate matrix}
\usage{
make_covariates(
  formula,
  covariate_data,
  Year_i,
  spatial_list,
  extrapolation_list
)
}
\arguments{
\item{formula}{an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted. Similar specification to \code{\link{stats::lm}}}

\item{covariate_data}{data frame of covariate values with columns \code{Lat}, \code{Lon}, and \code{Year}, and other columns matching names in \code{formula}; \code{Year=NA} can be used for covariates that do not change among years (e.g., depth)}
}
\value{
Tagged list of useful output
\describe{
  \item{Cov_gtp}{3-dimensional array for use in \code{VAST::make_data}}
  \item{Cov_itp}{3-dimensional array for use in \code{VAST::make_data}}
}
}
\description{
\code{make_covariates} uses a formula interface to generate covariates
}
\details{
This function generates 3D arrays \code{Cov_gtp} and \code{Cov_itp} required by \code{VAST::make_data} to incorporate density covariates.
The user must supply a data frame \code{covariate_data} of covariate values, with columns named Lat, Lon, and Year,
as well as values for all covariates as additional named columns.
This data frame is then used as a "look-up table", and is matched against variables listed in \code{formula}.

Specifically, for every observation \code{i} at location \code{Lat_i[i]} and \code{Lon_i[i]} in year \code{t_i[t]}, the nearest
Lat-Lon observation in that year is identified in \code{covariate_data}, and covariate
values in that row of \code{covariate_data} are assigned to observation \code{i}.
Similarly, for every extrapolation-grid cell \code{g} at location \code{spatial_list$latlon_g[i,]} in each year,
the nearest row of \code{covariate_data} in that year
is used to assign covariate values. \code{make_covariates} then formats these covariate values appropriately and returns them.
}
