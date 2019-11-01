
# elasticsearch snapshot and restore

This is proof of concept of legacy Elasticsearch cluster 
snapshot and restore.


## how to use

1. Start ES cluster on one terminal  by `docker-compose up`

2. Put some data to the cluster by `01-setup-data.sh`

3. Play with backup and recovery

## TODO

1. Add `cloud-aws` plugin [cloud-aws].

2. Add S3 repository. [s3-repo] to the Elastic cluster, use [custom endpoint][s3-repo-endpoint].

3. Run [snapshot].

## cleanup

Delete whole directory with this repository.
   

# A big red warning

Do not use this unless you have old ElasticSearch 2.3 cluster. 

This repository was created to verify backup and restore 
procedures of legacy application.



[cloud-aws]: https://www.elastic.co/guide/en/elasticsearch/plugins/2.3/cloud-aws.html#cloud-aws-install

[s3-repo]:  https://www.elastic.co/guide/en/elasticsearch/plugins/2.3/cloud-aws-repository.html#cloud-aws-repository

[s3-repo-endpoint]: https://www.elastic.co/guide/en/elasticsearch/plugins/2.3/cloud-aws-repository.html#cloud-aws-repository-endpoint

[snapshot]: https://www.elastic.co/guide/en/elasticsearch/reference/2.3/modules-snapshots.html#_snapshot
