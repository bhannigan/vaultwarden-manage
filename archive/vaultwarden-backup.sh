#!/bin/sh

  if [ -z "${CONTAINER}" ]; then
    echo CONTAINER environment not set
    exit 1
  fi
  
  TIMESTAMP=$(date '+%Y%m%d-%H%M')
  VAULTWARDEN_DATA=/data
  VAULTWARDEN_BACKUP=/backup
  BACKUP_FILE=${VAULTWARDEN_BACKUP}/${CONTAINER}-${TIMESTAMP}.tgz

  # check output directory exists

  if [ ! -d ${VAULTWARDEN_BACKUP} ]; then
    echo output directory \'${VAULTWARDEN_BACKUP}\' does not exist
    exit 1
  fi

  cd /data

  # backup the sqlite3 database

  sqlite3 db.sqlite3 "VACUUM INTO './db-${TIMESTAMP}.sqlite3'"

  # copy database backup and attachments to backup directory

  tar cfz ${BACKUP_FILE} attachments db-${TIMESTAMP}.sqlite3

  if [ ! -f ${BACKUP_FILE} ]; then
    echo failed to create backup file \'${BACKUP_FILE}\'
  fi

  # remove backup copy of database

  rm db-${TIMESTAMP}.sqlite3

  exit 0
