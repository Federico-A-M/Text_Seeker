#!/bin/bash


#######################################################################
#
#	5. blankLinesCounter.sh
#	Contador de líneas en blanco.
#
#######################################################################
 	    #chapter37.txt
TOTAL=$( cat $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | wc -l )

LINE=0
CONT=0

for i in $(seq $TOTAL)
do
                LINE=$(cat $1 | sed 's/\([.!?]\) \([[:upper:]]\)/\1\n\2/g' | awk "NR==$i" | wc -m )
     
                if [ $LINE -gt 1 ]; then
			continue;
		else
	                CONT=$(( $CONT + 1 ))                
                fi
done

echo " "
echo "=============================================="
echo "The number of empty sentences is: $CONT "
echo "=============================================="
echo " "



exit 0
