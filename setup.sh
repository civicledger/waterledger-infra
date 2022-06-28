#!/bin/sh
RED='\033[0;31m'
GRAY='\033[1;30m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'
applicationName="Water Ledger"
apiRepo=git@github.com:civicledger/wat-adonis-api.git
dashboardRepo=git@github.com:civicledger/waterledger-dashboard.git
admin2Repo=git@github.com:civicledger/waterledger-admin2.git
contractsRepo=git@github.com:civicledger/waterledger-contracts.git

if [ -d "./api" ]
then
    echo -e "${YELLOW}API repo has already been cloned${NC}"
else
    echo -e "${CYAN}Cloning api repo${NC}"
    git clone $apiRepo api
    echo -e "${GREEN}API cloned${NC}"
fi

if [ -d "./dashboard" ]
then
    echo -e "${YELLOW}Dashboard repo has already been cloned${NC}"
else
    echo -e "${CYAN}Cloning dashboard repo${NC}"
    git clone $dashboardRepo dashboard
    echo -e "${GREEN}Dashboard repo cloned${NC}"
fi

if [ -d "./admin2" ]
then
    echo -e "${YELLOW}Admin2 repo has already been cloned${NC}"
else
    echo -e "${CYAN}Cloning admin2 repo${NC}"
    git clone $admin2Repo admin2
    echo -e "${GREEN}Admin2 repo cloned${NC}"
fi

if [ -d "./contracts" ]
then
    echo "${YELLOW}Smart Contracts repo has already been cloned${NC}"
else
    echo -e "${CYAN}Cloning smart contracts repo${NC}"
    git clone $contractsRepo contract
    echo -e "${GREEN}Smart contracts repo cloned${NC}"
fi

echo -e "${GREEN}${applicationName}${NC} should now be set up. Run ${GRAY}docker-compose up${NC} to launch application."