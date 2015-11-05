FROM ubuntu:14.04
MAINTAINER Qida Sun <sunqida@foxmail.com>

ENV USER ftpadmin
ENV PASS changeme
ENV USER_UID 1000

RUN apt-get update && \
    apt-get install -y openssh-server mcrypt && \
    mkdir /var/run/sshd && chmod 0755 /var/run/sshd

ADD start.sh /usr/local/bin/start.sh
ADD sshd_config /etc/ssh/sshd_config

VOLUME ["/data"]
EXPOSE 22

RUN chown 777 /data

ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]
