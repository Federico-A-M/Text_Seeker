#!/bin/bash

############################################################################
#  indicador estadistico de longitud de palabras::
# 						la mas corta
# 						la mas larga
#						y el promedio de longitud
############################################################################


REGEX="[a-zA-Z]\w+$" #expresion regular que matchea solo con palabras y evita los numeros

           #$chapter37.txt  
FILE=$( cat $1 | tr -d "[:punct:]" | tr -d "..." | tr " " "\n") #elimina los signos y demas.

short="pppppppppppppppppp" #para que despues se intercambie con una mas corta
long=""



TOTAL=$( cat $1 | tr -d "[:punct:]" | tr -d "..." | tr " " "\n" | wc -w )  
SUMA=$( cat $1 | tr -d "[:punct:]" | tr -d "..." | tr " " "\n" | wc -m )

for word in $FILE;
do
	[ ${#word} -lt 1 ] && continue;

	if [[ $word =~ $REGEX ]]; then
		[[ ${#word} -lt ${#short} ]] && short=$word;
		[[ ${#word} -gt ${#long} ]] && long=$word;
	fi 
done

echo ""
echo "============================================"
echo "Total words: $TOTAL"
echo "============================================"
echo ""
echo ""
echo "============================================"
echo "The average length is: $(( $SUMA / $TOTAL ))"
echo "============================================"
echo ""
echo ""
echo "============================================"
echo "The shortest word: $short"
echo "============================================"
echo ""
echo ""
echo "============================================"
echo "The longest word: $long"
echo "============================================"
echo ""

#-- if you want to see word for word--

#for i in ${FILE[*]}
#do
#	echo $i
#done


exit 0
