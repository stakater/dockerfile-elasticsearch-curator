#!/bin/bash

# Snapshot ES indexes
if [ -n "${DO_SNAPSHOT}" ];
then
    echo "$(date) - Creating Snapshot on repository: ${SNAPSHOT_NAME} for indices older than ${OLDER_THAN} ${TIME_UNIT}"
    /usr/bin/curator_cli \
        --loglevel ${LOGLEVEL} \
        --logfile ${LOGFILE} \
        --host ${ELASTICSEARCH_HOST} \
        --port ${ELASTICSEARCH_PORT} \
        snapshot \
            --repository ${SNAPSHOT_NAME} \
            --filter_list "{\
                        \"filtertype\": \"age\", \
                        \"direction\": \"older\", \
                        \"unit\":\"${TIME_UNIT}\", \
                        \"unit_count\": ${OLDER_THAN}, \
                        \"source\" : \"name\", \
                        \"timestring\": \"${TIMESTRING}\"\
                    }"
fi;

# Delete ES Indexes
if [ -n ${DO_DELETE} ];
then
    echo "$(date) - Deleting indices older than ${OLDER_THAN} ${TIME_UNIT}"
    /usr/bin/curator_cli \
        --loglevel ${LOGLEVEL} \
        --logfile ${LOGFILE} \
        --host ${ELASTICSEARCH_HOST} \
        --port ${ELASTICSEARCH_PORT} \
            delete_indices \
                --filter_list "{\
                        \"filtertype\": \"age\", \
                        \"direction\": \"older\", \
                        \"unit\":\"${TIME_UNIT}\", \
                        \"unit_count\": ${OLDER_THAN}, \
                        \"source\" : \"name\", \
                        \"timestring\": \"${TIMESTRING}\"\
                    }"
fi;