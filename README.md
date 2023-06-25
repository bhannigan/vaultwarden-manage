# vaultwarden-manage
alternative vaultwarden stack for use when recovering passwords

to build

git clone https://github.com/bhannigan/vaultwarden-manage.git
cd vaultwarden-manage
sudo docker build --tag vaultwarden-manage .

to use

CONTAINER=vaultwarden
sudo docker run -rm -it -v ${CONTAINER}_data:/src -v /volume1/backup/${CONTAINER}:/dst vaultwarden-manage backup

