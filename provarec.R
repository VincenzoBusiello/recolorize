library(terra) # Per la funzione rast()
library(imageRy) # Per im.plotRGB() e im.classify()
library(viridis) # Per utilizzare colorRampPalette adatte a chi soffre di deuteranomalia (daltonismo)
library(ggplot2) # Per la creazione dei boxplot
library(patchwork) # Per visualizzare i boxplot insieme
library(recolorize) # Per ricolorare le immagini


# Imposto la cartella di lavoro.
setwd("C:/Telerilevamento2024/Lac17-24")

# Assegno l'immagine alla variabile marzo1
marzo1 <- im.import("1marzo.png")

