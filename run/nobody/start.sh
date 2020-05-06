#!/bin/bash

# if nginx folder exists in container then rename
if [[ -d "/etc/nginx" && ! -L "/etc/nginx" ]]; then
	mv /etc/nginx /etc/nginx-backup 2>/dev/null || true
fi

# if nginx folder on /config doesnt exists then
# copy nginx config defaults from container
if [ ! -d /config/nginx ]; then
	mkdir -p /config/nginx
	cp /etc/nginx-backup/* /config/nginx/
fi

# soft link back to container
ln -s /config/nginx/ /etc/nginx

# run nginx daemonised
nginx ; cat
