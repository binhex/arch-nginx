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

# if nginx folder exists in container then rename
if [[ -d "/usr/share/nginx/html" && ! -L "/usr/share/nginx/html" ]]; then
	mv /usr/share/nginx/html-backup 2>/dev/null || true
fi

# if nginx folder on /config doesnt exists then
# copy nginx config defaults from container
if [ ! -d /config/nginx/html ]; then
	mkdir -p /config/nginx/html
	cp /usr/share/nginx/html-backup/* /config/nginx/html/
fi

# soft link back to container
ln -s /config/nginx/html/ /usr/share/nginx/html

# run nginx daemonised
nginx ; cat
