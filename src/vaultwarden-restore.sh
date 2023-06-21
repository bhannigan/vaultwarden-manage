#!/bin/sh

  CONTAINER=vaultwarden-backup
  BACKUP_DIR=/volume1/backup/vaultwarden
  HOME_DIR=/volume1/docker/vaultwarden-backup
  TIMESTAMP=$1

# check backup file exists

  if [ ! -f ${BACKUP_DIR}/vaultwarden-${TIMESTAMP}.tgz ]; then
        echo
        echo usage: vaultwarden-restore.sh YYYYMMDD-HHMM
        echo
    echo no vaultwarden-backup found for \'${TIMESTAMP}\'.
        echo
    echo available backups are:
    for ITEM in `find ${BACKUP_DIR} -name 'vaultwarden*.tgz' `; do
      echo \ \ \ `basename ${ITEM}`
    done
        exit 1
  fi

# get the container ID

  ID=`docker ps | grep ${CONTAINER} | cut -d' ' -f1`

# stop the container

  # echo stopping container \'${CONTAINER}\'

  docker container stop ${CONTAINER} >& /dev/null

  STATUS=`docker ps | grep ${CONTAINER}`

  if [ ${STATUS} ]; then
    echo failed to stop container \'${CONTAINER}\'. \$docker ps output was:
        echo ${STATUS}
        exit 1
  fi

# go to container home directory

  cd ${HOME_DIR}

  if [ "${PWD}" != "${HOME_DIR}" ]; then
    echo unable to switch to \'${HOME_DIR}\'
    exit 1
  fi

# remove previous files

  rm -rf data
  mkdir data && cd data

  if [ "${PWD}" != "${HOME_DIR}/data" ]; then
    echo unable to switch to \'${HOME_DIR}/data\'
    exit 1
  fi

# restore backup files

  echo processing file ${BACKUP_DIR}/vaultwarden-${TIMESTAMP}.tgz

  tar xzf ${BACKUP_DIR}/vaultwarden-${TIMESTAMP}.tgz
  mv db-${TIMESTAMP}.sqlite3 db.sqlite3


# restart container

  # echo starting container \'${CONTAINER}\'

  docker container start ${CONTAINER} >& /dev/null

  STATUS=`docker ps | grep ${CONTAINER}`

  if [ "${STATUS}" == "" ]; then
    echo failed to start container '${CONTAINER}'.
        exit 1
  fi

  exit 0
