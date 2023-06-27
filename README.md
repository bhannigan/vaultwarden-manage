# vaultwarden-manage
administration image for self-hosted vaultwarden containers<br>

## BUILD
**command line**

    git clone https://github.com/bhannigan/vaultwarden-manage.git
    cd vaultwarden-manage
    sudo docker build --tag vaultwarden-manage .

**portainer**

    images > build image
      name = vaultwarden-manage
      url = https://github.com/bhannigan/vaultwarden-manage.git
    
## USE (backup)
    CONTAINER=name
    docker run --rm -e CONTAINER=${CONTAINER} -v ${CONTAINER}_data:/src -v /volume1/backup/${CONTAINER}:/dst vaultwarden-manage backup

**assumptions**
- the persistend volume associated with vaultwarden container ***name*** is called ***name***_data<br>
- there is a directory created under /volume1/backups/***name***<br>
- the above script will be scheduled and run as root

## USE (restore)
not implemented yet<br>

## USE (export)
not implemented yet<br>



