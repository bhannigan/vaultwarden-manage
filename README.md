# vaultwarden-manage
alternative vaultwarden stack for use when recovering passwords


CONTAINER=vaultwarden && docker-compose run -v ${CONTAINER}_data:/src /volume1/backup/${CONTAINER}:/dst vaultwarden-manage backup 
CONTAINER=vaultwarden-test BACKUP=VAUdocker-compose run -v ${
