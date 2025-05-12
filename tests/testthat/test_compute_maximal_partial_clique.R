context("Testing compute_maximal_partial_clique")

test_that("compute_maximal_partial_clique output are correct types", {
    adj_mat <- diag(1, 10, 10)
    res <- compute_maximal_partial_clique(adj_mat,
                                            alpha = 1)

    expect_true(is.list(res))
    expect_true(is.vector(res$clique_idx))
    expect_true(is.numeric(res$clique_idx))
})

test_that("compute_maximal_partial_clique handles edge case alpha", {
    adj_mat <- diag(1, 10, 10)
    adj_mat[1:2, 1:2] <- 1
    res <- compute_maximal_partial_clique(adj_mat,
                                          alpha = 1)
    res_2 <- compute_maximal_partial_clique(adj_mat,
                                            alpha = .5)

    expect_true(res$edge_density >= .5,
                res$edge_density <= 1)
    expect_true(res_2$edge_density >= .5,
                res_2$edge_density <= 1)
})

test_that("compute_maximal_partial_clique had correct clique size", {
    adj_mat_1 <- diag(1, 10, 10)
    res_1 <- compute_maximal_partial_clique(adj_mat_1,
                                          alpha = 1)

    adj_mat_2 <- matrix(1, 10, 10)
    res_2 <- compute_maximal_partial_clique(adj_mat_2,
                                          alpha = 1)

    set.seed(2830)
    part_cliq <- generate_partial_clique(n = 10,
                           clique_fraction = .4,
                        clique_edge_density = 1)

    res_3 <- compute_maximal_partial_clique(part_cliq[[1]],
                                           alpha = 1)
    cliq_idx_3 <- res_3$clique_idx

    expect_true(length(res_1$clique_idx) == 1)
    expect_true(length(res_2$clique_idx) == 10)
    expect_true(length(cliq_idx_3) == length(unique(cliq_idx_3)))
    expect_true(length(cliq_idx_3) >= 4)
})


test_that("compute_maximal_partial_clique clique size is nonincreasing with alpha increasing", {
    set.seed(321456)
    part_cliq <- generate_partial_clique(n = 50,
                           clique_fraction = .4,
                        clique_edge_density = .8)
    clique_size_previous <- 50
    for(alpha in c(.5, .6, .7, .8, .9, 1)){
        res <- compute_maximal_partial_clique(part_cliq[[1]],
                                          alpha = alpha)

        expect_true(length(res$clique_idx) <= clique_size_previous)
        clique_size_previous <- length(res$clique_idx)
    }
})

test_that("compute_maximal_partial_clique outputs same clique size and density for permuted matrix", {
    set.seed(8812)
    n <- 10
    part_cliq <- generate_partial_clique(n = n,
                            clique_fraction = .3,
                        clique_edge_density = .8)
    res <- compute_maximal_partial_clique(part_cliq[[1]],
                                         alpha = .8)

    reindex <- sample(1:n)
    part_cliq_perm <- part_cliq[[1]][reindex, reindex]
    res_alt <- compute_maximal_partial_clique(part_cliq_perm,
                                          alpha = .8)

    expect_true(length(res_alt$clique_idx) == length(res$clique_idx))
    expect_true(res_alt$edge_density == res$edge_density)
})

test_that("compute_maximal_partial_clique handles matrix errors", {
    expect_error(res <-  compute_maximal_partial_clique(matrix(2, 10, 10),
                                                alpha = 1)
    )
    expect_error(res <-  compute_maximal_partial_clique(matrix(1, 51, 51),
                                                        alpha = 1)
    )
})
