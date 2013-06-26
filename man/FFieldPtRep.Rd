\name{FFieldPtRep}
\alias{FFieldPtRep}
\title{Force field simulation for a set of points}
\description{
Force field simulation 
of interaction of set of points.
}
\usage{
FFieldPtRep(coords, 
  rep.fact = 20, 
  rep.dist.lmt = 10, 
  attr.fact = 0.2, 
  adj.max = 0.1, 
  adj.lmt = 0.5,
  iter.max = 10000)
}
\arguments{
  \item{coords}{ matrix or data.frame consisting of two columns 
    (x and y coordinates). }
  \item{rep.fact}{ repulsion force factor. }
  \item{rep.dist.lmt}{ repulsion distance limit. }
  \item{attr.fact}{ attraction force factor. }
  \item{adj.max}{ maximum position adjustment at each iteration. }  
  \item{adj.lmt}{ position adjustment limit at which the simulation stops. }
  \item{iter.max}{ the maximum number of iterations beyond which simulation
    will end and a warning will be reported. }
}
\details{
Points experience repulsion from one another and attraction to
their original positions.
Repulsion is inversely proportional to the
square of the distance.
Attraction is directly proportional to the distance.
Very useful for placing text labels on graphs, such as scatterplots.
Depending on the nature of the plot, parameters may need to be masaged
for the simulation to converge.
Assumes 1x1 coordinate aspect ratio and re-scaling of inputs
may be needed.
Default arguments are appropriate for adjusting 20-30 labels on a 100x100 area.
}
\examples{
  library(ggplot2)
  
  # Normalize coordinates to maintain constant aspect ratio
  x.fact <- 100 / max(mtcars$wt)
  y.fact <- 100 / max(mtcars$mpg)
  
  # Repel points
  coords <-
    FFieldPtRep(coords = cbind(mtcars$wt * x.fact, 
                               mtcars$mpg * y.fact),
                rep.fact = 40)
  
  # Convert back to plot coordinates
  x.t <- coords$x / x.fact
  y.t <- coords$y / y.fact
  
  # Sample plot with repelled labels
  p2 <- 
    (ggplot(mtcars, aes(x = wt, 
                        y = mpg, 
                        label = rownames(mtcars)))  
     + geom_point()
     + geom_text(x = x.t,
                 y = y.t)
     + geom_segment(data = mtcars,
                    xend = x.t,
                    yend = y.t)
     + ggtitle("After"))
  p2
}
\seealso{
\link{FField-package}
\code{\link{FFieldPtRepDemo}}
}