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

#itt is vegignezunk minden file-t a parameterekbol (osszes parameter)
for file
do
        #ha letezik a file
        if [ -e $file ]
        then
                #ellenorizzuk, hogy html file-e
                if [[ "`file -b $file`" =~ .*html.* ]] || [[ "`file -b $file`" =~ .*HTML.* ]]
                then
			#kitorlunk mindent, ami < > kozott van, nem erdekel mi van elotte vagy utana
			#az sem, hogy koztuk mi van, igy hasznalhato a .*
                        sed -i "/<.*>/d" $file
                        echo `basename $file` modositottuk
                else
                        #ha nem html, akkor kiirjuk ezt
                        echo `basename $file` nem html allomany
                fi
        else
                #ha nem letezik a file, azt is jelezzuk
                echo `basename $file` nem letezik az allomany
        fi
done

exit 0
