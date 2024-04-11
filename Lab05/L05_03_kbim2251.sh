#!/bin/bash
#Korpos Botond
#kbim2251
#522

#parameterek ellenorzese:
#itt ellenoriztem azt is, hogy a szo, ami szerint szurunk csak betukbol alljon
if [ $# -lt 2 ] || [[ ! $1 =~ ^[a-zA-Z]*$ ]]
then
	echo usage: $0 word file
	exit 1
fi

#vegigmegyunk az osszes megadott file-on
for file in ${@:2}
do
	#ha letezik a file
	if [ -e $file ]
	then
		#ellenorizzuk, hogy szoveges file-e
		if [[ "`file -b $file`" =~ .*text.* ]]
		then
			#ha igen, akkor az elso harminc sorban elvegezzuk a megfeleo torlest
			sed -i "1,30 {/^$1$/d}" $file
			echo `basename $file` modositottuk
		else
			#ha nem szoveges, akkor kiirjuk ezt
			echo `basename $file` nem szoveges allomany
		fi
	else
		#ha nem letezik a file, azt is jelezzuk
		echo `basename $file` nem letezik az allomany
	fi
done

exit 0
