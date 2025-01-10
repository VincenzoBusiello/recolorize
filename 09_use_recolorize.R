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

### esportazione dei livelli di colore

    recolorize_to_png(catt_rc, filename = "catt_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_catt)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_catt[[i]], target = paste0("cattlayer_", i, ".png"))
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

### esportazione dei livelli di colore

    recolorize_to_png(cymb_rc, filename = "cymb_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_cymb)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_cymb[[i]], target = paste0("cymblayer_", i, ".png"))
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

### esportazione dei livelli di colore

    recolorize_to_png(milt_rc, filename = "milt_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_milt)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_milt[[i]], target = paste0("miltlayer_", i, ".png"))
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

### esportazione dei livelli di colore

    recolorize_to_png(rest_rc, filename = "rest_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_rest)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_rest[[i]], target = paste0("restlayer_", i, ".png"))
          }


#### Utilizzo il pacchetto recolorize per applicare le sue funzioni alle immagini satellitari. 
#### Le immagini sono state scaricate utilizzando il portale Copernicus Browser, 
#### selezionando un'area del Kagatende Ranger Post pari a 197,72 Km^2.
#### Più precisamente, sono state acquisite immagini del 02/01/2020, 18/09/2020, 15/02/2021 e 24/08/2021.
#### Il motivo per cui sono state scelte queste date è perché la copertura di nuvole era inferiroe al 30%
#### e i mesi sono stati selezionati in modo da poter apprezzare la copertura vegetale.


# carico le immagini del Serenggeti National Park
s1 <- system.file("extdata/seren_02012020.png", package = "recolorize")
s2 <- system.file("extdata/seren_18092020.png", package = "recolorize")
s3 <- system.file("extdata/seren_15022021.png", package = "recolorize")
s4 <- system.file("extdata/seren_24082021.png", package = "recolorize")

# Fase di refining e recluster mancante per similarità dei colori. 
# L'immagine verrebbe completamente di un unico colore.
# Vista la mancanza di pixel che non soddisfano i requisiti per il recluster 
# sono stati clusterizzati tutti i pixel presenti.

 # recolorize2() esegue le funzioni recolorize() e recluster() in modo consecutivo
s1_rc <- recolorize2(s1, cutoff = 10, plotting = FALSE) #02/01/2020
s2_rc <- recolorize2(s2, cutoff = 10, plotting = FALSE) #18/09/2020
s3_rc <- recolorize2(s3, cutoff = 10, plotting = FALSE) #15/02/2021
s4_rc <- recolorize2(s4, cutoff = 10, plotting = FALSE) #24/08/2021
    
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

##S3##
  layout(matrix(1:6, nrow = 2, byrow = TRUE))
  par(mar = c(0,0,2,0))

  lay_s3 <- splitByColor(s3_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer che vengono confrontati con gli speculari binari

  for (i in 1:length(lay_s3))
    {
        plotImageArray(lay_s3[[i]], main = i)
    }


          ### esportazione dei livelli di colore 


        recolorize_to_png(s3_rc, filename = "seren3_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_s3)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_s3[[i]], target = paste0("s3layer_", i, ".png"))
          }

##S4##
  layout(matrix(1:8, nrow = 2, byrow = TRUE))
  par(mar = c(0,0,2,0))

  lay_s4 <- splitByColor(s4_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer che vengono confrontati con gli speculari binari

  for (i in 1:length(lay_s4))
    {
        plotImageArray(lay_s4[[i]], main = i)
    }


          ### esportazione dei livelli di colore 


        recolorize_to_png(s4_rc, filename = "seren4_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_s4)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_s4[[i]], target = paste0("s4layer_", i, ".png"))
          }

