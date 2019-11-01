#!/bin/sh

set -e -x

#docker-compose up -d

# source from https://www.elastic.co/guide/en/kibana/3.0/import-some-data.html


# Get Shakespeare data from Elasticsearch examples
if [ ! -f shakespeare-data.json ]; then
	wget --continue https://www.elastic.co/guide/en/kibana/3.0/snippets/shakespeare.json \
		-O shakespeare-data.json
fi

# Prepare mapping and apply it
cat > shakespeare-mapping.json <<EOF
{
 "mappings" : {
  "_default_" : {
   "properties" : {
    "speaker" : {"type": "string", "index" : "not_analyzed" },
    "play_name" : {"type": "string", "index" : "not_analyzed" },
    "line_id" : { "type" : "integer" },
    "speech_number" : { "type" : "integer" }
   }
  }
 }
}
EOF

curl -XPUT http://localhost:9200/shakespeare -d @shakespeare-mapping.json

# Put Shakespeare into the elasticsearch
curl -XPUT http://localhost:9200/_bulk --data-binary @shakespeare-data.json

