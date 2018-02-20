#!/bin/bash
set -e

echo "Creating Backup repository in ES... "
/curator-config/create-snapshot-repository.sh

echo "
Writing curator cron job ..."
echo "${CRON_SCHEDULE}	/curator-config/curate.sh" >> /etc/crontabs/root

# Create logfile if not exists
touch ${LOGFILE}

echo "
Starting cron ..."
crond -f &
echo "
cron started"
tail -f ${LOGFILE}