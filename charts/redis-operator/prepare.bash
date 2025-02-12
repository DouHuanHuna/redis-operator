kubectl apply --server-side -f config/crd/bases/

kubectl create ns redis-operators

helm install redis-operator repo/redis-operator --namespace redis-operators

helm uninstall redis-operator --namespace redis-operators

curl --data-binary "@redis-operator-0.18.5.tgz" http://localhost:8080/api/charts

curl -X DELETE http://localhost:8080/api/charts/redis-operator/0.18.5