## Service Status:
sudo /opt/bitnami/ctlscript.sh status

## Start all services:
sudo /opt/bitnami/ctlscript.sh start

## Stop all services:
sudo /opt/bitnami/ctlscript.sh stop

## Restart all services:
sudo /opt/bitnami/ctlscript.sh restart

## Pass below arguments to restart independent services
sudo /opt/bitnami/ctlscript.sh restart apache

## Grafana Service Restart
sudo service grafana-server restart