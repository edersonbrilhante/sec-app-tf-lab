# SEC APP TF

This project has the idea to show an idea how to deploy a safe app in aws.

## Build

This project uses docker to n golang project

Steps:
```
docker build -t sec-app-tf -f deployment/docker/Dockerfile .
```

## Deploy

Here you will find the steps to deploy the infrastructure. 

> **_NOTE:_**  By default the eks will be deployed in N. California, in case you wish deploy in another region, change the property `region` with the correct region in the file `variables.tfvars`

```
terraform apply -var-file=variables.tfvars
```