

#' Generate partial clique
#' Creates a graph with a partial clique according to the values passed. The output is the graph, the index so that the graph can be reordered to make the partial clique more apparent, and lastly, the size and number of edges in the partial clique.
#'
#' @param n The size of the matrix to be generated
#' @param clique_fraction the fraction of the nodes should be in the partial clique
#' @param clique_edge_density The density of the edges in the partial clique, excluding edges from a node to itself
#' @param non_clique_edge_density The density of edge not withing the clique, also excluding self-edges
#'
#' @returns A list containing the adjacency matrix, the index that reverse the permutation applied (making it easier to see the clique), the size of the partial clique and the number of edges it contains
#' @export
generate_partial_clique <- function(n,
                                    clique_fraction,
                                    clique_edge_density,
                                    non_clique_edge_density=0.1){
    stopifnot(n%%1 == 0, n > 0)
    stopifnot(clique_fraction <= 1,
              clique_fraction >= 0)
    stopifnot(clique_edge_density <= 1,
              clique_edge_density >= 0)

    clique_size <- ceiling(n * clique_fraction)

    adj_mat <- matrix(stats::rbinom(n*n, 1, non_clique_edge_density/2),
                      nrow=n)

    clique_edge_num <- ceiling(clique_edge_density*(clique_size*(clique_size-1)/2))
    clique_edges <- c(rep(1, clique_edge_num),
                      rep(0, clique_size*(clique_size-1)/2 - clique_edge_num))
    clique <- matrix(0,
                     nrow=clique_size,
                     ncol=clique_size)

    clique[upper.tri(clique)] <- sample(clique_edges)

    adj_mat[1:clique_size, 1:clique_size] <- clique

    adj_mat <- adj_mat + t(adj_mat)
    adj_mat[adj_mat > 1] <- 1
    diag(adj_mat) <- 1

    perturb_index <- sample(1:n)
    index_matrix <- cbind(perturb_index, 1:n)
    reorder_index <- index_matrix[order(index_matrix[ ,1]), 2]

    adj_mat <- adj_mat[perturb_index, perturb_index]

    return(list(adj_matrix = adj_mat,
                reorder_index = reorder_index,
                partial_clique_size = clique_size,
                num_of_clique_edges = clique_edge_num))
}


.reorder_adj_mat <- function(adj_mat, reorder_index){
    return(adj_mat[reorder_index, reorder_index])
}


