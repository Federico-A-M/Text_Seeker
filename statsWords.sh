#!/bin/bash

############################################################################
#  indicador estadistico de longitud de palabras::
# 						la mas corta
# 						la mas larga
#						y el promedio de longitud
############################################################################


REGEX="[a-zA-Z]\w+$" #expresion regular que matchea solo con palabras y evita los numeros


FILE=$( cat chapter37.txt | tr -d "[:punct:]" | tr -d "..." | tr " " "\n") #elimina los signos y demas (robado de un compañero)

short="pppppppppppppppppp" #para que despues se intercambie con una mas corta
long=""

for word in $FILE;
do
     echo $word
     if [[ $word =~ $REGEX ]]; then
	     [[ ${#word} -lt ${#short} ]] && short=$word;
	     [[ ${#word} -gt ${#long} ]] && long=$word;
     fi
done
 


echo ""
echo $short
echo $long



#chars=$(tr -dc '[:alnum:]' < $1 | wc -c)
#words=$(cat $1 | wc -c)
#printf "%.2f" $(echo "$chars/$words" | bc -l)




exit 0
