# vaultwarden-manage
administration image for self-hosted vaultwarden containers<br>

## BUILD
    git clone https://github.com/bhannigan/vaultwarden-manage.git
    cd vaultwarden-manage
    sudo docker build --tag vaultwarden-manage .


## USE (backup)
    CONTAINER=vaultwarden
    sudo docker run -rm -it -v ${CONTAINER}_data:/src -v /volume1/backup/${CONTAINER}:/dst vaultwarden-manage backup

## USE (restore)
not implemented yet<br>

## USE (export)
not implemented yet<br>

## ASSUMPTIONS
- the persistend volume associated with vaultwarden container X is called X_data<br>
- there is a directory created under /volume1/backups/X<br>
