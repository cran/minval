% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checkBalance.R
\name{checkBalance}
\alias{checkBalance}
\title{Evaluate the mass or charge balance for a set of stoichiometric reactions}
\usage{
checkBalance(
  reactionList,
  referenceData,
  ids,
  mFormula = NULL,
  mWeight = NULL,
  mCharge = NULL,
  woCompartment = TRUE
)
}
\arguments{
\item{reactionList}{A set of stoichiometric reaction with the following characteristics: \itemize{
\item Arrows symbols must be given in the form \code{'=>'} or \code{'<=>'}
\item Inverse arrow symbols \code{'<='} or other types as: \code{'-->'}, \code{'<==>'}, \code{'->'} will not be parsed and will lead to errors.
\item Arrow symbols and plus signs (\code{+}) must be surrounded by a space character
\item Stoichiometric coefficients must be surrounded by a space character and not by parentheses.
\item Each metabolite must have only one stoichiometric coefficient, substituents must be joined to metabolite name by a hyphen (\code{-}) symbol.
\item Exchange reactions have only one metabolite before arrow symbol
\item Compartments must be given between square brackets ([compartment]) joined at the end of metabolite name
}
Some examples of valid stoichiometric reactions are: \itemize{
\item \code{H2O[c] + Urea-1-Carboxylate[c] <=> 2 CO2[c] + 2 NH3[c]}
\item \code{ADP[c] + Phosphoenolpyruvate[c] => ATP[c] + Pyruvate[c]}
\item \code{CO2[c] <=> }
}}

\item{referenceData}{A chemical table containing data to evaluate the balance}

\item{ids}{A mandatory ID of metabolite names column in the referenceData}

\item{mFormula}{An optional ID of molecular formula column in the referenceData}

\item{mWeight}{An optional ID of molecular weight column in the referenceData}

\item{mCharge}{An optional ID of net charge column in the referenceData}

\item{woCompartment}{A boolean value \code{'TRUE'} or \code{'FALSE'} to indicate if compartment label should be removed of stoichiometric reactions}
}
\value{
This function returns a boolean value \code{'TRUE'} if reaction is balanced.
}
\description{
For a given set of stoichiometric reactions, this function evaluates the mass or charge balance using a reference data. The \code{checkBalance} function returns a boolean value \code{'TRUE'} if the reaction is balanced. One of \code{'mFormula'}, \code{'mWeight'} or \code{'mCharge'} arguments must be given.
}
\examples{
# Loading a set of stoichiometric reactions
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Loading extrernal chemical information
chemicalData <- read.csv2(system.file("extdata", "chemData.csv", package = "minval"))
head(chemicalData)

# Evaluating mass balance
checkBalance(
reactionList = glycolysis$REACTION,
referenceData = chemicalData,
ids = "NAME",
mFormula = "FORMULA"
)
}
\author{
Daniel Camilo Osorio <dcosorioh@tamu.edu>
}
