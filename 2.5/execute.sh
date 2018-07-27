#!/bin/bash
# dockerコマンドでminikube内のdockerを操作できるようにする
eval $(minikube docker-env)
# docker registryを起動する（上のコマンドを実行した窓で実行する）
docker run -d -p 5000:5000 --restart=always --name registry -v /data/docker-registry:/var/lib/registry registry:2
# dockerのimageをbuildする
docker build . -t nginx-test:1
# dockerのimageをregistryにpushできるようにする
docker tag nginx-test:1 localhost:5000/nginx-test:1
# dockerのimageをregistryにpushする
docker push localhost:5000/nginx-test:1

# nginx-testのdeploymentをリリースする
kubectl apply -f nginx-test-deployment.yml
# nginx-testのserviceをリリースする
kubectl apply -f nginx-test-service.yml
# nginxのredirectをyahooに変更して再度リリースしてみる
