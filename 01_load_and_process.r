library(recolorize)

# impostazione del percorso dell'immagine da processare con il pacchetto
img_path <- system.file("extdata/corbetti.png", package = "recolorize")

# carico l'immagine
img <- readImage(img_path, resize = NULL, rotate = NULL)

# l'immagine viene interpretata come un array di lunghezza 4
dim(img)

# impostazione della finestra di visualizzazione
layout(matrix(1:5, nrow = 1))

# l'argomento mar serve per poter impostare dei margini. 
# Vengono letti in senso orario partendo dal margine inferiore. 
# Quindi, inferiore, sinistro, superiore, destro. 
par(mar = c(0,0,2,0))

# viene utilizzata la funzione plotImageArray 
# permette di plottare un immagine 3D visualizzandola come una Array RGB
# nel primo argomento viene passato l'array RGB
# nel secondo (main) viene definito il titolo che verrà mostrato nel par
plotImageArray(img, main = "RGB image")
plotImageArray(img[ , , 1], main = "R channel")
plotImageArray(img[ , , 2], main = "G channel")
plotImageArray(img[ , , 3], main = "B channel")
plotImageArray(img[ , , 4], main = "Alpha channel")

# per ridurre al minimo le variazioni di colore viene utilizzata la funzione blurImage()
# viene utilizzato l'argomento "blur_anisotropic" per poter preservare i contorni dell'immagine
blurred_img <- blurImage(img, blur_function = "blur_anisotropic", 
                         amplitude = 10, sharpness = 0.2)
