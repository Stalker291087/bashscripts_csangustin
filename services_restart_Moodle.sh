#!/bin/sh

#----------------------------------------------------------
# Service restart and backup script.
# version 3.0, updated May 03, 2020.
# contact: jeancarloe01@hotmail.com
#----------------------------------------------------------
# This work is licensed under a GPL
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#----------------------------------------------------------

# Definicion de variables para realizar el respaldo de Moodle Data
ORIGEN=/home/bitnami/apps/moodle/htdocs
DESTINO=/var/Moodle_Backups/"respaldo_Moodle_"`date +%m_%d_%Y`


echo "**Services stopped at $(date)**" >> ~/Automation/service_restart/service_restart.log
sudo /opt/bitnami/ctlscript.sh stop >> ~/Automation/service_restart/service_restart.log
if [ "$?" -eq 0 ]
then
    echo "Copying files from $ORIGEN to $DESTINO"
    sudo cp -r $ORIGEN $DESTINO
    sudo tar -zcf $ORIGEN.tar.gz $DESTINO 2>/dev/null
    sudo rm -r $DESTINO
    echo "Respaldo realizado correctamenten en /var/Moodle_Backups"
    echo "$(ls -l /var/Moodle_Backups/)"
    exit 10
fi

if [ "$?" -eq 10 ]
then
    sudo /opt/bitnami/ctlscript.sh start >> ~/Automation/service_restart/service_restart.log
    echo "**Services started at $(date)**" >> ~/Automation/service_restart/service_restart.log
    echo "**Executed via cron job**" >> ~/Automation/service_restart/service_restart.log
fi