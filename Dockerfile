FROM alpine:latest

COPY ./boot.sh /sbin/boot.sh

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories  && \
    apk --update upgrade && \
    apk add  \
    bash \
    curl \
    runit && \
    rm -rf /var/cache/apk/* && \
    adduser -h /home/user-service -s /bin/sh -D user-service -u 2000 && \
    chown user-service:user-service /home/user-service && \
    chmod +x /sbin/boot.sh && \
    mkdir /etc/run_once

# sample service
#COPY ./example.init /etc/service/example/run
#COPY ./example-service.sh /root/example-service.sh
#
#RUN chmod +x /etc/service/example/run && \
#    chmod +x /root/example-service.sh

CMD [ "/sbin/boot.sh" ]




