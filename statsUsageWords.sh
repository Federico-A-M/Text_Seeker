#!/bin/bash

##############################################################################
#
#	Indicador estadístico de uso de palabras, deben ser de al menos 4(cuatro)letras.
#	(mostrar un Top Ten de estas palabras ordenadas desde la que tiene
#	más apariciones a la que tiene menos). Es decir, filtrar las palabras que
# 	tengan al menos 4 letras y de éstas, elegir las 10 más usadas.

###############################################################################


REGEX="[a-zA-Z]\w+$" #expresion regular que matchea solo con palabras y evita los numeros

                #chapter37.txt
SORTFILE=$( cat chapter37.txt | tr -d "[:punct:]" | tr -d "..." | tr " " "\n" | tr '[:upper:]' '[:lower:]' | tr "á" "a" | tr "é" "e" |tr "í" "i" | tr "ó" "o" | tr "ú" "u" | tr "ñ" "n" | sort ) #Funciona

NONREPEAT=$( cat chapter37.txt | tr -d "[:punct:]" | tr -d "..." | tr " " "\n" | tr '[:upper:]' '[:lower:]' | sort -u ) #repite letras

#NONREPEAT=$( cat chapter37.txt | tr -d "[:punct:]" | tr -d "..." | tr " " "\n" | tr '[:upper:]' '[:lower:]' | tr "á" "a" | tr "é" "e" | tr "í" "i" | tr "ó" "o" | tr "ú" "u" | tr "ñ" "n" | sort -u ) #repite letras 


#grep -o -i $word $SORTFILE | wc -l

BEFORE=0
NOW=0
ARRAY=()
COUNTER=0

for word in $NONREPEAT;
do
	if [ ${#word} -lt 4 ];then
		continue;

	elif [[ $word =~ $REGEX ]]; then	
		echo ""
		echo $word
	
		NOW=$( grep -o -i $word chapter37.txt | wc -l | tr '[:upper:]' '[:lower:]' )
		echo $NOW
		
		[ $NOW -gt $BEFORE ] && BEFORE=$NOW  && ARRAY=("${ARRAY[$COUNTER]}" $word ) && COUNTER=$(( COUNTER + 1 )) ;
	
	fi
done

for i in "${ARRAY[*]}"
do
    echo "$i"
done
	
exit 0
