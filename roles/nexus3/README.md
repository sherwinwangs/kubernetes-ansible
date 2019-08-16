# 参考文档
https://help.sonatype.com/repomanager3/rest-and-integration-api/script-api

# groovy 脚本执行的方法
curl -u admin:abc123. -X POST --header 'Content-Type: application/json' \
 http://localhost/service/rest/v1/script \
 -d @blobStore-dockerPrivate.json

curl -u admin:abc123. -X GET http://localhost/service/rest/v1/script


curl -u admin:abc123. -X POST --header 'Content-Type: text/plain' \
 http://localhost/service/rest/v1/script/blobStore-dockerPrivate/run