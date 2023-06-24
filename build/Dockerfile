  FROM phusion/baseimage:jammy-1.0.1

  ARG DEBIAN_FRONTEND=noninteractive

  RUN apt-get update \
   && apt-get upgrade -y \
   && apt-get install -y --no-install-recommends sqlite3 \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*

  COPY https://github.com/bhannigan/vaultwarden-backup/src/vaultwarden-backup.sh /
  COPY https://github.com/bhannigan/vaultwarden-backup/src/vaultwarden-restore.sh /

  ENTRYPOINT [ "/vaultwarden-manage.sh" ]
