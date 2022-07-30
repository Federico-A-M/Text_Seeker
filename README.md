# Text Seeker

_Proyecto realizado con fines educativos para la asignatura "Entorno de programación" dentro del plan de estudio de TUIA (Tecnicatura Universitaria en Inteligencia Artificial) Universidad Nacional de Rosario. El mismo consiste en un menú de mini aplicaciones (scripts de bash ) para análisis de texto desplegable desde un contenedor docker._

## Comenzando 🚀

_Estas instrucciones te permitirán poder usar este mini menu de analisis de texto._

### Pre-requisitos 📋

_1- Se necesita previamente tener instalado Docker en tu O.S._

_Si eres usuario de Ubuntu puedes instalar Docker desde la terminal en la siguiente dirección_

```
https://docs.docker.com/engine/install/ubuntu/
```
_Checkear que se haya instalado correctamente _

```
$ docker version
```
_Se aconseja por comodidad dar permisos de grupo introduciendo el siguiente comando_

```
$ sudo usermod -aG docker $USER
```

_Reiniciar la session antes de continuar_


_2- clonar o descargar zip de este repositorio al local_

### Instalación 🔧

_El proyecto fue realizado por defecto en base a una imagen ubuntu, necesitaremos traernos la imagen latest de ubuntu desde DockerHub_

_Para ello ingresamos el siguiente comando_

```
$ docker pull ubuntu
```

_Abrir una nueva terminal y movernos hasta la direcion donde se encuentre descargado el repositorio._

_Una vez realizado esto contruimos nuestra imagen que instanciara el contenedor con el dockerfile presente en el repo, escribir_

```
$ docker build -t runseeker .
```

_Construida la imagen ya estariamos en condiciones de ejecutar un contenedor_

## Ejecución de contenedores ⚙️

_Dentro del repositorio agregue un archivo txt con un fragmento de texto de mi novela favorita, pero se evaluar el texto que tu desees_

_En el comando que sigue usaremos el archivo "chapter37.txt" a modo de ejemplo_

```
docker run -it -v /home/user/Text_Seeker:/var/data runseeker /var/data/chapter37.txt 
```
_Con esto abremos logrado persistir los datos mapeando el archivo dentro contenedor _

### Mini Menu Text Seeker ⌨️

_El menu consta de 5 opciones para analisis de texto_

> **1. statsWords.sh** Indicador estadístico de longitud de palabras. 

> **2. statsUsageWords.sh** Indicador estadístico de uso de palabras.

> **3. findNames.sh** Identificación de nombres propios.

> **4. statsSentences.sh** Indicador estadístico de longitud de oraciones.

> **5. blankLinesCounter.sh** Contador de líneas en blanco.

## Autor ✒️

* **Aquino Martín, Federico** - *Trabajo Practico Final* - [Federico-A-M](https://github.com/Federico-A-M)

## Licencia 📄

Este proyecto está bajo la Licencia MIT - mira el archivo [LICENSE.md](LICENSE.md) para detalles
