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



## splitByColor() di cattleya

    catt_rc <- recolorize2(catt, cutoff = 45, plotting = FALSE) # esegue recolorize() e recluster() in modo consecutivo

# impostazione della schermata di visualizzazione
    layout(matrix(1:6, nrow = 2, byrow = TRUE))
    par(mar = c(0,0,2,0))

    lay_catt <- splitByColor(catt_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer 

    for (i in 1:length(lay_catt))
      {
          plotImageArray(lay_catt[[i]], main = i)
      }



## splitByColor() di cymbidium

    cymb_rc <- recolorize2(cymb, cutoff = 45, plotting = FALSE) # esegue recolorize() e recluster() in modo consecutivo

# impostazione della schermata di visualizzazione
    layout(matrix(1:4, nrow = 2, byrow = TRUE))
    par(mar = c(0,0,2,0))

    lay_cymb <- splitByColor(cymb_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer

    for (i in 1:length(lay_cymb))
      {
          plotImageArray(lay_cymb[[i]], main = i)
      }



## splitByColor() di miltoniopsis

    milt_rc <- recolorize2(milt, cutoff = 45, plotting = FALSE) # esegue recolorize() e recluster() in modo consecutivo

# impostazione della schermata di visualizzazione
    layout(matrix(1:6, nrow = 2, byrow = TRUE))
    par(mar = c(0,0,2,0))

    lay_milt <- splitByColor(milt_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer

    for (i in 1:length(lay_milt))
      {
          plotImageArray(lay_milt[[i]], main = i)
      }



## splitByColor() di restrepia

    rest_rc <- recolorize2(rest, cutoff = 45, plotting = FALSE) # esegue recolorize() e recluster() in modo consecutivo

# impostazione della schermata di visualizzazione
    layout(matrix(1:4, nrow = 2, byrow = TRUE))
    par(mar = c(0,0,2,0))

    lay_rest <- splitByColor(rest_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer

    for (i in 1:length(lay_rest))
      {
          plotImageArray(lay_rest[[i]], main = i)
      }
