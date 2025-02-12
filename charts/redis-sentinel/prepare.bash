helm package redis-sentinel

helm install redis-sentinel repo/redis-sentinel \
  --set redissentinel.clusterSize=3  --namespace redis-operators \
  --set redisSentinelConfig.redisReplicationName="redis-replication"

helm uninstall redis-sentinel -n redis-operators

curl -X DELETE http://localhost:8080/api/charts/redis-sentinel/0.16.9

curl --data-binary "@redis-sentinel-0.16.9.tgz" http://localhost:8080/api/charts
