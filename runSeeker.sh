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
[ $REPLY == 6 ] && echo "Choise exit" && break
echo "You choise: " $option
	case $option in
		1) echo “case 1” ;;
		2) echo “case 2” ;;
		3) echo “case 3” ;;
		4) echo “case 4” ;;
		5) echo “case 5” ;;
		#*) echo “opcional no se para que en este caso” ;;
	esac
done

echo " "
echo "Finish succesfuly"
exit 0


