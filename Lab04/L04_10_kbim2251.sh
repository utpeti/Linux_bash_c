#!/bin/bash
#Korpos Botond
#kbim2251
#522

#ellenorizzuk a parameterek szamat
if [ $# -eq 0 ]
then
	echo usage: $0 username
	exit 1
fi

#vegigmegyunk az osszes parameteren (elmeletileg mind user-ek, de ha nem, akkor
#azt is lekezeljuk)
for user
do
	#a user parancs kimenetele nem erdekel, csak a visszateritett ertek
	id $user >/dev/null 2>/dev/null
	if [ $? -eq 0 ]
	then
		#ha van ilyen user, akkor megnezzuk listazhato-e a bejelenkezesi
		#directory tartalma mindenki szamara
		dir=`grep $user /etc/pseudopasswd | cut -d: -f6`
		firstr=`ls -ld ${dir} | cut -c2`
		secondr=`ls -ld ${dir} | cut -c5`
		thirdr=`ls -ld ${dir} | cut -c8`
		#itt csak akkor listazhato, ha mindenkinek listazhato
		if [ $firstr = r ] && [ $secondr = r ] && [ $thirdr = r ]
		then
			echo $user \- listazhato
		else
			#kulonben nem :)
			echo $user \- nem listazhato
		fi
	else
		#ha nincs ilyen user
		echo $user \- nem letezik
	fi
done

exit 0
