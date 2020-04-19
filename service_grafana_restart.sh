#!/bin/bash
## Codificacion UTF-8
## Autor: Jean Carlo Espinoza
## Contacto: jeancarloe01@hotmail.com
## Version: 0.1.0
## **Instrucciones**
## 1- Script para reiniciar todos los servicios del servidor via cron.

echo "**Service restart at $(date)**" >> /home/ubuntu/Automation/monitoring/grafana_service.log
sudo service grafana-server restart
if [ "$?" -eq "0" ]
	then
		echo "Grafana Service Restarted Sucesfully" >> /home/ubuntu/Automation/monitoring/grafana_service.log
	else
		echo "Failure Restarting Grafana Service" >> /home/ubuntu/Automation/monitoring/grafana_service.log
fi
echo "**Executed via cron job**" >> /home/ubuntu/Automation/monitoring/grafana_service.log