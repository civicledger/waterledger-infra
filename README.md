# Infrastructure setup

## Docker Compose and repository setup

Set up all repositories for the application, and setup docker-compose to build and run the application.

> :warning: This infrastructure setup is intended to facilitate **local development** and is not intended for production builds

First make sure you are in the directory where you would like to set up the application, such as a `Sites` or `Code` directory.

```
git clone git@github.com:civicledger/waterledger-infra.git waterledger
cd waterledger
mv .env.example .env
bash setup.sh
```

## Environment Variables

Before running the docker-compose up, the following environment variables in .env file need to be set.

```
PROVIDER_URL=
PRIVATE_KEY=
ADMIN_PASSWORD=
```

`PROVIDER_URL` will typically be an Infura project URL such as `wss://goerli.infura.io/ws/v3/6fed8d7d88e1460fa45cef9269218615`. Use of a `wss` is required, and we recommend Görli testnet because it's possible to get test eth for it. Use of Ganache is strongly discouraged except for testing.

`PRIVATE_KEY` is the private key of a valid account to use for deployments and management. Note that the account used must have access to test Ether.

`ADMIN_PASSWORD` can be any memorable string to use in the seeder to create accounts, typically it's just something like `civic123`.
