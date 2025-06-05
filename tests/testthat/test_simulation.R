context("Testing simulation")

test_that("simulation handles imput errors", {
    matrix_ <- matrix(0, nrow=1,ncol=1)
    expect_error(simulation(trials_per_level=1,
                            n_nodes=matrix_,
                            clique_fraction=c(1),
                            alpha=c(1)))
    expect_error(simulation(trials_per_level=1,
                            n_nodes=matrix_,
                            clique_fraction=1,
                            alpha=c(1)))
    expect_error(simulation(trials_per_level=1,
                            n_nodes=c(10),
                            clique_fraction=c(1),
                            alpha=matrix_))
    expect_error(simulation(trials_per_level=1.2,
                            n_nodes=c(10),
                            clique_fraction=c(1),
                            alpha=c(1)))
}
)

test_that("simulation outputs a data frame", {
    expect_true(class(simulation(trials_per_level=1,
                           n_nodes=c(10),
                           clique_fraction=c(1),
                           alpha=c(1))) == "data.frame")
}
)
