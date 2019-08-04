FROM debian:10-slim
LABEL maintainer="Sanjeevan Ambalavanar <sanjeevan@pureparadox.com>"
COPY ./boot.sh /sbin/boot.sh

RUN DEBIAN_FRONTEND=noninteractive; \  
    apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    curl \
    htop \
    vim \
    runit && \
    useradd -d /home/user-service -s /bin/sh -u 2000 user-service && \
    mkdir /home/user-service && \
    chown user-service:user-service /home/user-service && \
    chmod +x /sbin/boot.sh && \
    mkdir /etc/run_once && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# sample service
#COPY ./example.init /etc/service/example/run
#COPY ./example-service.sh /root/example-service.sh
#
#RUN chmod +x /etc/service/example/run && \
#    chmod +x /root/example-service.sh

CMD [ "/sbin/boot.sh" ]




