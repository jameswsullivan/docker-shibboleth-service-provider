#!/bin/bash

echo "###### Begin initialization ... ######"
echo

# Disable modules:
a2dismod mpm_prefork

# Enable modules:
a2enmod proxy
a2enmod proxy_http
a2enmod rewrite
a2enmod headers
a2enmod ssl
a2enmod http2
a2enmod mpm_event
a2enmod status
a2enmod remoteip

# Link shib files:
ln -s /opt/shibboleth/shibboleth2.xml /etc/shibboleth/shibboleth2.xml
ln -s /opt/shibboleth/attribute-map.xml /etc/shibboleth/attribute-map.xml

ln -s /opt/shibboleth/sp-signing-key.pem /etc/shibboleth/sp-signing-key.pem
ln -s /opt/shibboleth/sp-signing-cert.pem /etc/shibboleth/sp-signing-cert.pem
ln -s /opt/shibboleth/sp-encrypt-key.pem /etc/shibboleth/sp-encrypt-key.pem
ln -s /opt/shibboleth/sp-encrypt-cert.pem /etc/shibboleth/sp-encrypt-cert.pem

# Link apache virtual host file:
ln -s /opt/shibboleth/000-default.conf /etc/apache2/sites-available/000-default.conf

# Start shibd service:
service shibd start

echo
echo "###### End initialization ... ######"
echo

echo "###### Run apache in foreground ... ######"
echo

# Start apache in foreground:
exec apache2ctl -D FOREGROUND


