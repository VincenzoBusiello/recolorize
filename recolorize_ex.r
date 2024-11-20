library(recolorize)


# get the path to the image (comes with the package, so we use system.file):
img <- system.file("extdata/corbetti.png", package = "recolorize")


# fit a color map (only provided parameter is a color similarity cutoff)
recolorize_obj <- recolorize2(img, cutoff = 45)


# initial clustering phase using 2^3 = 8 total bins
init_fit <- recolorize(img, method = "hist", bins = 2, color_space = "sRGB")

# refining phase
refined_fit <- recluster(init_fit, cutoff = 45)

# manual refining
final_fit <- editLayer(refined_fit, 3, operation = "fill", px_size = 4)

adj <- recolorize_adjacency(final_fit, coldist = "default", hsl = "default")
#> Using single set of coldists for all images.
#> Using single set of hsl values for all images.
print(adj[ , grep("m_dL|m_dS", colnames(adj))]) # just print the chromatic and achromatic boundary strength values
#>      m_dS     m_dL
#>  40.59881 40.27214
