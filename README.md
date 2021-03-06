# Dockerfile for elasticsearch curator

Refer to the version matrix in the [official curator repository](https://github.com/elastic/curator) on which version to use.

## Tags

3.5.1 - [Dockerfile](https://github.com/stakater/dockerfile-elasticsearch-curator/blob/master/3.5.1/Dockerfile)

## How to use

### Version 3.5.1

This version has the option to backup snapshot to s3 and/or delete indices based upon the following values.

Environment Variables:

* `CRON_SCHEDULE`: Crontab schedule for curator to run, Default: `0 0 * * *` i.e. Daily at 00:00
* `ELASTICSEARCH_HOST`: Elasticsearch host
* `ELASTICSEARCH_PORT`: Elasticsearch port
* `SNAPSHOT_NAME`: Name of the snapshot repository in ES
* `BUCKET_NAME`: Name of the bucket in which indice snapshots are to be backedup
* `BUCKET_BASE_PATH`: Base path inside bucket where indices backup must be stored
* `AWS_REGION`: AWS region of the bucket
* `TIME_UNIT`:[hours|days|weeks|months] Unit of time to reckon by
* `TIMESTRING`: Python strftime string to match your index definition, e.g. 2014.07.15 would be %Y.%m.%d
* `OLDER_THAN`: Include only indices older than n time_units (Integer)
* `DO_SNAPSHOT`: If variable is set (default), enables the code snippet which takes snapshot and backs up indices to s3
* `DO_DELETE`: If variable is set (default), enables the code snippet which deletes indcies
* `LOGLEVEL`: Log level of the curator log,  default: `INFO`
* `LOGFILE`: File in which curator writes its logs, default `/var/log/curator.log`
* `EXTRA_OPTS`: Pass extra flag options to curator e.g. `--dry-run` 

Example Usage:

Elasticsearch running on host and disabling snapshot, only deleting incdices

```bash
docker run -d -e ELASTICSEARCH_HOST=elasticsearch -e DO_SNAPSHOT="" stakater/elasticsearch-curator
```
