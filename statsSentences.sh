#!/bin/bash

##################################################################################
#	
#	4. statsSentences.sh
#	Indicador estadístico de longitud de oraciones
#	(la más corta, la más larga y el promedio de longitud)
#	Author: Federico-A-M
#
##################################################################################

                #$1  
#FILE=$( cat chapter37.txt | tr -d "[:punct:]" | tr -d "..." | tr " " "\n") #elimina los signos y demas (robado de un compañero)

#awk '{ print length(), NR, $0 | "sort -rn" }' tmp.txt

#egrep -n "^.{$(wc -L <

#FILESPLIT=$( egrep ^[\s\S]+$ chapter37.txt )

#FILESPLIT=$(tr '\n' ' ' < chapter37.txt | sed -e 's/[.] \s*/. \n/g')

SPLIT=$(cat chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g')


for lines in $SPLIT
do
	echo $lines
done



SHORTLINES=0
LONGLINES=0



TOTAL=$( cat chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | wc -l )

echo " "
echo -n "Total of sentences: "
echo $TOTAL








#for word in $FILE;



#chars=$(tr -dc '[:alnum:]' < $1 | wc -c)
#words=$(cat $1 | wc -c)
#printf "%.2f" $(echo "$chars/$words" | bc -l)


























exit 0


