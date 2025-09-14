# Terraform modules for provisioning resource in Azure LocalStack

## Usage

Setup environment:

```bash
export LOCALSTACK_AUTH_TOKEN=<your_auth_token>
docker-compose up
```

Quickstart:
```bash
curl http://localhost:4566/_localstack/health

az account show
azlocal start_interception
az account show

az group create --name MyResourceGroup --location westeurope
az group list
az group show --name MyResourceGroup
az group delete --name MyResourceGroup --yes

azlocal stop_interception
az account show
```

Clean environment:

```bash
docker-compose down

docker image prune --all --force
docker system prune --all --force
rm -fr volume
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
