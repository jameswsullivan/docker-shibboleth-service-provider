#!/bin/bash

# Generate certificates:
echo "This script only needs to be run once during initial setup,"
echo "or whenever you need to renew/regenerate your certs ..."
echo

# Generate signing keys
echo "Generating signing keys ..."
echo

shib-keygen
mv /etc/shibboleth/sp-cert.pem /opt/shibboleth/sp-signing-cert.pem
mv /etc/shibboleth/sp-key.pem /opt/shibboleth/sp-signing-key.pem

echo "Signing keys generated ..."
echo

# Generate encryption keys
echo "Generating encryption keys ..."
echo

shib-keygen
mv /etc/shibboleth/sp-cert.pem /opt/shibboleth/sp-encrypt-cert.pem
mv /etc/shibboleth/sp-key.pem /opt/shibboleth/sp-encrypt-key.pem

echo "Encryption keys generated ..."
echo

echo "Listing key files ... "
echo

ls -al *.pem


