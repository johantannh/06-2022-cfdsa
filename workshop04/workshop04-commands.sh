exit 0

# Shows what resources will be generated and deployed via kustomize
kubectl kustomize ./overlay/tenant1

kubectl apply -k ./overlay/tenant1

# After applying, still unable to connect to instance... why?
# Remove NetworkPolicy first

# How to debug?
# 1. kubectl exec db pod first to make sure can login mysql
# > mysql -u root -p

# 2. kubectl exec wp pod, make sure apache is running
# kubectl exec pod/acme-wpapp-deploy-84bcd7c99f-txcgv -n acme-answer -it bash
# a. Need to install a browser like cli first, then check apache running status
# apachectl status

# 3. Can ingress nginx be reached via reverse dns nip.io? - Yes
# 3a. Can ingress nginx reach the pods? - No? Getting error 504....
# 3b. Can put LoadBalancer instead of ClusterIp for Service and try reaching the instance? - Still cannot reach with direct LB IP

# 4. Have to find a way to access the wp instance directly...
