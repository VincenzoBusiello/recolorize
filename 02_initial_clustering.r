library(recolorize)

# inizialmente recolorize crea una mappa di colori con un numero di colori eccessivo
# perché rende più gestibile poi passare in futuro ad numero di colori selezionati manualmente
# oppure in modo automatico con una riclusterizzazione. 

# carico l'immagine presente nel pacchetto recolorize
corbetti <- system.file("extdata/corbetti.png", package = "recolorize")

# utilizzo la funzione recolorize sull'immagine caricata
# la funzione leggerà l'immagine come un array; 
# classifica i pixel dell'immagine in base agli 8 canali presenti RGB; 
# ricolora l'immagine e mostra a quale centro di colore è stato assegnato il pixel.
recolorize_defoults <- recolorize(img = corbetti)


# distribuzioni dei colori utilizzando i metodi hist e k-means

# HIST
recolorize_hist <- recolorize(img = corbetti, method = "hist", bins = 3, plotting = FALSE)

par(mar = rep(1,4))
plotColorClusters(recolorize_hist$centers, recolorize_hist$sizes, scaling = 30,
                  plus = 0.05,
                  xlab = "red", ylab = "green", zlab = "blue",
                  main = "Histogram method",
                  xlim = 0:1, ylim = 0:1, zlim = 0:1)

# K-MEANS
recolorize_k <- recolorize(img = corbetti, method = "k", n= 37, plotting = FALSE)

par(mar = rep(1,4))
plotColorClusters(recolorize_k$centers, recolorize_k$sizes, scaling = 30, 
                  plus = 0.05, 
                  xlab = "red", ylab = "green", zlab = "blue", 
                  main = "k-means clustering", 
                  xlim = 0:1, ylim = 0:1, zlim = 0:1)
