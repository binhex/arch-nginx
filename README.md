# Application

[NGINX](https://www.nginx.com/)

## Description

NGINX is open source software for web serving, reverse proxying, caching, load
balancing, media streaming, and more. It started out as a web server designed
for maximum performance and stability. In addition to its HTTP server
capabilities, NGINX can also function as a proxy server for email (IMAP, POP3,
and SMTP) and a reverse proxy and load balancer for HTTP, TCP, and UDP servers.

## Build notes

Latest GitHub master commit.

## Usage

```bash
docker run -d \
    --name=<container name> \
    -v <path for config files>:/config \
    -v /etc/localtime:/etc/localtime:ro \
    -p <host port for http>:8080 \
    -p <host port for https>:8443 \
    -e UMASK=<umask for created files> \
    -e PUID=<uid for user> \
    -e PGID=<gid for user> \
    binhex/arch-nginx
```

Please replace all user variables in the above command defined by <> with the
correct values.

## Access application

Command line only via:

```docker exec -it <container name> bash```

## Example

```bash
docker run -d \
    --name=nginx \
    -v /apps/docker/nginx:/config \
    -v /etc/localtime:/etc/localtime:ro \
    -p 8080:8080 \
    -p 8443:8443 \
    -e UMASK=000 \
    -e PUID=0 \
    -e PGID=0 \
    binhex/arch-nginx
```

## Notes

User ID (PUID) and Group ID (PGID) can be found by issuing the following command
for the user you want to run the container as:-

```bash
id <username>
```

___
If you appreciate my work, then please consider buying me a beer  :D

[![PayPal donation](https://www.paypal.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MM5E27UX6AUU4)

[Documentation](https://github.com/binhex/documentation) | [Support forum](https://forums.unraid.net/topic/92101-support-binhex-nginx/)
