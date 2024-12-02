library(recolorize)
img <- system.file("extdata/fulgidissima.png", package = "recolorize")
ful_init <- recolorize2(img, bins=3, cutoff = 60, plotting = TRUE)


# funzione per trovare le macchie di colore 
ful_absorb <- absorbLayer(ful_init, layer_idx = 3, function(s) s <= 250, y_range = c(0, 0.8), highlight_color = "cyan")
# pulisce alcune macchie prodotte dall'output precedente
ful_clean <- editLayers(ful_init, layer_idx = c(2, 5), operations = "fill", px_sizes = 3, plotting = T)

corbetti <- system.file("extdata/corbetti.png", package = "recolorize")
rc <- recolorize(corbetti, plotting = F)
# permette di unire i cluster di colore che si somigliano di più 
merge_fit <- mergeLayers(rc, 
                         merge_list = list(1,2,
                                          c(3,5),
                                          c(4,7),
                                          c(6,8)))
  
# confronto delle due versioni della stessa immagine calcolando la distanza tra 
