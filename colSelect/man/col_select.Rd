\name{col_select}
\alias{col_select}
\title{Display and Select Column Names from a Data Frame}
\description{
\code{col_select} displays all column names of a given data frame with their indices,
and allows interactive selection of specific columns using R's indexing syntax.
The selected column names are returned in dput format for precise reproduction.
}
\usage{
col_select(data)
}
\arguments{
  \item{data}{A data frame from which to select columns}
}
\value{
Invisibly returns the selected column names as a character vector
}
\examples{
##  Interactive example with iris dataset
# col_select(iris)
## Or
# selected_colname <- col_select(iris)

## In the interactive session, you might see:
## Available columns in the data:
##   Index ColumnName
## 1     1 Sepal.Length
## 2     2 Sepal.Width
## 3     3 Petal.Length
## 4     4 Petal.Width
## 5     5 Species
##
## Enter column indices to select (e.g., 1:3, 5, 7:9):
## Indices: 1:3,5
}
\seealso{
\code{\link[base]{colnames}}, \code{\link[base]{dput}}
}
\keyword{utilities}
\keyword{interactive}