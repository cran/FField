\name{FField-package}
\docType{package}
\alias{FField}
\alias{FField-package}
\title{Force field simulation for a set of points}
\description{
Force field simulation of interaction of set of points.
Very useful for placing text labels on graphs, such as scatterplots.
}
\details{
FFieldPtRep(): 
Performs force field simulation of mutual repulsion by set of points.

FFieldPtRepDemo(): 
Demonstrates the utility of FFieldPtRep for placing labels in a scatterplot.
}
\author{Grigori Kapoustin}
\examples{
# Repel points
coords <-
  FFieldPtRep(coords = cbind(mtcars$wt * 100 / max(mtcars$wt), 
                             mtcars$mpg * 100 / max(mtcars$mpg)),
              rep.fact = 40)
head(mtcars)
head(coords)
  
# Demo
FFieldPtRepDemo()
}
\keyword{package}
\seealso{
\code{\link{FFieldPtRep}}
\link{FFieldPtRepDemo}
}