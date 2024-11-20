library(recolorize)

# get the path to the image (comes with the package, so we use system.file):
img <- system.file("extdata/corbetti.png", package = "recolorize")

# fit a color map (only provided parameter is a color similarity cutoff)
recolorize_obj <- recolorize2(img, cutoff = 45)

init_fit <- recolorize(img, method = "hist", bins = 2, color_space = "sRGB")
#> 
#> Using 2^3 = 8 total bins

refined_fit <- recluster(init_fit, cutoff = 45)
