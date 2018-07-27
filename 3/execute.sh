# helmを利用したingressのinstall
helm install --name ingress --namespace nginx-ingress -f values.yml stable/nginx-ingress

# minikubeのipを設定する
# ingress.ymlを編集する
kubectl apply -f ./

curl `minikube ip`

# 前回のredirectするnginxを
# ingress(service) -> ingress(pod) -> nginx(service) -> nginx(pod) -> redirect to google, yahoo ..etc
# のようにする
# 終わったらconfigmapでnginxの設定をする
