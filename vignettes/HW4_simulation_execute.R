library(UWBiost561)

simulation_result <- execute_simulation(trials_per_level=5,
                                n_nodes=c(10,20),
                                clique_fraction=c(0.5,0.7),
                                alpha=c(0.6,0.9))

save(simulation_result,
     file="simulation_results.RData")
