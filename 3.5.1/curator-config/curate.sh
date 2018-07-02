#!/bin/bash

# Snapshot ES indexes
if [ -n "${DO_SNAPSHOT}" ]; 
then
    echo "$(date) - Creating Snapshot on repository: ${SNAPSHOT_NAME} for indices older than ${OLDER_THAN} ${TIME_UNIT}"
    /usr/bin/curator \
        ${DRY_RUN} \
        --loglevel ${LOGLEVEL} \
        --logfile ${LOGFILE} \
        --host ${ELASTICSEARCH_HOST} \
        --port ${ELASTICSEARCH_PORT} \
        snapshot \
            --repository ${SNAPSHOT_NAME} \
        indices \
            --older-than ${OLDER_THAN} \
            --time-unit ${TIME_UNIT} \
            --timestring ${TIMESTRING}
fi;

# Delete ES Indexes
if [ -n ${DO_DELETE} ];
then
    echo "$(date) - Deleting indices older than ${OLDER_THAN} ${TIME_UNIT}"
    /usr/bin/curator \
        ${DRY_RUN} \
        --loglevel ${LOGLEVEL} \
        --logfile ${LOGFILE} \
        --host ${ELASTICSEARCH_HOST} \
        --port ${ELASTICSEARCH_PORT} \
            delete indices \
                --time-unit ${TIME_UNIT} \
                --older-than ${OLDER_THAN} \
                --timestring ${TIMESTRING}
fi;
