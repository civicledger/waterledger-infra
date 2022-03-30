# Infrastructure setup

## Docker Compose and repository setup

Set up all repositories for the application, and setup docker-compose to build and run the application.

```
mkdir waterledger
cd waterledger
curl -o setup.sh https://raw.githubusercontent.com/civicledger/waterledger-infra/main/setup.sh
bash setup.sh
```

Before running the docker-compose up, the following environment variables in .env file need to be set.

```
INFURA_PROJECT_ID=
PRIVATE_KEY=
DAML_JWT_SECRET=
```
