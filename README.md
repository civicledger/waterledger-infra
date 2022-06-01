# Infrastructure setup

## Software Installs

Install Docker to get the `docker-compose` command and the interface to use. Install Ganache for local testing of the smart contracts.

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
DEMO_PASSWORD=
```

`PROVIDER_URL` will typically be an Infura project URL such as `wss://goerli.infura.io/ws/v3/<long hash>`. Use of a `wss` is required, and we recommend Görli testnet because it's possible to get test eth for it. Use of Ganache is strongly discouraged except for testing. You need to create an account on Infura to use its url.

`PRIVATE_KEY` is the private key of a valid account to use for deployments and management. Note that the account used must have access to test Ether.

`ADMIN_PASSWORD` can be any memorable string to use in the seeder to create accounts, typically it's just something like `civic123`.

`DEMO_PASSWORD` can be any memorable string to use in the seeder to create demo accounts. It is used by the Colorado Scheme, typically it's just something like `test123`.

## Migrations and Seeding

In order to build the database structure and populate it, you need to run the seed and migration commands.

To run commands in Docker, go to the Docker interface and select the container, and you will see a `CLI` button. Click that to open a Command Line in the running container.

Run the following commands:

```
node ace migration:run
node ace db:seed -i
```

Select `0-UserPermissions.ts`, `1-AdminUser.ts`, `4-Contracts`, `ColoradoScheme.ts`.
