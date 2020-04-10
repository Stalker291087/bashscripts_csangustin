#!/bin/bash
## Codificacion UTF-8
## Autor: Jean Carlo Espinoza
## Contacto: jeancarloe01@hotmail.com
## Version: 0.1.0
## **Instrucciones**
## 1- Pasar dos valores al correr el script
## 2- El primero sera el directorio que se desea respaldar
## 3- El segundo parametro sera el destino donde se guardara el respaldo ya realizado y comprimido

 # Reasigna valor de varibles para pasarlas a los comandos de una manera limpia
   origen=/home/bitnami/apps/moodle/htdocs
   destino=/var/Moodle_Backups/"respaldo_Moodle_"`date +%m_%d_%Y`
 # copia tomando los valores de las variables que contienen el origen y el destino
   cp -r $origen $destino
 # empaqueta y comprime el directorio de respaldo creado anteriormente
   tar -zcvf $destino.tar.gz $destino 2>/dev/null
 # empaquetado y compreso remueve el directorio de respaldo
   rm -r $destino
 # Si no se cumple la primera condicion entonces da error por la cantidad de parametros ingresados
   echo "Respaldo realizado correctamenten en /var/Moodle_Backups"
   echo $(ls -l /var/Moodle_Backups/)