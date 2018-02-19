#!/bin/bash

# Snapshot ES indexes
if [ -z "${DO_SNAPSHOT}" ]; 
then
    /usr/bin/curator \
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
if [ -z ${DO_DELETE} ];
then
    /usr/bin/curator \
        --host ${ELASTICSEARCH_HOST} \
        --port ${ELASTICSEARCH_PORT} \
            delete indices \
                --time-unit ${TIME_UNIT} \
                --older-than ${OLDER_THAN} \
                --timestring ${TIMESTRING}
fi;