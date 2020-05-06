#!/bin/bash

# if nginx config folder on /config doesnt exists then
# copy nginx config defaults from container
if [ ! -d /config/nginx/config ]; then
	mkdir -p /config/nginx/config
	cp /etc/nginx-backup/* /config/nginx/config/
fi

# soft link back to container
mkdir -p /etc/nginx
ln -fs /config/nginx/config/* /etc/nginx

# if nginx website folder on /config doesnt exists then
# copy nginx website defaults from container
if [ ! -d /config/nginx/html ]; then
	mkdir -p /config/nginx/html
	cp /usr/share/nginx/html-backup/* /config/nginx/html/
fi

# soft link back to container
mkdir -p /usr/share/nginx/html
ln -fs /config/nginx/html/* /usr/share/nginx/html

# run nginx non-daemonised
nginx
