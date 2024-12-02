library(recolorize)

img <- system.file("extdata/ephippigera.png", package = "recolorize")
rc <- recolorize2(img, plotting = FALSE)

# imDist()
# confronto delle versioni della stessa immagine
# calcola la distanza dei pixel dell'immagine originale e la mappa di colore
layout(matrix(1:2, nrow = 1))
par(mar = c(0, 0, 2, 1))

dist_original <- imDist(readImage(img), recoloredImage(rc), color_space = "sRGB", main = "Unscaled distances")

imHeatmap(dist_originale, range = c(0, sqrt(3)), main = "Scaled distances")


# splitByColor()
# Divide la mappa di colore in singoli livelli. 
# Utile quando si vuole focalizzare su singoli porzioni/livelli

img <- system.file("extdata/corbetti.png", package = "recolorize")
rc <- recolorize2(img, cutoff = 45, plotting = FALSE)

layout(matrix(1:10, nrow = 2, byrow = TRUE))
par(mar = c(0, 0, 2, 0))

layers <- splitByColor(rc, plot_method = "overlay") # crea un livello per ogni colore

for(i in 1:length(layers))
  {
  plotImageArray(layers[[i]], main = i)
  }

