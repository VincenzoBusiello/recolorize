# recolorize tra orchidee e telerilevamento
Il pacchetto recolorize, ideato dal Hannah Weller, è uno strumento con il quale è possibile 
creare delle mappe di colore utilizzando immagini di partenza utilizzando una combinazione
di procedure manuali, semi-automatiche e automatiche.
L'obiettivo di tale file è mostrare come le funzioni contenute in questo pacchetto possano
essere utilizzate anche con "soggetti" differenti rispetto a quelli utilizzati negli esempi 
proposti da H. Weller dimostrando la loro versatilità. 
Per questo motivo sono stati scelti 4 esempi provenienti dalla famiglia delle Orchidacee 
e dai generi *Cattleya*, *Cymbidium*, *Miltoniopsis* e *Restrepia*. 

E' stato testato anche nell'ambito del Telerilevamento applicando le sue funzioni alle immagini satellitari. 
In questo caso sono state utilizzate delle immagini acquisite attraverso Sentinel-2 e riguardanti
il Serengeti National Park, più precisamente un quadrante di 197,72 KM^2 vicino al 
Kagatende Ranger Park. Sono state scelte delle immagini che potessero mostrare i livelli di copertura 
vegetale (assente/presente) in modo tale da avere delle differenze di colori che potessero 
essere significative e adatte all'obiettivo del lavoro. 
Per poterle processare le immagini sono state caricate all'interno del folder del pacchetto per evitare 
anche ulteriori passaggi di cambio della directory ed eventuale confusione. 
Fatto ciò, le diverse immagini hanno subito un processo di ricolorazione 
in modo tale da semplificare le diverse sfumature presenti. Ottenuta la mappa di colore utilizzando la
funzione recolorize2(), sono stati generati dei layer per ogni colore con la funzione splitByColor(). 
Questi, in fine, sono stati esportati trasformandoli in file ".png". Con la stessa metodica sono state 
processate sia le immagini delle Orchidacee che le immagini satellitari provenienti dal Serengeti National Park. 
