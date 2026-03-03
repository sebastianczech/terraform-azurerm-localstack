# Terraform modules for provisioning resource in Azure LocalStack

## Pre-requisites

Acquire an auth token for LocalStack Cloud from https://app.localstack.cloud/ and set it as an environment variable:

```bash
export LOCALSTACK_AUTH_TOKEN=<your_auth_token>
```

Setup environment using Docker Compose:

```bash
docker-compose up
```

or using Docker CLI:

```bash
docker pull localstack/localstack-azure-alpha

docker run \
    --rm -it \
    -p 4566:4566 \
    -p 4510:4510 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.localstack/volume:/var/lib/localstack \
    -e LOCALSTACK_AUTH_TOKEN=${LOCALSTACK_AUTH_TOKEN:?} \
    localstack/localstack-azure-alpha
```

Install `azlocal`:

```bash
brew install pipx
pipx install azlocal
```

## Labs

### Lab 1 - Azure CLI with LocalStack

Quickstart:
```bash
# Check if LocalStack is running
curl http://localhost:4566/_localstack/health

# Check if Azure CLI is installed and configured
az account show

# Start interception and set Azure CLI to use LocalStack
azlocal start_interception

# Check if Azure CLI is now pointing to LocalStack
az account show

# Create a resource group in LocalStack
az group create --name MyResourceGroup --location westeurope

# List resource groups in LocalStack
az group list

# Show details of the created resource group
az group show --name MyResourceGroup

# Create storage account
az storage account create \
    --name testaccount \
    --resource-group MyResourceGroup \
    --location westeurope \
    --sku Standard_LRS

# Create container
azlocal storage container create \
    --name testcontainer \
    --account-name testaccount \
    --auth-mode login

# List container
azlocal storage container list \
    --account-name testaccount \
    --auth-mode login

# Upload blob
azlocal storage blob upload \
    --container-name testcontainer \
    --account-name testaccount \
    --data "Your raw data here" \
    --name testblog \
    --auth-mode login

# Download blob
azlocal storage blob download \
    --container-name testcontainer \
    --account-name testaccount \
    --file check.txt \
    --name testblog \
    --auth-mode login

# Show blob details
azlocal storage blob show \
    --account-name testaccount \
    --container testcontainer \
    --auth-mode login \
    --name testblog

# Clean up resources
az group delete --name MyResourceGroup --yes

# Stop interception and reset Azure CLI to default
azlocal stop_interception

# Check if Azure CLI is now pointing to the default Azure environment
az account show
```

### Lab 2 - Terraform with LocalStack

Modules available for provisioning resources in Azure LocalStack:
- [Azure API Management](./modules/api-management/)
- [Azure App Service](./modules/app-service/)
- [Azure RBAC](./modules/rbac/)
- [Azure Container Registry](./modules/container-registry/)
- [Azure Kubernetes Service](./modules/kubernetes/)
- [Azure Database for PostgreSQL](./modules/postgresql/)
- [Azure Key Vault](./modules/key-vault/)
- [Azure Blob Storage](./modules/blob-storage/)
- [Azure Storage](./modules/storage/)
- [Azure SQL](./modules/sql-database/)

While using [Terraform with LocalStack](https://docs.localstack.cloud/azure/integrations/terraform/), ensure that the provider is configured to point to the LocalStack endpoint:

```hcl
provider "azurerm" {
  features {}
  subscription_id = "00000000-0000-0000-0000-000000000000"
  metadata_host   = "localhost.localstack.cloud:4566"
}
```

#### Lab 2a - Web App

Provision a resource group, storage account, and Azure App Service web app using LocalStack.

```bash
cd examples/web-app

# Initialise Terraform
terraform init

# Preview the resources to be created
terraform plan

# Provision resources in LocalStack
terraform apply -auto-approve

# Destroy resources when done
terraform destroy -auto-approve
```

#### Lab 2b - Kubernetes (AKS)

Provision a resource group, AKS cluster, and optionally an Azure Container Registry using LocalStack.

```bash
cd examples/k8s

# Initialise Terraform
terraform init

# Preview the resources to be created
terraform plan

# Provision resources in LocalStack
terraform apply -auto-approve

# Provision with Container Registry enabled
terraform apply -auto-approve -var="enable_container_registry=true"

# Destroy resources when done
terraform destroy -auto-approve
```

## Post-lab

Clean environment using Docker Compose:

```bash
# Stop and remove containers, networks, volumes, and images created by
docker-compose down

docker image prune --all --force
docker system prune --all --force
rm -fr volume
```

or using Docker CLI:

```bash
docker stop $(docker ps -q --filter ancestor=localstack/localstack-azure-alpha)

docker image prune --all --force
docker system prune --all --force
```

## Links

* [LocalStack Cloud](https://app.localstack.cloud/)
* [LocalStack for Azure](https://azure.localstack.cloud/introduction/)
* [LocalStack CLI](https://docs.localstack.cloud/aws/getting-started/installation/#localstack-cli)
* [azlocal](https://pypi.org/project/azlocal/)
* [Docker Image - LocalStack Azure Alpha](https://hub.docker.com/r/localstack/localstack-azure-alpha)
* [Docker Desktop](https://docs.docker.com/desktop/)
* [Docker Compose](https://docs.docker.com/compose/)
* Azure emulator tools:
  * [Topaz - Local Azure environment emulation for development](https://github.com/TheCloudTheory/Topaz)
  * [Azure Cosmos DB Emulator Docker Container](https://github.com/Azure/azure-cosmos-db-emulator-docker)
  * [Azure Event Hubs Emulator Installer](https://github.com/Azure/azure-event-hubs-emulator-installer)
  * [Azure Functions Core Tools](https://github.com/Azure/azure-functions-core-tools)
  * [Azurite - Azure Storage Emulator](https://github.com/Azure/Azurite)