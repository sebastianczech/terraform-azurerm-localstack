# Terraform modules for provisioning resource in Azure LocalStack

## Usage

Setup environment:

```bash
export LOCALSTACK_AUTH_TOKEN=<your_auth_token>
docker-compose up
```

Clean environment:

```bash
docker-compose down

docker image prune --all --force
docker system prune --all --force
rm -fr volume
```

## Links

* [LocalStack Cloud](https://app.localstack.cloud/)
* [LocalStack for Azure](https://azure.localstack.cloud/introduction/)
* [Docker Desktop](https://docs.docker.com/desktop/)
* [Docker Compose](https://docs.docker.com/compose/)
