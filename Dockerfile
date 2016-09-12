FROM ubuntu:16.04
MAINTAINER Christian Harke <ch.harke@gmail.com>

RUN echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" > \
    /etc/apt/sources.list.d/100-ubnt.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50

# Install requirements
RUN apt-get update --quiet && \
    apt-get upgrade --quiet --yes && \
    apt-get install --quiet --yes \
        unifi

EXPOSE 8080/tcp 8443/tcp 8843/tcp 8880/tcp 3478/udp

WORKDIR /var/lib/unifi

ENTRYPOINT ["/usr/bin/java", "-Xmx1024M", "-jar", "/usr/lib/unifi/lib/ace.jar"]
CMD ["start"]
