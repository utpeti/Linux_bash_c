#!/bin/bash
#Korpos Botond
#kbim2251
#522/2
#3. feladat:
# A) A paraméterként megadott állományokból írassuk ki azokat a sorokat, amelyekben ugyanaz a szó legalább kétszer fordul elő egymás után. Minden file feldolgozása előtt írassuk ki az állomány nevét, a kiírt sorok esetében pedig írjuk ki
# a sorok sorszámát feldolgozás elejétől/állomány elejétől számított sorszám formátumban
# a megtalált szót, ami legalább kétszer szerepel, és hogy melyik pozíciókban találtuk meg
# Példa kiíratásra:
#        12/5: maga maga mindent kétszer kétszer kétszer mond
#          - maga: 1, 2
#	   - kétszer: 4, 5, 6

# megnezzuk, hogy a parameterkent adott allomanyok szovegesek-e es csak azokra vegezzuk el a feladatot
nroftextfile=0
for file
do
	if [[ -f "$file" && $(file -b "$file") =~ "text" ]]
	then
		((nroftextfile++))	
	fi
done

#szamoljuk, hogy hany szoveges file-t talaltunk. Ha 0-t, akkor kiirjuk hogyan kellene helyesen hasznalni a scriptet
if [ $nroftextfile -eq 0 ]
then
	echo usage: $0 textfile
	exit 1
fi

awk '{
    for(i=1; i<=NF; i++) {
        
}' $*
