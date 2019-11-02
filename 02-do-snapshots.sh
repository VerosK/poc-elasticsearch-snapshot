
# get endpoint of minio

MINIO_IP=$( docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' minio )
 

curl -X PUT "localhost:9200/_snapshot/minio?pretty" -H 'Content-Type: application/json' -d'{ "type": "s3",  "settings": {  "bucket": "elasticsearch", "protocol": "http" , "endpoint": "http://'$MINIO_IP':9000" } }' 

curl -X PUT http://127.0.0.1:9200/_snapshot/minio/snapshot_1/\?wait_for_completion\=true
