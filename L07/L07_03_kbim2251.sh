#!/bin/bash
#Korpos Botond
#kbim2251
#522/2

# 3. feladat
# Írjunk felügyelő programot, amely az első paraméterként másodpercben megadott időintervallumonként
# ( továbbiakban idő) kiírja a users nevű állományba a bejelentkezett felhasználók aktív folyamatainak
# a számát ([felhasználónév] [folyamatok száma] [időpont (óra:perc:másodperc)] formátumban). 6*idő
# intervallumonként írja ki a képernyőre, ABC sorrendben annak az első 10 felhasználónak a civil
# nevét és csoportját (pl. gr512), akinek:
# - az utolsó 6*idő intervallumban a legtöbb folyamata volt
# - a felügyelet megkezdése óta a legtöbb folyamata volt
# Minden kiírt felhasználó esetén írjuk ki a megfigyelés időpontját, illetve a folyamatok számát is.
# A kimenet két oszlopban jelenjen meg: a baloldali oszlopban az utóbbi 6*idő intervallum adatai,
# a jobboldaliban pedig a felügyelet megkezdése óta számított adatok:
# pld.
# ---utolso [6*idő] masodpercben---                     ---kezdetek ota---
# [fnév] [csop.] [foly. száma] [időpont]    [fnév] [csop.] [foly. száma] [időpont]
# ahol a helykitöltőket a megfelelő adatokkal helyettesítjük.

# ha nem 1 parametert adtunk meg, akkor kiirjuk a script hasznalatat
if [ $# -ne 1 ]
then
	echo usage: $0 time
	exit 1
fi

# ha a megadott parameter nem szam, akkor kiirjuk hogy az nem egy szam
if ! [[ $1 =~ ^-?[0-9]+$ ]]
then
	echo $1 is not a number
	exit 1
fi

# az ido nem lehet 0 vagy kisebb
if [ $1 -le 0 ]
then
	echo $1 is 0 or less, has to be bigger than 0
	exit 1
fi

currenttime=$(date +%H:%M:%S)
while true
do
		
done
