#!/bin/bash
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u  geethadoclearn -p $DOCKER_PASSWORD
    docker tag test geethadoclearn/dev
    docker push  geethadoclearn/dev

elif [[ $GIT_BRANCH == "origin/main" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u  geethadoclearn -p $DOCKER_PASSWORD
    docker tag test  geethadoclearn/prod 
    docker push  geethadoclearn/prod
fi
