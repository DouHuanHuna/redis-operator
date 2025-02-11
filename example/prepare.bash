kubectl create ns redis-operators

kubectl apply --server-side -f config/crd/bases/

helm package redis-operator

helm install redis-operator repo/redis-operator --namespace redis-operators

helm uninstall redis-operator --namespace redis-operators

curl --data-binary "@redis-operator-0.18.5.tgz" http://localhost:8080/api/charts

curl -X DELETE http://localhost:8080/api/charts/redis-operator/0.18.5

helm install redis-sentinel repo/redis-sentinel \
  --set redissentinel.clusterSize=3  --namespace redis-operators \
  --set redisSentinelConfig.redisReplicationName="redis-replication"

kubectl get redissentinels.redis.redis.opstreelabs.in -A

helm uninstall redis-sentinel --namespace redis-operators

mkdir -p /tmp/k8s-webhook-server/serving-certs/
cp tls.crt /tmp/k8s-webhook-server/serving-certs/
cp tls.key /tmp/k8s-webhook-server/serving-certs/
cp ca.crt /tmp/k8s-webhook-server/serving-certs/
