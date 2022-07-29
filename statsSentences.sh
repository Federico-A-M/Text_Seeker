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
		
TOTAL=$( cat $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | wc -l )

echo " "
echo "========================================================="
echo -n "Total of sentences: "
echo $TOTAL
echo "========================================================="
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

		SPLIT[$j]=$(cat -b $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i"  )
		j=$(( $j + 1 ))
		SHORTL=$(cat -b $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )
		LONGL=$(cat -b $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )

                NUMERO=$(cat -b $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )
                SUMA=$(( $SUMA + $NUMERO ))


	else
		SPLIT[$j]=$(cat -b $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i"  )
                j=$(( $j + 1 ))

		NUMERO=$(cat -b $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )
		SUMA=$(( $SUMA + $NUMERO ))


		[ $NUMERO -lt 2 ] && continue;
		[ $NUMERO -gt $LONGL ] && LONGL=$NUMERO && LL[0]=$(cat -b $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" );
		[ $NUMERO -lt $SHORTL ] && SHORTL=$NUMERO && LS[0]=$(cat -b $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" );

	fi


done


echo "========================================================="
echo " "
echo "::List of analyzed sentences::  "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
echo " "
for element in $(seq 0 $TOTAL)
do
       echo ${SPLIT[$element]}
done
echo " "
echo "========================================================="
echo " "
echo " "
echo " "


echo "========================================================="
echo "the sum total of lengths: $SUMA"
echo " " 
#echo $( cat chapter37.txt | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | wc -m ) #identico a hacer a la sumatoria anterior
echo "========================================================="
echo " "
echo " "
echo "========================================================="
echo "the longest line length is: $LONGL"
echo " "
echo "${LL[0]}"
echo "========================================================="
echo " "
echo " "
echo "========================================================="
echo "the shortest line length is: $SHORTL"
echo " "
echo "${LS[0]}"
echo "========================================================="
echo " "
echo " "
echo "========================================================="
echo "The average length is: $(( $SUMA / $TOTAL )) "
echo "========================================================="


	
	
	
	
	
exit 0

