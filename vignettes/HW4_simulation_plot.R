library(tidyverse)

load(simulation_results.RData)

simulation_result$number <- as.factor(simulation_result$number)
simulation_result$n_nodes <- as.factor(simulation_result$n_nodes)
simulation_result$graph <- rep(1:40, each=15)
simulation_result <- simulation_result %>%
    group_by(graph) %>%
    mutate(max = clique_size == max(clique_size),
           frac = paste("clique fraction",clique_fraction),
           alpha_ = paste("density ", alpha))

png(filename="HW4_simulation1.png")
simulation_result %>%
    filter(valid, max) %>%
    ggplot(aes(x=number, y=run_time, color=n_nodes)) +
    geom_point() +
    facet_grid(rows=vars(alpha_), cols=vars(frac)) +
    scale_color_manual(values=c("darkred", "steelblue")) +
    theme_classic() +
    labs(title = "Simulation results 1",
         x = "Implementation",
         y = "Run time (sec)",
         color = "Number of Nodes")
dev.off()

png(filename="HW4_simulation2.png")
simulation_result %>%
    mutate(frac = paste("clique fraction",clique_fraction),
           alpha_ = paste("density ", alpha)) %>%
    filter(valid, max) %>%
    ggplot(aes(x=number, fill=n_nodes)) +
    geom_bar(position="dodge2") +
    facet_grid(rows=vars(alpha_), cols=vars(frac)) +
    scale_fill_manual(values=c("darkred", "steelblue")) +
    theme_classic() +
    labs(title = "Simulation results 2",
         x = "Implementation",
         y = "Matched maximum clique",
         color = "Number of Nodes")
dev.off()
