# recolorize tra orchidee e telerilevamento
***
Il pacchetto recolorize, ideato da Hannah Weller, è uno strumento con il quale è possibile 
creare delle mappe di colore utilizzando immagini di partenza con una combinazione
di procedure manuali, semi-automatiche e automatiche.


L'obiettivo di tale file è mostrare come le funzioni contenute in questo pacchetto possano
essere utilizzate anche con "soggetti" differenti rispetto a quelli utilizzati negli esempi 
proposti da H. Weller, accentuando la versatilità del pacchetto. 
Per questo motivo sono stati scelti 4 esempi provenienti dalla famiglia delle Orchidacee 
e dai generi ***Cattleya***, ***Cymbidium***, ***Miltoniopsis*** e ***Restrepia***. 


<img src="https://github.com/VincenzoBusiello/recolorize/blob/main/cattleya.png?raw=true" width="100px">  <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/cymbidium.png?raw=true" width="100px">  <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/miltoniopsis.png?raw=true" width="100px">  <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/restrepia.png?raw=true" width="100px">


E' stato testato anche nell'ambito del Telerilevamento, applicando le sue funzioni alle immagini satellitari. 
In questo caso sono state utilizzate delle immagini acquisite attraverso Sentinel-2 e riguardanti
il ***Serengeti National Park*** (Tanzania), più precisamente un quadrante di 197,72 KM^2 vicino al 
Kagatende Ranger Park. 

<img src="https://github.com/VincenzoBusiello/recolorize/blob/main/seren_02012020.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/seren_18092020.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/seren_15022021.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/seren_24082021.png?raw=true" width="150px">


Sono state scelte delle immagini che potessero mostrare i livelli di copertura 
vegetale (presenza/assenza) in modo tale da avere delle differenze di colori che potessero 
essere significative e adatte all'obiettivo del lavoro. 
Per poterle processare, le immagini sono state caricate all'interno del folder del pacchetto per evitare 
anche ulteriori passaggi di cambio e carico delle directory oltre a possibile confusione. 
Le diverse immagini hanno subito poi un processo di ricolorazione 
in modo tale da semplificare le diverse sfumature presenti. 
Ottenuta la mappa di colore con la funzione recolorize2(), es:

```R
catt_rc <- recolorize2(catt, cutoff = 45, plotting = FALSE)
```

sono stati generati dei layer per ogni colore con la funzione splitByColor(). 

```R
lay_catt <- splitByColor(catt_rc, plot_method = "overlay")
```

E poi stampati in sequenza in modo tale da visualizzarli correttamente, impostando una precisa modalità di layout: 

```R
 layout(matrix(1:8, nrow = 2, byrow = TRUE))
  par(mar = c(0,0,2,0))

  lay_s1 <- splitByColor(s1_rc, plot_method = "overlay") # divisione della mappa di colore in singoli layer che vengono confrontati con gli speculari binari

  for (i in 1:length(lay_s1))
    {
        plotImageArray(lay_s1[[i]], main = i)
    }
```

Questi, in fine, sono stati esportati trasformandoli in file ".png" con la funzione **recolorize_to_png()**:

```R

        recolorize_to_png(s1_rc, filename = "seren1_recolored.png") # crea un file .png dell'immagine ricolorata

        for (i in 1:length(lay_s1)) # salva i singoli layer binari in formato .png
          {
              png::writePNG(lay_s1[[i]], target = paste0("s1layer_", i, ".png"))
          }

```

Con la stessa metodica sono state processate sia le immagini delle Orchidacee che le immagini satellitari provenienti dal Serengeti National Park. 
Qui di seguito verranno mostrate le immagini risultanti dall'applicazione del codice presente nel file "**09_use_recolorize.R**". 

<img src="https://github.com/VincenzoBusiello/recolorize/blob/main/seren1_recolored.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/s1layer_1.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/s1layer_2.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/s1layer_3.png?raw=true" width="150px"> <img src="https://github.com/VincenzoBusiello/recolorize/blob/main/s1layer_4.png?raw=true" width="150px">
