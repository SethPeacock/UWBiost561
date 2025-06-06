
.run_compute <- function(number, adj_mat, alpha){
    tryCatch({
        compute_maximal_partial_clique_master(
            adj_mat = adj_mat,
            alpha = alpha,
            number = number,
            time_limit=30)
    },
    error=function(cond){
        list(clique_idx = NA,
             edge_density = NA,
             status = "tryCatch error",
             valid = F)
    },
    warning=function(cond){
        list(clique_idx = NA,
             edge_density = NA,
             status = "tryCatch warning",
             valid = F)
    })
}


.run_level <- function(adj_mat, alpha){
    out <- data.frame(number = 1:15,
                      valid = rep(F, 15),
                      status = rep(" ", 15),
                      clique_size = rep(0, 15),
                      run_time = rep(30.0, 15))
    for(i in 1:15){
        time <- system.time(
            result <- .run_compute(adj_mat = adj_mat,
                                   alpha = alpha,
                                   number = i)
        )
        out[i, "valid"] <- result$valid
        out[i, "status"] <- result$status
        out[i, "clique_size"] <- length(result$clique_idx)
        out[i, "run_time"] <- time[1]

    }
    return(out)
}

#' This function runs the simulation.
#'
#' @param trials_per_level A natural number specifying how many times to run each level
#' @param n_nodes A vector of the number of nodes to create a graph with, e.g. c(10) or c(10, 20, 30)
#' @param clique_fraction A vector of the clique fraction
#' @param alpha A vector of alpha values
#' @param seed For setting the seed
#'
#' @returns A data frame with the simulation results
#' @export
execute_simulation <- function(trials_per_level,
                       n_nodes,
                       clique_fraction,
                       alpha,
                       seed = 452129){
    stopifnot(is.vector(n_nodes),
              is.vector(clique_fraction),
              is.vector(alpha))
    stopifnot(trials_per_level%%1 == 0, trials_per_level > 0)

    set.seed(seed)

    result_data <- data.frame(number=double(),
                      valid=logical(),
                      status=character(),
                      clique_size=integer(),
                      run_time=double(),
                      n_nodes=integer(),
                      clique_fraction=double(),
                      alpha=double())

    for(j in 1:trials_per_level){
        for(n in n_nodes){
            for(frac in clique_fraction){
                for(alpha_i in alpha){
                    adj_mat <- generate_partial_clique(n=n,
                                    clique_fraction = frac,
                              clique_edge_density = alpha_i)$adj_matrix

                    level_result <- .run_level(adj_mat=adj_mat,
                                               alpha=alpha_i)
                    level_result$n_nodes <- n
                    level_result$clique_fraction <- frac
                    level_result$alpha <- alpha_i
                    result_data <- rbind(result_data, level_result)
                }
            }
        }
    }
    return(result_data)
}

