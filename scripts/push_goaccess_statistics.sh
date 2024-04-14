#/bin/bash

sudo goaccess /opt/bitnami/apache2/logs/access_log --log-format='%h %^[%d:%t %^] "%r" %s %b' --date-format=%d/%b/%Y --time-format=%H:%M:%S -a -o /home/bitnami/apps/moodle/htdocs/report.html