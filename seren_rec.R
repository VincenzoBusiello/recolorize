library(recolorize)

# carico le immagini del Serenggeti National Park
s1 <- system.file("extdata/seren_02012020.png", package = "recolorize")
s2 <- system.file("extdata/seren_18092020.png", package = "recolorize")
s3 <- system.file("extdata/seren_15022021.png", package = "recolorize")
s4 <- system.file("extdata/seren_24082021.png", package = "recolorize")

# fase iniziale di clustering
init_s1 <- recolorize(s1, method = "hist", bins = 2, color_space = "sRGB")
init_s2 <- recolorize(s2, method = "hist", bins = 2, color_space = "sRGB")
init_s1 <- recolorize(s3, method = "hist", bins = 2, color_space = "sRGB")
init_s1 <- recolorize(s4, method = "hist", bins = 2, color_space = "sRGB")

# Fase di refining e recluster mancante per similarità dei colori. 
# L'immagine verrebbe completamente di un unico colore.
# Vista la mancanza di pixel che non soddisfano i requisiti per il recluster 
# allora sono stati clusterizzati tutti i pixel presenti.

## splitByColor() di seren_24082021

s1_rc <- recolorize2(s1, cutoff = 10, plotting = FALSE) # esegue recolorize() e recluster() in modo consecutivo
s2_rc <- recolorize2(s2, cutoff = 10, plotting = FALSE)
s3_rc <- recolorize2(s3, cutoff = 10, plotting = FALSE)
s4_rc <- recolorize2(s4, cutoff = 10, plotting = FALSE)
    
# impostazione della schermata di visualizzazione



          ##S1##

  layout(matrix(1:8, nrow = 2, byrow = TRUE))
  par(mar = c(0,0,2,0))

  lay_s1 <- splitByColor(s1_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer che vengono confrontati con gli speculari binari

  for (i in 1:length(lay_s1))
    {
        plotImageArray(lay_s1[[i]], main = i)
    }

          ### esportazione dei livelli di colore 


        recolorize_to_png(s1_rc, filename = "seren1_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_s1)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_s1[[i]], target = paste0("s1layer_", i, ".png"))
          }



          ##S2##
  layout(matrix(1:6, nrow = 2, byrow = TRUE))
  par(mar = c(0,0,2,0))

  lay_s2 <- splitByColor(s2_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer che vengono confrontati con gli speculari binari

  for (i in 1:length(lay_s2))
    {
        plotImageArray(lay_s2[[i]], main = i)
    }


          ### esportazione dei livelli di colore 


        recolorize_to_png(s2_rc, filename = "seren2_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_s2)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_s2[[i]], target = paste0("s2layer_", i, ".png"))
          }



