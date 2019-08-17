# Api reference
https://help.sonatype.com/repomanager3/rest-and-integration-api/script-api

# Upload groovy script to nexus
curl -u admin:abc123. -X POST --header 'Content-Type: application/json' \
 http://localhost/service/rest/v1/script \
 -d @blobStore-dockerPrivate.json

# List uploaded script
curl -u admin:abc123. -X GET http://localhost/service/rest/v1/script

# Execute uploaded script
curl -u admin:abc123. -X POST --header 'Content-Type: text/plain' \
 http://localhost/service/rest/v1/script/blobStore-dockerPrivate/run
