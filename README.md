
# recolorize between orchids and remote sensing
***

recolorize package, created by Hannah Weller, is a tool for creating color maps using images with 
a combination of manual, semi-automatic and automatic procedures.

The aim of this file is to show how the functions of this package can also be used with 
different subjects than those already used in the H. Weller examples, emphasing the versatility
of this package.
For this reason, I chose 4 examples from Orchidacee family and from the genera
***Cattleya***, ***Cymbidium***, ***Miltoniopsis*** e ***Restrepia***.


<img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/cattleya.png?raw=true" width="100px">  <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/cymbidium.png?raw=true" width="100px">  <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/miltoniopsis.png?raw=true" width="100px">  <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/restrepia.png?raw=true" width="100px">


In addition, I tested the package for remote sensing, using its functions on satellite images. 
In this case, the images were acquired by Sentinel-2 and they represent an area of 1972.72 KM^2
near by Kagatende Ranger Park, in ***Serengeti National Park*** (Tanzania). 

<img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/seren_02012020.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/seren_18092020.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/seren_15022021.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/seren_24082021.png?raw=true" width="150px">

Images were selected to display levels of vegetation cover (presence/absence) in a way that highlighted significant colour differences
that can be suitable for the objective of the work.
The images were placed in the package folder to avoid further steps and confusion.
Than they were recolored simplifying the different color shades. 
The color map was obtained using **recolorize2()** function, ex:

```R
# uploading image of Cattleya 
catt <- system.file("extdata/cattleya.png", package = "recolorize")
```


```R
catt_rc <- recolorize2(catt, cutoff = 45, plotting = FALSE)
```

**splitByColor()** function generate layers for each color:

```R
lay_catt <- splitByColor(catt_rc, plot_method = "overlay")
```

Setting of layout mode for a correct printing:

```R
 layout(matrix(1:8, nrow = 2, byrow = TRUE))
  par(mar = c(0,0,2,0))

  lay_s1 <- splitByColor(s1_rc, plot_method = "overlay") # splitting the color map into individual layers campared with binary specular ones

  for (i in 1:length(lay_s1))
    {
        plotImageArray(lay_s1[[i]], main = i)
    }
```
**recolorize_to_png()** exports the obtained images in ".png":

```R

        recolorize_to_png(s1_rc, filename = "seren1_recolored.png") # creating file .png of recolored image

        for (i in 1:length(lay_s1)) # saving single binary layers as .png files
          {
              png::writePNG(lay_s1[[i]], target = paste0("s1layer_", i, ".png"))
          }

```

Satellite images from Serengeti National Park were processed in the same way and I obtained the images below:

<img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/seren1_recolored.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/s1layer_1.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/s1layer_2.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/s1layer_3.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/images/serengeti/s1layer_4.png?raw=true" width="150px">
