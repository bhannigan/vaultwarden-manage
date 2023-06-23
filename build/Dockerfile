FROM bhannigan/baseimage

RUN apt-get update \
 && apt-get upgrade \
 && apt-get install -y sqlite3 \
 && apt-get clean

COPY https://github.com/bhannigan/vaultwarden-backup/src/vaultwarden-backup.sh /
COPY https://github.com/bhannigan/vaultwarden-backup/src/vaultwarden-restore.sh /

ENTRYPOINT [ "/vw-admin" ]
