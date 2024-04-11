#!/bin/bash
#Korpos Botond
#kbim2251
#522

#parameterek ellenorzese:
if [ $# -eq 0 ]
then
	echo usage: $0 file
	exit 1
fi

for file
do
        #ha letezik a file
        if [ -e $file ]
        then
                #ellenorizzuk, hogy szoveges file-e
                if [[ "`file -b $file`" =~ .*text.* ]]
                then
                        #ha igen, akkor a kis maganhangzot nagyra, a nagyot kicsire csereljuk
                        sed -i "y/aeiouAEIOU/AEIOUaeiou/" $file
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
