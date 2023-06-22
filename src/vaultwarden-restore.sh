#!/bin/sh

  if [ -z "${CONTAINER}" ]; then
    echo CONTAINER environment not set
    exit 1
  fi

  if [ -z "${TIMESTAMP}" ]; then
    echo TIMESTAMP environment not set
    exit 1
  fi

  BACKUP_DIR=/backup
  DATA_DIR=/data
  TIMESTAMP=$1

# check backup file exists

  if [ ! -f ${BACKUP_DIR}/${CONTAINER}-${TIMESTAMP}.tgz ]; then
    echo
    echo no vaultwarden backup found for container \'${CONTAINER}\' for timestamp \'${TIMESTAMP}\'.
    echo
    echo available backups are:
    
    for ITEM in `find ${BACKUP_DIR} -name '${CONTAINER}-*.tgz' `; do
      echo \ \ \ `basename ${ITEM}`
    done
    exit 1
  fi

  cd ${DATA_DIR}

# remove previous files

  if [ -e "db.sqlite3" ]; then
    echo
    echo /data contains an existing sqlite database. handle this manually.
    exit 1
  fi

# restore backup files

  echo processing file ${BACKUP_DIR}/${CONTAINER}-${TIMESTAMP}.tgz

  tar xzf ${BACKUP_DIR}/${CONTAINER}-${TIMESTAMP}.tgz
  mv db-${TIMESTAMP}.sqlite3 db.sqlite3

  exit 0
