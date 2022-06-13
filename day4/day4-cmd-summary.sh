exit 0

# helm install wordpress-operator bitpoke/wordpress-operator -n workshop04 --create-namespace

kubectl create ns acme

kubectl apply -k overlay/tenant1