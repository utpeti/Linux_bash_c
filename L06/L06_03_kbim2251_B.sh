#!/bin/bash
#Korpos Botond
#kbim2251
#522/2
#3.feladat:

#B) Asszociatív tömböt használva határozzuk meg, hogy egy paraméterként megadott állományban hány a, b, c, ... stb. betűvel kezdődő szó van.
# Ha pl. nincs c betűvel kezdődő szó, azt ne írjuk ki egyáltalán, különben a kimenet formátuma:
#     a: 12
#     d: 25
# Végezetül pedig határozzuk meg, hogy melyik betűvel kezdődik a legtöbb szó.

# ellenorizzuk, hogy 1 paramtetert kapott-e a script
if [ $# -ne 1 ]
then
	echo usage: $0 textfile
        exit 1
fi

# ellenorizzuk, hogy a megadott allomany szoveges-e
if [[ ! -f "$1" ]] || [[ ! $(file -b "$1") =~ "text" ]]
then
	echo $1 is not a text file
fi

# eloszor a letter tombbe szamoljuk melyik betuk szerepelnek az allomanyban es hanyszor
# majd a legvegen ezt kiirjuk es pipeoljuk egy sort-ba, hogy abc sorrendbe irja ki a betuk elofordulasat
awk '{
	for(i=1; i<=NF; i++) {
		letter[substr($i, $i, $i+1)]++
	}
} END {
	for(i in letter) {
		printf("%c: %d\n", i, letter[i])
	}
}' $* | sort

