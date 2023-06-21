#!/bin/sh

  CONTAINER=vaultwarden
  TIMESTAMP=$(date '+%Y%m%d-%H%M')
  VAULTWARDEN_HOME=/volume1/docker/vaultwarden
  VAULTWARDEN_BACKUP=/volume1/backup/vaultwarden
  BACKUP_FILE=${VAULTWARDEN_BACKUP}/vaultwarden-${TIMESTAMP}.tgz


  # check output directory exists

  if [ ! -d ${VAULTWARDEN_BACKUP} ]; then
    echo output directory \'${VAULTWARDEN_BACKUP}\' does not exist
        exit 1
  fi

  # get the container ID

  ID=`docker ps | grep ${CONTAINER} | cut -d' ' -f1`

  # cd to container home

  cd ${VAULTWARDEN_HOME}

  if [ $PWD != "${VAULTWARDEN_HOME}" ]; then
    echo failed to change directory to '${VAULTWARDEN_HOME}'
        exit 1
  fi

  # stop the container

  # echo stopping container \'${CONTAINER}\'

  docker container stop --time 30 ${CONTAINER} >& /dev/null

  STATUS=`docker ps | grep ${CONTAINER}`

  if [ ${STATUS} ]; then
    echo failed to stop container \'${CONTAINER}\'. \$docker ps output was:
        echo ${STATUS}
        exit 1
  fi

  # backup the sqlite3 database

  sqlite3 data/db.sqlite3 "VACUUM INTO './db-${TIMESTAMP}.sqlite3'"

  # copy database backup and attachments to backup directory


  tar cfz ${BACKUP_FILE} data/attachments db-${TIMESTAMP}.sqlite3

  if [ ! -f ${BACKUP_FILE} ]; then
    echo failed to create backup file \'${BACKUP_FILE}\'
  fi

  # remove backup copy of database

  rm db-${TIMESTAMP}.sqlite3

  # restart container

  # echo starting container \'${CONTAINER}\'

  docker container start ${CONTAINER} >& /dev/null

  STATUS=`docker ps | grep ${CONTAINER}`

  if [ "${STATUS}" == "" ]; then
    echo failed to start container '${CONTAINER}'.
        exit 1
  fi

  exit 0
