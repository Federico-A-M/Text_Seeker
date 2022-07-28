#indica la imagen que vamos a usar
FROM ubuntu:20.04

#agregar archivos a la imagen en la ruta especificada
ADD ["runSeeker.sh", "/root/"]
ADD ["statsWords.sh", "/root/"]
ADD ["statsUsageWords.sh", "/root/"]
ADD ["findNames.sh", "/root/"]
ADD ["statsSentences.sh", "/root/"]
ADD ["blankLinesCounter.sh", "/root/"]

#indica el script que tiene que ejecutar al incio
ENTRYPOINT ["/root/runSeeker.sh"]


