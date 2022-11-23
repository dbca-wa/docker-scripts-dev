#!/bin/bash

DATE_VAR=$(date +%Y.%m.%d.%H.%M%S)
GIT_REPO=$1
GIT_BRANCH=$2
DOCKER_REPO=$3
docker login

if [ -d "$HOME/gittmp" ]
then
   rm -rf $HOME/gittmp
fi

if test -z "$GIT_BRANCH"
then
  echo "Running git clone $GIT_REPO gittmp";
  cd $HOME;
  git clone $GIT_REPO "gittmp";
else
   echo "Running git clone $GIT_REPO -b $GIT_BRANCH gittmp";
   cd $HOME;
   git clone $GIT_REPO -b $GIT_BRANCH "gittmp";
fi

if [ -f "$HOME/gittmp/docker_repo_name" ]; then
     DOCKER_REPO=$(<$HOME/gittmp/docker_repo_name)
     echo $DOCKER_REPO;
     cd $HOME/gittmp/
     docker image build  --tag  dbcawa/$DOCKER_REPO:latest . ;
     docker tag dbcawa/$DOCKER_REPO:latest dbcawa/$DOCKER_REPO:$DATE_VAR;
     docker image push dbcawa/$DOCKER_REPO:latest;
     docker image push dbcawa/$DOCKER_REPO:$DATE_VAR;

else
   echo "Docker Repo Name '$HOME/gittmp/docker_repo_name' file does not exist";
   exit 1
fi
