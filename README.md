# vaultwarden-manage
administration image for self-hosted vaultwarden containers

BUILD

  git clone https://github.com/bhannigan/vaultwarden-manage.git
  cd vaultwarden-manage
  sudo docker build --tag vaultwarden-manage .


USE (backup)

  CONTAINER=vaultwarden
  sudo docker run -rm -it -v ${CONTAINER}_data:/src -v /volume1/backup/${CONTAINER}:/dst vaultwarden-manage backup


- to use (restore)
  not implemented yet

- to use (export)
  not implemented yet


ASSUMPTIONS

  - the persistend volume associated with vaultwarden container X is called X_data
  - there is a directory created under /volume1/backups/X
