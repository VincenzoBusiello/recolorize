library(recolorize)

corbetti <- system.file("extdata/corbetti.png", package = "recolorize")
init_fit <- recolorize(corbetti, plotting = FALSE)

# recluster() calcola le distanze euclidee tra i centri di colore di una immagine recolorizzata
# raggruppandoli in modo gerarchico 
# cutoff indica la distanza limite per la quale si richiede di raggruppare i cluster di colori
# In questo caso lo spazio di colore è il CIE Lab
recluster_results <- recluster(init_fit, cutoff = 45)

# Se si utilizza lo spazio di colori RGB allora cutoff ha un valore compreso tra 0 e 1
recluster_rgb <- recluster(init_fit, color_space = "sRGB", cutoff = 0.5)

# recolorize2() utilizza recolorize() e recluster() in sequenza in un unico passaggio


img <- system.file("extdata/chongi.png", package = "recolorize") #assegnazione dell'immagine

chongi_fit <- recolorize2(img, bins = 3, cutoff = 45)

# per eliminare i cluster di colori più piccoli che possono donare dettagli superflui
chongi_threshold <- thresholdRecolor(chongi_fit, pct = 0.1)
