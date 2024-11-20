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


# Using single set of coldists for all images.
# Using single set of hsl values for all images.
adj <- recolorize_adjacency(final_fit, coldist = "default", hsl = "default")


# just print the chromatic and achromatic boundary strength values
print(adj[ , grep("m_dL|m_dS", colnames(adj))]) 
#      m_dS     m_dL
#  40.59881 40.27214


# batch processing
# get all 5 beetle images:
images <- dir(system.file("extdata", package = "recolorize"), "png", full.names = TRUE)


# make an empty list to store the results:
rc_list <- vector("list", length = length(images))


# run `recolorize2` on each image
# you would probably want to add more sophisticated steps in here as well, but you get the idea

for (i in 1:length(images)) 
{
  rc_list[[i]] <- suppressMessages(recolorize2(images[i], bins = 2, cutoff = 30, plotting = FALSE))
}


# plot for comparison:
layout(matrix(1:10, nrow = 2))
par(mar = rep(0, 4))

for (i in rc_list) 
{
  plotImageArray(i$original_img)
  plotImageArray(recoloredImage(i))
}


# recolorize class

attributes(final_fit)
#> $names
#> [1] "original_img"      "pixel_assignments" "sizes"            
#> [4] "centers"           "call"              "recolored_img"    
#> 
#> $class
#> [1] "recolorize"


final_fit$call
#> [[1]]
#> recolorize(img = img, method = "hist", bins = 2, color_space = "sRGB")
#> 
#> [[2]]
#> recluster(recolorize_obj = init_fit, cutoff = 45)
#> 
#> [[3]]
#> editLayer(recolorize_obj = refined_fit, layer_idx = 3, operation = "fill", 
#>     px_size = 4)


# type = raster gets you a raster (like original_img); 
# type = array gets you an image array;

recolored_img <- recoloredImage(final_fit, type = "array")
par(mar = rep(0, 4))
plotImageArray(recolored_img)


colors <- c("navy", "lightblue", "blueviolet", "turquoise", "slateblue", "royalblue", "aquamarine", "dodgerblue")


blue_beetle <- constructImage(final_fit$pixel_assignments, centers = t(col2rgb(colors) / 255))


# a very blue beetle indeed:
par(mar = rep(0, 4))
plotImageArray(blue_beetle)
