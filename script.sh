#!/bin/bash

echo "Criando as imagens..."

docker build -t johnnbass/projeto-backend:1.0 backend/.
docker build -t johnnbass/projeto-database:1.0 database/.

echo "Executando o push das imagens..."

docker push johnnbass/projeto-backend:1.0
docker push johnnbass/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando deployments..."

kubectl apply -f ./deployment.yml
