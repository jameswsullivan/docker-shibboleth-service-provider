## Quick Start

1. Clone repository: `git clone https://github.com/jameswsullivan/docker-shibboleth-service-provider.git`
2. Customize the config files in the `configs` folder to according to your setup.
3. `docker compose up -d`

## Customizations

- If SSL is not offloaded elsewhere, mount certificate files to `/etc/ssl/certs` and enable it in `000-default.conf`.
- Run `/opt/shibboleth/generate-cert.sh` inside the container to generate Shibboleth's signing and encrypt keys.
- If your Service Provider is behind a reverse proxy, `consistentAddress="false"` should be set in the `Sessions` section in `shibboleth2.xml`.
- Configure your IdP and MetadataProvider inforamtion under `SSO` and `MetadataProvider`  sections in `shibboleth2.xml`.






