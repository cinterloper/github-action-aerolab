FROM ubuntu:22.04
RUN apt -y update &&  \
    apt -y install ca-certificates wget unzip

WORKDIR /opt
RUN wget https://github.com/aerospike/aerolab/releases/download/6.1.0/aerolab-linux-amd64-6.1.0.zip &&\
    unzip aerolab-linux-amd64-6.1.0.zip -d aerolab/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]