# Terraform modules for provisioning resource in Azure LocalStack

## Usage

Setup environment using Docker Compose:

```bash
export LOCALSTACK_AUTH_TOKEN=<your_auth_token>
docker-compose up
```

or using Docker CLI:

```bash
docker pull localstack/localstack-azure-alpha

docker run \
    --rm -it \
    -p 4566:4566 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/.localstack/volume:/var/lib/localstack \
    -e LOCALSTACK_AUTH_TOKEN=${LOCALSTACK_AUTH_TOKEN:?} \
    localstack/localstack-azure-alpha
```

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

# Clean up resources
az group delete --name MyResourceGroup --yes

# Stop interception and reset Azure CLI to default
azlocal stop_interception

# Check if Azure CLI is now pointing to the default Azure environment
az account show
```

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

## Modules

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