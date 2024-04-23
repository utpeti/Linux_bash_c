if [ -e pontok ]
then
        rm -f pontok
fi

cp ~labhu/SO/PF/awk/megold-general.sh .
#./megold-general.sh $1 $2

cat eredm | awk -v n=$1 -v m=$2 'BEGIN { k = 1 }{
        if (NR==1) {
                myindex=1
                for(i=1; i<=NF; ++i) {
                        if($i !~ /Javitokulcs:/) {
                                solutions[myindex] = $i
                                myindex++
                        }
                }
        } else {
                personpts[$1] = 0
                incorrect[$1] = 0
                for(i=2; i <= NF; ++i) {
                        if($i ~ solutions[i - 1]) {
                                personpts[$1]++
                        } else if ($i !~ "-"){
                                incorrect[$1]++
                        }
                }
                points[$1] = $1 " " m + (personpts[$1] * 4) - incorrect[$1]
        }
        k++
} END {
        for (point in points) {
                printf("%s\n", points[point])
        }
}' >pontok
temp=$(cat pontok | sort -nk1)
echo "$temp" >pontok

cat eredm | awk -v n=$1 -v m=$2 'BEGIN {
        for (i=1; i<=m; ++i) {
                solved[i]=0
		notanswered[i]=0
        }
	letter[A]=0
	letter[B]=0
	letter[C]=0
	letter[D]=0
}
{
        if (NR==1) {
                myindex=1
                for(i=1; i<=NF; ++i) {
                        if($i !~ /Javitokulcs:/) {
                                solutions[myindex] = $i
                                ++myindex
                        }
                }
        }
        else {
                for(i=2; i <= NF; ++i) {
                        if($i ~ solutions[i - 1]) {
                                solved[i - 1]++
                        } else if($i ~ "-") {
				notanswered[i - 1]++
			}
			letter[$i]++
                }
        }
} END {
        for (solution in solved) {
                printf("%d %d\n", solution, solved[solution])
        }
	max=0
	for (l in letter) {
		if (letter[l] > max && l !~ "-") {
			max=letter[l]
			maxl=l
		}
	}
	minf=m
	printf("Legtobbszor hasznalt betu: %s\n", maxl)
	for (i=m; i >= 1; --i) {
		if(notanswered[i] >= notanswered[minf]) {
			minf = i
		}
	}
	printf("Legtobbet nem valaszoltak a %d-re", minf)
}' | sort -nk2

