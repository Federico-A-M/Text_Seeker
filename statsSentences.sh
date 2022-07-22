#!/bin/bash

##################################################################################
#	
#	4. statsSentences.sh
#	Indicador estadístico de longitud de oraciones
#	(la más corta, la más larga y el promedio de longitud)
#	Author: Federico-A-M
#
##################################################################################
  
#cat -b saltea lineas vacias

#Por ejemplo, si el fichero se llama «datos.txt» y quieres leer la linea numero 3, ejecutarias:
#awk 'NR==3' datos.txt
		
		#$1
TOTAL=$( cat chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | wc -l )

echo " "
echo -n "Total of sentences: "
echo $TOTAL
echo " "

SPLIT=()
j=0


for i in $(seq $TOTAL)
do
	SPLIT[$j]=$(cat chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i"  )
	j=$(( $j + 1 ))
done


for elements in $(seq 0 $TOTAL)
do
	echo ${SPLIT[$elements]}
done


SHORTLINES=0
LONGLINES=0


#chars=$(tr -dc '[:alnum:]' < $1 | wc -c)
#words=$(cat $1 | wc -c)
#printf "%.2f" $(echo "$chars/$words" | bc -l)


exit 0


