#!/bin/bash

# Inicializador de text seeker con opciones

F=$1

echo "Checking file: $F..."
echo " "

[ $# -ne 1 ] && echo "Err: expected at least one parameter" && exit 1;

[ -d $F ] && echo "Err: expected regular file not directory" && exit 2;

[ ! -e $F ] && echo "Err: File not found" && exit 3;

[ ! -s $F ] && echo "Err: this File is empty" && exit 4;

[ ! -f $F ] && echo "Err: File not regular" && exit 5;

[ ! -r $F ] && echo "Err: don´t have read permission" && exit 6;

echo " "
echo "File read succefuly"
echo " "

PS3='Choise>'
echo "Please select the operation you wish to perform with this file: "
select option in "statsWords" "statsUsageWords" "findNames" "statsSentences" "blackLinesCounter" "Exit"
do
[ -e $option ] && echo "Wrong choice, try again" && continue
echo "You choise: " $option
	case $REPLY in
		1) source /root/statsWords.sh $F ;;
		2) source /root/statsUsageWords.sh $F ;;
		3) source /root/findNames.sh $F ;;
		4) source /root/statsSentences.sh $F ;;
		5) source /root/blankLinesCounter.sh $F ;;
		6) break ;;
	esac
done

echo " "
echo "Finish succesfuly"
exit 0


