#!/usr/bin/env bash

# Install Nginx if not already installed
if ! command -v nginx &> /dev/null; then
    apt-get update
    apt-get -y install nginx
fi

# Create necessary directories if they don't exist
mkdir -p /data/web_static/releases/test /data/web_static/shared

# Create a fake HTML file
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html

# Create or recreate symbolic link
if [ -L /data/web_static/current ]; then
    rm /data/web_static/current
fi
ln -sf /data/web_static/releases/test/ /data/web_static/current

# Give ownership of the /data/ folder to the ubuntu user and group recursively
chown -R ubuntu:ubuntu /data/

# Update Nginx configuration
config_file="/etc/nginx/sites-available/default"
nginx_config="server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location /hbnb_static {
        alias /data/web_static/current/;
    }
}"
echo "$nginx_config" | tee "$config_file" > /dev/null

# Restart Nginx
sudo service nginx restart

exit 0
