library(recolorize)

# carico le immagini delle orchidee
catt <- system.file("extdata/cattleya.png", package = "recolorize")
cymb <- system.file("extdata/cymbidium.png", package = "recolorize")
milt <- system.file("extdata/miltoniopsis.png", package = "recolorize")
rest <- system.file("extdata/restrepia.png", package = "recolorize")

# fase iniziale di clustering
init_catt <- recolorize(catt, method = "hist", bins = 2, color_space = "sRGB")
init_cymb <- recolorize(cymb, method = "hist", bins = 2, color_space = "sRGB")
init_milt <- recolorize(milt, method = "hist", bins = 2, color_space = "sRGB")
init_rest <- recolorize(rest, method = "hist", bins = 2, color_space = "sRGB")

# fase di refining
ref_catt <- recluster(init_catt, cutoff = 45)
ref_cymb <- recluster(init_cymb, cutoff = 45)
ref_milt <- recluster(init_milt, cutoff = 45)
ref_rest <- recluster(init_rest, cutoff = 45)

# refining manuale
final_catt <- editLayer(ref_catt, 3, operation = "fill", px_size = 4)
final_cymb <- editLayer(ref_cymb, 2, operation = "fill", px_size = 4) #parametro impostato a 2 per mancanza di layer
final_milt <- editLayer(ref_milt, 3, operation = "fill", px_size = 4)
final_rest <- editLayer(ref_rest, 2, operation = "fill", px_size = 4) #parametro impostato a 2 per mancanza di layer


