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




for word in $NONREPEAT;
do
	if [ ${#word} -lt 4 ];then
		continue;

	elif [[ $word =~ $REGEX ]]; then	
		
		echo $( grep -o -i $word chapter37.txt | wc -l | tr '[:upper:]' '[:lower:]' ) $word >> esto.txt
		
	fi
done

RANKING=$( cat esto.txt | sort -n -r )

CONT=20
for i in $RANKING:
do
    echo "$i"
    CONT=$(( CONT - 1 ))
    [ $CONT -eq 0 ] && break;

done
	
rm esto.txt

exit 0
