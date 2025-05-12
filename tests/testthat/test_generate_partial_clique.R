context("Testing generate_partial_clique")

test_that("generate_partial_clique outputs are formated correctly", {
    set.seed(10)
    res <- generate_partial_clique(n = 10,
                                   clique_fraction = .4,
                                   clique_edge_density = .8)

    expect_true(is.list(res))
    expect_true(is.matrix(res$adj_mat))
    expect_true(all(dim(res$adj_mat) == c(10,10)))
})

test_that("generate_partial_clique clique has required density", {
    set.seed(523152)
    for(clique_edge_density in c(.2, .4, .6, .8, 1)){
        res <- generate_partial_clique(n = 30,
                                       clique_fraction = .4,
                                       clique_edge_density = clique_edge_density)
        m <- res$partial_clique_size
        clique <- res$adj_mat[res$reorder_index, res$reorder_index]
        clique <- clique[1:m, 1:m]

        density <- (sum(clique) - m)/2 / (m*(m-1)/2)
        expect_true(density >= clique_edge_density)
    }
})
