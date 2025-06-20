% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_partial_clique.R
\name{generate_partial_clique}
\alias{generate_partial_clique}
\title{Generate partial clique
Creates a graph with a partial clique according to the values passed. The output is the graph, the index so that the graph can be reordered to make the partial clique more apparent, and lastly, the size and number of edges in the partial clique.}
\usage{
generate_partial_clique(
  n,
  clique_fraction,
  clique_edge_density,
  non_clique_edge_density = 0.1
)
}
\arguments{
\item{n}{The size of the matrix to be generated}

\item{clique_fraction}{the fraction of the nodes should be in the partial clique}

\item{clique_edge_density}{The density of the edges in the partial clique, excluding edges from a node to itself}

\item{non_clique_edge_density}{The density of edge not withing the clique, also excluding self-edges}
}
\value{
A list containing the adjacency matrix, the index that reverse the permutation applied (making it easier to see the clique), the size of the partial clique and the number of edges it contains
}
\description{
Generate partial clique
Creates a graph with a partial clique according to the values passed. The output is the graph, the index so that the graph can be reordered to make the partial clique more apparent, and lastly, the size and number of edges in the partial clique.
}
\examples{
library(UWBiost561)
generate_partial_clique(n=10,
                        clique_fraction=0.5,
                        clique_edge_density=0.9)

}
