kubectl create ns redis-operators

helm install redis-sentinel repo/redis-sentinel \
  --set redissentinel.clusterSize=3  --namespace redis-operators \
  --set redisSentinelConfig.redisReplicationName="redis-replication"