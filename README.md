#install kubernetes menggunakan terraform ( siapin wadah di gcp ) dan ansible ( utk k8s ya)


GCP
=====
gcloud auth login  .....

gcloud config set project ........

gcloud iam service-accounts list


gcloud iam service-accounts keys create credentials.json \

--iam-account= ......


export GOOGLE_APPLICATION_CREDENTIALS=credentials.json


ansible
=======

ssh-keygen -t rsa              ----------> semua host

ssh-copy-id root@IP_WORKER_1   ----------> semua host 

ansible -i hosts all -m ping   ---------> test semua host



====

ansible-playbook -i hosts users.yml

ansible-playbook -i hosts install-k8s.yml

ansible-playbook -i hosts master.yml

*su kube sebelum menjalankannya* kubectl get nodes

ansible-playbook -i hosts join-workers.yml

kubectl get nodes

====

kubectl create deployment canda-app --image=andonebekasi/webasik

kubectl expose deployment canda-app --name=canda-app-service --type=LoadBalancer --port 8080 --target-port 80

kubectl get pods -o wide

kubectl describe pods canda

kubectl get svc

kubectl get nodes -o wide

=======

Ref

https://youtu.be/UUqSIPFdxk8
please subscribe and share / like


andipangeran.xyz
jasalinux.web.id
jasalinux.com
jasa-cloud.com



