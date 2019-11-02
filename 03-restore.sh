
# get endpoint of minio


curl -X POST "localhost:9200/_snapshot/minio/snapshot_1/_restore?wait_for_completion=true" -H 'Content-Type: application/json' -d'
{
  "indices": "shakespeare",
  "ignore_unavailable": true,
  "include_global_state": false,
  "rename_pattern": "(.+)",
  "rename_replacement": "$1_restored"
}
'

