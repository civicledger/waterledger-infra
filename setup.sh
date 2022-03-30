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
infraRepo=git@github.com:civicledger/waterledger-infra.git

if [ ! -z "$infraRepo" ]
then
    if [ -d "./infra" ]
    then
        echo "${YELLOW}Infra repo has already been cloned${NC}"
    else
        echo "Cloning infrastructure repo"
        git clone $infraRepo infra
        cp infra/.env.example ./.env
        cp infra/docker-compose.yml ./docker-compose.yml
        
        for i in {1..2}
        do 
            random=$(cat /dev/urandom | env LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
            sed -i '' "s|UNIQUE_VALUE_$i|$random|" docker-compose.yml
        done
        echo "${GREEN}Infrastructure repo cloned${NC}"
    fi
else
    echo "No infrastructure repo found"
fi


if [ ! -z "$apiRepo" ]
then
    if [ -d "./api" ]
    then
        echo "${YELLOW}API repo has already been cloned${NC}"
    else
        echo "Cloning api repo"
        git clone $apiRepo api
        echo "${GREEN}API cloned${NC}"
    fi
else
    echo "No API repo found"
fi

if [ ! -z "$dashboardRepo" ]
then
    if [ -d "./dashboard" ]
    then
        echo "${YELLOW}Dashboard repo has already been cloned${NC}"
    else
        echo "Cloning dashboard repo"
        git clone $dashboardRepo dashboard
        echo "${GREEN}Dashboard repo cloned${NC}"
    fi
else
    echo "No dashboard repo found"
fi


if [ ! -z "$adminRepo" ]
then
    if [ -d "./admin" ]
    then
        echo "${YELLOW}Admin repo has already been cloned${NC}"
    else
        echo "Cloning admin repo"
        git clone $adminRepo admin
        echo -e "${GREEN}Admin repo cloned${NC}"
    fi
else
    echo "No admin repo found"
fi

echo "${GREEN}${applicationName}${NC} should now be set up. Run ${GRAY}docker-compose up${NC} to launch application."