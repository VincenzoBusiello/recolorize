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

# Il metodo k-means può essere scomodo alcune volte perché non deterministico. 
# Seguirà un esempio in cui verranno fornite tre palette con gli stessi 10 colori. 
# Questi si presenteranno in posizioni diverse all'interno della palette. 
# I colori saranno così simili ma non uguali. 

k_list <- lapply(1:3, function(i) recolorize(corbetti, "k", n = 10, plotting = F))

layout(1:3)
par(mar = rep(1,4))
plotColorPalette(k_list[[1]]$centers, k_list[[1]]$sizes)
plotColorPalette(k_list[[2]]$centers, k_list[[2]]$sizes)
plotColorPalette(k_list[[3]]$centers, k_list[[3]]$sizes)


# Il metodo hist permette di dedicare dei bin di numero diverso per ogni canale di colore

                 
# Aumentando il numero di cluster aumenta anche la suddivisione dei colori

r_hist_2 <- recolorize(corbetti, method = "hist", color_space = "Lab", bins = 2)
                 
# L'argomento bins della funzione recolorize() permette di impostare bins diversi 
# per ogni canale trattandoli come vettori.

r_hist_322 <- recolorize(corbetti, method = "hist", bins = c(3,2,2))


# Si possono impostare colori diversi rispetto a quelli presenti nell'immagine
# imposeColors() è una funzione utile in questo caso. Ottenendo i colori da una prima immagine
# si possono poi mappare su altre immagini 

im1 <- system.file("extdata/ocellata.png", package = "recolorize")
im2 <- system.file("extdata/ephippigera.png", package = "recolorize")

fit1 <- recolorize(im1)

fit2 <- imposeColors(im2, fit1$centers, adjust_centers = FALSE)
