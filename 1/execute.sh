#!/bin/bash
# minikubeの環境構築
# brew caskのinstall
brew install caskroom/cask/brew-cask
# kubectlのinstall
brew install kubernetes-cli
# minikubeのinstall
brew cask install minikube
# virtualboxのinstall visit: https://www.virtualbox.org/wiki/Downloads
# helmのinstall
# これはkubernetesのパッケージマネージャー
brew install kubernetes-helm
# minikubeの起動
minikube start --memory 4096
# dockerコマンドでminikube内のdockerを操作できるようにする
eval $(minikube docker-env)

# port forwardを利用してpodにアクセスする
kubectl port-forward kuard 18080:8080
# 起動しているpod内でコマンドを実行する
kubectl exec -it kuard /bin/sh
# podのlogを見る
kubeclt logs kuard
# deploymentのリリース
kubectl apply -f kuard-deployment.yml
# deploymentのserviceをリリースする
kubeclt expose deployment kuard
# serviceにexternalIPを指定して外部からアクセスできるようにする
kubeclt apply -f kuard-service.yml
