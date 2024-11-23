library(recolorize)

corbetti <- system.file("extdata/corbetti.png", package = "recolorize")
init_fit <- recolorize(corbetti, plotting = FALSE)

recluster_results <- recluster(init_fit, cutoff = 45)
recluster_rgb <- recluster(init_fit, color_space = "sRGB", cutoff = 0.5)

img <- system.file("extdata/chongi.png", package = "recolorize")

chongi_fit <- recolorize2(img, bins = 3, cutoff = 45)
