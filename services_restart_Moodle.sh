#!/bin/bash
## Codificacion UTF-8
## Autor: Jean Carlo Espinoza
## Contacto: jeancarloe01@hotmail.com
## Version: 0.1.0
## **Instrucciones**
## 1- Script para reiniciar todos los servicios del servidor via cron.

echo "**Service restart at $(date)**" >> ~/Automation/service_restart/service_restart.log
sudo /opt/bitnami/ctlscript.sh restart >> ~/Automation/service_restart/service_restart.log
echo "**Executed via cron job**" >> ~/Automation/service_restart/service_restart.log