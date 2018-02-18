# Dockerfile for elasticsearch curator

Refer to the version matrix in the [official curator repository](https://github.com/elastic/curator) on which version to use.

## Tags

3.5.1 - [Dockerfile](https://github.com/stakater/dockerfile-elasticsearch-curator/blob/master/3.5.1/Dockerfile)

## How to use

### Version 3.5.1

Environment Variables:

* `CRON_SCHEDULE`: Crontab schedule for curator to run
* `ELASTICSEARCH_HOST`: Elasticsearch host
* `ELASTICSEARCH_PORT`: Elasticsearch port
* `SNAPSHOT_NAME`: Name of the snapshot repository in ES
* `BUCKET_NAME`: Name of the bucket in which indice snapshots are to be backedup
* `AWS_REGION`: AWS region of the bucket
* `TIME_UNIT`:[hours|days|weeks|months] Unit of time to reckon by
* `TIMESTRING`: Python strftime string to match your index definition, e.g. 2014.07.15 would be %Y.%m.%d
* `OLDER_THAN`: Include only indices older than n time_units (Integer)

```bash
docker run -d -e ELASTICSEARCH_HOST=elasticsearch stakater/elasticsearch-curator
```