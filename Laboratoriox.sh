#!/bin/bash

#laboratirio de funciones

FILE=$(cat chapter37.txt | egrep "[a-zA-Z]\w*")	

for file in $FILE;
do
     echo $file 
done

exit 0

