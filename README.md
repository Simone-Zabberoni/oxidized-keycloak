# oxidized-keycloak

Oxidized with Keycloak authentication - pre-provisioned compose stack

## TL; DR

Fire up `docker-compose up -d`, wait a few minutes then log in to http://oxidized.my.domain (add it to your hosts file!) with `admin/password`:

![oxidized-screenshot.png](https://raw.githubusercontent.com/Simone-Zabberoni/oxidized-keycloak/master/screenshots/oxidized-screenshot.png)

To add more accounts log in to http://keycloak.my.domain (add it to your hosts file!) with `admin/password`:

![oxidized-screenshot.png](https://raw.githubusercontent.com/Simone-Zabberoni/oxidized-keycloak/master/screenshots/keycloak-screenshot.png)

## Details

Oxidized is a great tool for switch configuration backup, but the web frontend lacks authentication.
Keycloak is used as authentication backend and the gatekeeper is used to authenticate the access to Oxidized

The compose file contains all the service structure, mostly parametric.
The .env file contains all of the settings, including the reverse proxy hostnames and Keycloak client urls and security keys.

## Infrastructure details

![oxidized-keycloak-infra.png](https://raw.githubusercontent.com/Simone-Zabberoni/oxidized-keycloak/master/screenshots/oxidized-keycloak-infra.png)

### Oxidized - custom image

The official image has no `router.db` file: when launched, it loops until created.
The provided image `szabberoni/oxidized` has a working config and a sample `router.db`, see the `oxidized` directory.

### Keycloak - custom image

The official image has a master realm and is emtpy, ready to be configured.
The provided image `szabberoni/keycloak` has a json realm file which is imported at boot and includes a custom Realm with a custom Client with a single admin account.

To customize the image before running the stack:

- modify the `OxidizedRealm.json` to suit your needs
- build the image with `./build.sh latest` or by hand
- modify the `.env` file accordingly (mind the discovery url, secret etc)
- run the stack with `docker-compose up -d`

**Important**: the realm file is imported only once, you can modify the realm afterwards only via the web interface
