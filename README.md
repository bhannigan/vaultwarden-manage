# vaultwarden-manage
administration image for self-hosted vaultwarden containers<br>

## BUILD
    git clone https://github.com/bhannigan/vaultwarden-manage.git
    cd vaultwarden-manage
    sudo docker build --tag vaultwarden-manage .

## USE (backup)
    CONTAINER=*name*
    sudo docker run -rm -it -v ${CONTAINER}_data:/src -v /volume1/backup/${CONTAINER}:/dst vaultwarden-manage backup

**  assumptions **
- the persistend volume associated with vaultwarden container X is called X_data<br>
- there is a directory created under /volume1/backups/X<br>
- the above script will be scheduled

## USE (restore)
not implemented yet<br>

## USE (export)
not implemented yet<br>

# TODO
- migrate to portainer based image deployment once it's known how


