#!/bin/bash
#Korpos Botond
#kbim2251
#522

#parameter ellenorzes:
if [ $# -eq 0 ]
then
        echo "usage: $0 dir"
        exit 1
fi

for dir
do
        if [ ! -d "$dir" ]
        then
                echo "$dir is not a directory!"
                exit 1
        fi
done

#vegigmegyunk az osszes parameteren (mind directoryk)
for dir
do
	#azokon belul pedig az osszes fileon
        for file in `find $dir`
	do
		#ha a file command kimenete az adott file-re tartalmazza a
		#text/empty/directory szavakat, akkor nem foglalkozunk vele
        	file $file | grep -q -e text -e empty -e directory
		if [ $? -eq 1 ]
		then
			#ha pedig nem tartalmazza, akkor kiirjuk a file nevet es a jogokat
                        permissions=$(stat -c%A "$file")
                        echo $file $permissions
                fi
        done
done

exit 0
