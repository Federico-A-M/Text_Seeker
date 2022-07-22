#!/bin/bash

###############################################################################
#	findNames.sh
#	Identificación de nombres propios (se identifican sólo si están en este formato
#	Nnnnnnnnn), aunque la palabra no sea un nombre propio realmente.
#	
#	Ejemplos: Mateo, Estonoesunnombre, Ana.
###############################################################################



REGEX="[A-Z]\w+$" #expresion regular que matchea solo con palabras y evita los numeros

           #chapter37.txt
FILE=$( cat chapter37.txt | tr -d "[:punct:]" | tr -d "..." | tr " " "\n")

PROPERNOUNS=()
i=0

for word in $FILE;
do 
     if [[ $word =~ $REGEX ]]; then
	     PROPERNOUNS[$i]=$word
	     i=$(( $i + 1 ))
     fi  
         
done

echo " "
echo "================================================"
echo "Total of proper nouns: "
echo ${#PROPERNOUNS[@]}
echo "================================================"
echo ""
echo ""
echo "================================================"
echo "Listing :"
echo "~~~~~~~~~~"
echo ""
for j in ${PROPERNOUNS[@]}
do
	echo -n "$j /  "
done	
echo " "
echo "================================================"
echo " "



exit 0
