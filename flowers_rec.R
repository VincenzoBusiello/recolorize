library(recolorize)

      #### carico l'immagine con cui si vuole lavorare. 
      #### In questo caso si tratta di un fiore del genere Cattleya

catt <- system.file("extdata/cattleya.png", package = "recolorize")

# eseguo una prima ricolorizzazione 
catt_rec <- recolorize2(catt, cutoff = 45, plotting = FALSE)

# imposto la stampa a schermo delle immagini che mi interessano
layout(matrix(1:10, nrow = 2, byrow = TRUE))
par(mar = c(0,0,2,0))

#creo una lista di livelli che rappresentano l'immagine per ogni gruppo di colori
layers <- splitByColor(catt_rec, plot_method = "overlay")

# ciclo che mi permette di stampare i layer in maniera consecutiva
for (i in 1:length(layers))
  {
      plotImageArray(layers[[i]], main = i)
  }




        #### stesso lavoro per il fiore del genera Restrepia

rest <- system.file("extdata/restrepia.png", package = "recolorize")

# eseguo una prima ricolorizzazione 
rest_rec <- recolorize2(rest, cutoff = 45, plotting = FALSE)

# imposto la stampa a schermo delle immagini che mi interessano
layout(matrix(1:4, nrow = 2, byrow = TRUE))
par(mar = c(0,0,2,0))

#creo una lista di livelli che rappresentano l'immagine per ogni gruppo di colori
layers1 <- splitByColor(rest_rec, plot_method = "overlay")

# ciclo che mi permette di stampare i layer in maniera consecutiva
for (i in 1:length(layers1))
  {
      plotImageArray(layers1[[i]], main = i)
  }
