#!/bin/bash
#Korpos Botond
#kbim2251

#bemeneti parameterek ellenorzese:
if [ $# -eq 0 ]
then
	echo usage: $0 dir
	exit 1
fi

if [ ! -d $1 ]
then
	echo $1 is not a directory\!
	exit 1
fi

#az osszes filet atnezzuk a megadott directoroyben
for file in `find $1 -type f`
do
    #ha text file:
    if [[ -f "$file" && $(file -b "$file") =~ "text" ]]
    then
	last_row=`tail -n 1 $file`
	
	#megkerdezzuk a felhasznalot, hogy kitorlodjon-e az utolso sor:
	echo $file allomany vegerol kitoruljuk ki az utolso sort\? \[y \/ n\]:
	read user_input

	if [ $user_input == "y" ]
	then 
		#kitorlodik az utolso sor
		head -n -1 $file > temp && mv temp $file
		echo $file allomany vegerol kitoroltuk az alabbi sort:
		echo $last_row
	elif [ $user_input == "n" ]
	then
		echo Nem toroltuk az utolso sort\!
	else
		echo usage: y - yes, n - no
		exit 1
	fi
    fi
done

exit 0
