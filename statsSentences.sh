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

#awk 'NR==3' datos.txt
		
		#$1
TOTAL=$( cat chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | wc -l )

echo " "
echo -n "Total of sentences: "
echo $TOTAL
echo " "

SPLIT=()
j=0

SUMA=0
NUMERO=0

SHORTL=0
LS=()
LONGL=0
LL=()

for i in $(seq $TOTAL)
do
	if [ $i -eq 1 ]; then

		SPLIT[$j]=$(cat -b chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i"  )
		j=$(( $j + 1 ))
		SHORTL=$(cat -b chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )
		LONGL=$(cat -b chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )

                NUMERO=$(cat -b chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )
                SUMA=$(( $SUMA + $NUMERO ))


	else
		SPLIT[$j]=$(cat -b chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i"  )
                j=$(( $j + 1 ))

		NUMERO=$(cat -b chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )
		SUMA=$(( $SUMA + $NUMERO ))


		[ $NUMERO -lt 2 ] && continue;
		[ $NUMERO -gt $LONGL ] && LONGL=$NUMERO && LL[0]=$(cat -b chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" );
		[ $NUMERO -lt $SHORTL ] && SHORTL=$NUMERO && LS[0]=$(cat -b chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" );

	fi


done




echo " "
echo "la suma total de longitudes: $SUMA"
echo " " 
#echo $( cat chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | wc -m ) #identico a hacer a la sumatoria anterior
echo " "
echo "la linea mas larga es de: $LONGL"
echo " "
echo "${LL[0]}"
echo " "
echo "la linea mas corta fue: $SHORTL"
echo " "
echo "${LS[0]}"
echo " " 



#for element in $(seq 0 $TOTAL)
#do
#	echo ${SPLIT[$element]}
#done
	
	
	
	
	
	
exit 0


