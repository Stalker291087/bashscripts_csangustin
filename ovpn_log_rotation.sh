#!/bin/bash

###################################################################
#Script Name    : opvpn_log_rotation.sh
#Description    : Purpose of the script is to clean up openvpn logs
#Args           : None
#Prerequisites  : None
#Last Modified  : Monday, September 25th, 2023  
#Author         : Jean C Espinoza
#Email          : jeancarloe01@hotmail.com
###################################################################

#variables
file_name=$( date +%F )
slack_webhook='https://hooks.slack.com/services/<>'
logs_location='/var/log/openvpn/'
openvpn_log_file='/var/log/openvpn/openvpn.log'
log_file='/home/ubuntu/automation/logs/ovpn_log_rotation.log'
s3_bucket='s3://<>'

echo "####################################################" >> ${log_file}
echo "Starting OpenVPN log roation at ${date}" >> ${log_file}
curl -X POST -H 'Content-type: application/json' --data '{"text":"Hello Admin, Starting OPENVPN log rotation!"}' $slack_webhook
echo "Creating gzip file" >> ${log_file}
systemctl stop openvpn
sleep 10s
zip $file_name.gz $openvpn_log_file
echo "Clearing up the ${openvpn_log_file}" >> ${log_file}
echo "" > $openvpn_log_file
systemctl start openvpn
sleep 10s
aws s3 sync ${logs_location} $s3_bucket --exclude "*" --include "*.zip" >> ${log_file}
if [ "$?" -eq 0 ]; then
    echo "Backup file uploaded to S3 ..." >> ${log_file}
    echo "####################################################" >> ${log_file}
    curl -X POST -H 'Content-type: application/json' --data '{"text":"Hello Admin, OpenVPN log rotation has succeeded!"}' $slack_webhook
    find $logs_location -name *.zip -delete
else
    echo "Log rotation failed at ${date}" >> ${log_file}
    echo "####################################################" >> ${log_file}
    curl -X POST -H 'Content-type: application/json' --data '{"text":"Hello Admin, OpenVPN log rotation has failed, check the logs!"}' $slack_webhook
fi
