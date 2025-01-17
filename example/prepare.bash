kubectl create ns redis-operators

#kubectl apply --server-side -f ../config/crd/bases/

helm install redis-operator repo/redis-operator --namespace redis-operators

#helm install redis-sentinel repo/redis-sentinel \
#  --set redissentinel.clusterSize=3  --namespace redis-operators \
#  --set redisSentinelConfig.redisReplicationName="redis-replication"


mkdir -p /tmp/k8s-webhook-server/serving-certs/
cp tls.crt /tmp/k8s-webhook-server/serving-certs/
cp tls.key /tmp/k8s-webhook-server/serving-certs/
cp ca.crt /tmp/k8s-webhook-server/serving-certs/
