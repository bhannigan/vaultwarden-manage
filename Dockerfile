  FROM phusion/baseimage:jammy-1.0.1
  
  ARG DEBIAN_FRONTEND=noninteractive

  RUN apt-get update \
#   && apt-get upgrade -y \
   && apt-get install -y --no-install-recommends sqlite3 \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*

  ADD --chmod=544 src/vaultwarden-manage /
  
  ENTRYPOINT [ "/vaultwarden-manage" ]
