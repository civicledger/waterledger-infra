#!/bin/sh
RED='\033[0;31m'
GRAY='\033[1;30m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
applicationName='Water Ledger'
apiRepo=git@github.com:civicledger/wat-adonis-api.git
dashboardRepo=git@github.com:civicledger/waterledger-dashboard.git
adminRepo=git@github.com:civicledger/waterledger-admin.git

if [ -d "./api" ]
then
    echo "${YELLOW}API repo has already been cloned${NC}"
else
    echo "Cloning api repo"
    git clone $apiRepo api
    echo "${GREEN}API cloned${NC}"
fi

if [ -d "./dashboard" ]
then
    echo "${YELLOW}Dashboard repo has already been cloned${NC}"
else
    echo "Cloning dashboard repo"
    git clone $dashboardRepo dashboard
    echo "${GREEN}Dashboard repo cloned${NC}"
fi

if [ -d "./admin" ]
then
    echo "${YELLOW}Admin repo has already been cloned${NC}"
else
    echo "Cloning admin repo"
    git clone $adminRepo admin
    echo -e "${GREEN}Admin repo cloned${NC}"
fi

echo "${GREEN}${applicationName}${NC} should now be set up. Run ${GRAY}docker-compose up${NC} to launch application."