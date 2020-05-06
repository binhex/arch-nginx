#!/bin/bash

# if nginx config folder on /config doesnt exists then
# copy nginx config defaults from container
if [ ! -d /config/nginx ]; then
	mkdir -p /config/nginx
	cp /etc/nginx-backup/* /config/nginx/
fi

# soft link back to container
mkdir -p /etc/nginx
ln -s /config/nginx/* /etc/nginx

# if nginx website folder on /config doesnt exists then
# copy nginx website defaults from container
if [ ! -d /config/nginx/html ]; then
	mkdir -p /config/nginx/html
	cp /usr/share/nginx/html-backup/* /config/nginx/html/
fi

# soft link back to container
mkdir -p /usr/share/nginx/html
ln -s /config/nginx/html/* /usr/share/nginx/html

# run nginx non-daemonised
nginx
