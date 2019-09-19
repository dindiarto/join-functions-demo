tr8 <- cluster::plantTraits %>%
  tibble::rownames_to_column("Species") %>% 
  as_tibble() %>% slice(1:5) %>%
  dplyr::select(Species,pdias,longindex ,durflow ,height)

set.seed(500)
tr8_NA <-as.data.frame(lapply(tr8, 
                              function(cc) cc[ sample(c(TRUE, NA),
                                                      prob = c(0.85, 0.3), 
                                                      size = length(cc), 
                                                      replace = TRUE) ]))
traitNA <- bind_cols(tr8[1], tr8_NA[-1])

rm(tr8, tr8_NA)
