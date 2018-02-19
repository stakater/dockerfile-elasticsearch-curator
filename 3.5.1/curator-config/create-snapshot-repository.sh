#!/bin/bash
set -e

# Create backup repository in ES
BODY='{"type":"s3","settings":{"bucket":"BUCKET_NAME","region":"AWS_REGION", "base_path":"BASE_PATH"}}'

BODY=$(echo ${BODY} | sed s,BUCKET_NAME,${BUCKET_NAME},g)
BODY=$(echo ${BODY} | sed s,AWS_REGION,${AWS_REGION},g)
BODY=$(echo ${BODY} | sed s,BASE_PATH,${BUCKET_BASE_PATH},g)

curl -XPUT "http://${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}/_snapshot/${SNAPSHOT_NAME}" -d ${BODY}