#!/bin/sh

#----------------------------------------------------------
# mysql database backup script.
# version 1, updated April 23, 2020.
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

# (1) set up all the mysqldump variables
FILE=/var/Moodle_Backups/DB_Dump/minime.sql.`date +"%Y%m%d"`
DBSERVER=127.0.0.1
DATABASE=bitnami_moodle
USER=
PASS=

# (2) do the mysql database backup (dump)

# use this command for a database server on a separate host:
#mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}

# use this command for a database server on localhost. add other options if need be.
mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}

# (4) gzip the mysql database dump file
gzip $FILE

# (5) show the user the result
echo "${FILE}.gz was created:"
ls -l ${FILE}.gz
