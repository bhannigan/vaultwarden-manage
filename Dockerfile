  FROM debian
  ENV TZ="America/Edmonton"
  
  ARG DEBIAN_FRONTEND=noninteractive

  RUN apt-get update \
#   && apt-get upgrade -y \
   && apt-get install -y --no-install-recommends sqlite3 tzdata \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*

  COPY src/vaultwarden-manage /
  RUN ["chmod", "555", "/vaultwarden-manage"]
  
  ENTRYPOINT [ "/vaultwarden-manage" ]
