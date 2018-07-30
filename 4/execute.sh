# 先にvolumeを作らないとpodが起動しない

# volumeの作成
kubectl apply -f persistent-volume.yml
kubectl apply -f persistent-volume-claim.yml

# podの作成
kubectl apply -f nginx-pod.yml

# kuardのpodを作成し、pod内の/dataをホストの/var/logにマウントしてください
# kubectl run --restart=Never --image=gcr.io/kuar-demo/kuard-amd64:1 kuard を実行するとkuardのpodを作れる
