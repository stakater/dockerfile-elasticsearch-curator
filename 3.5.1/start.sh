#!/bin/bash

echo "Creating Backup repository in ES... "
/curator-config/create-snapshot-repository.sh 

echo "
Writing curator cron job ..."
touch /var/log/curator.log
echo "${CRON_SCHEDULE}	/curator-config/curate.sh >> /var/log/curator.log 2>&1" >> /etc/crontabs/root

echo "
Starting cron ..."
crond -f &
echo "
cron started"
tail -f /var/log/curator.log