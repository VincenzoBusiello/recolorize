library(recolorize)

img <- system.file("extdata/corbetti.png", package = "recolorize")
rc <- recolorize2(img, cutoff = 45, plotting = FALSE)

layout(matrix(1:10, nrow = 2, byrow = TRUE))
par(mar = c(0, 0, 2, 0))

layers <- splitByColor(rc, plot_method = "overlay") # crea un livello per ogni colore

for(i in 1:length(layers))
  {
  plotImageArray(layers[[i]], main = i)
  }

# esportazione della mappa di colore
recolorize_to_png(rc, filename = "corbetti_recolored.png")

# esportazione dei layer singoli dalla funzione splitByColor
for (i in 1:length(layers)) 
  {
  png::writePNG(layers[[i]], target = paste0("layer_", i, ".png"))
  }


# pavo package
as_classify <- classify_recolorize(rc, imgname = "corbetti")
adj_analysis <- pavo::adjacent(as_classify, xscale = 10)

adj_human <- recolorize_adjacency(rc)
