library(recolorize)

# carico i percorsi delle immagine che voglio utilizzare
img_path <- system.file("extdata/corbetti.png", package = "recolorize")
im1_path <- system.file("extdata/ocellata.png", package = "recolorize")
im2_path <- system.file("extdata/ephippigera.png", package = "recolorize")

# interpreto le immagini come array
img <- readImage(img_path, resize = NULL, rotate = NULL)
im1 <- readImage(im1_path, resize = NULL, rotate = NULL)
im2 <- readImage(im2_path, resize = NULL, rotate = NULL)

# controllo le dimensioni degli array
dim(img)
dim(im1)
dim(im2)

# fit delle immagini
fit1 <- recolorize(img)
fit2 <- recolorize(im1)
fit3 <- recolorize(im2)

# organizzo la visualizzazione delle immagini
layout(matrix(1:3, nrow = 1))
par(mfrow=c(1,3))
plot(fit1)
plot(fit2)
plot(fit3)

