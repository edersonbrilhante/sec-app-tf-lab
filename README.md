# SEC APP TF

This project has the idea to show an idea how to deploy a safe app in aws.

## Requirements

- Docker Engine
- helm3
- terraform
- aws-iam-authenticator

## Builing the application

This project uses docker to n golang project

Steps:
```
docker build -t sec-app-tf -f deployment/docker/Dockerfile .
```

## Deploing Infrastructure

Here you will find the steps to deploy the infrastructure.

> **_NOTE:_**  By default the eks will be deployed in N. California, in case you wish deploy in another region, change the property `region` with the correct region in the file `variables.tfvars`

```
cd deployment/terraform/eks/
terraform apply -var-file=variables.tfvars
export KUBECONFIG=$(pwd)/.kubeconfig_my-cluster
```


## Deploing Application


## Facing the Application to Internet
```
cd deployment/terraform/internet-facing/
terraform apply -var-file=variables.tfvars
```