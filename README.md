# SEC APP TF

This project has the idea to show an idea how to deploy a safe app in aws.

## Requirements

- Docker Engine
- helm3
- terraform
- aws-iam-authenticator

## Builing the application

This project uses docker to n golang project

> **_NOTE:_**  By default the docker is been sent to docker hub under the username `edersonbrilhante`. In case you wish push to another docker repo, export the envvar `USERNAME` with the the correct one.

Steps:
```
export USERNAME=<username>
docker build -t $USERNAME/sec-app-tf:0.1.0 -f deployment/docker/Dockerfile .
docker push $USERNAME/sec-app-tf:0.1.0
```

## Deploing Infrastructure

Here you will find the steps to deploy the infrastructure.

> **_NOTE:_**  By default the eks will be deployed in N. California. In case you wish deploy in another region, change the property `region` with the correct region in the file `deployment/terraform/eks/variables.tfvars`

```
cd deployment/terraform/eks/
terraform apply -var-file=variables.tfvars
export KUBECONFIG=$(pwd)/.kubeconfig_my-cluster
cd ../../../
```

## Deploing Application

Here you will find the steps to deploy the application using helm chart.

> **_NOTE:_**  By default the helm chart will deploy the docker image edersonbrilhante/sec-app-tf:0.1.0. In case you wish deploy another docker image, change the property `image.repository` with the correct one in the file `deployment/helm/sec-app-tf/values.yaml`

```
helm upgrade --install  sec-app-tf deployment/helm/sec-app-tf
```

## Facing the Application to Internet

> **_NOTE:_**  By default the eks will be deployed in N. California, in case you wish deploy in another region, change the property `region` with the correct region in the file `deployment/terraform/internet-facing/variables.tfvars`

```
cd deployment/terraform/internet-facing/
terraform apply -var-file=variables.tfvars
```