ARG UBUNTU_VERSION=26.10

FROM ubuntu:{UBUNTU_VERSION}

ENV DEBIAN_FRONTEND="noninteractive"
ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"

# Install basic packages and set up timezone and locale:
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget nano curl unzip tzdata locales ca-certificates git iputils-ping && \
    apt-get upgrade ca-certificates -y && \
    ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Install apache and shibboleth:
RUN apt-get install -y apache2 apache2-utils libapache2-mod-shib && \
    mkdir /opt/shibboleth

RUN rm -f /etc/apache2/sites-available/* && \
    rm -f /etc/shibboleth/attribute-map.xml && \
    rm -f /etc/shibboleth/shibboleth2.xml

WORKDIR /opt/shibboleth

EXPOSE 80 443

