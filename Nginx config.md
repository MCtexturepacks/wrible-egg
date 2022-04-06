server {
  listen 80;
  server_name [DOMAIN YOU WANT TO USE];
  return 301 https://$server_name$request_uri;
}
server {
  listen 443 ssl http2;

  server_name [DOMAIN YOU WANT TO USE];
  ssl_certificate /etc/letsencrypt/live/[DOMAIN YOU WANT TO USE]/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/[DOMAIN YOU WANT TO USE]/privkey.pem;
  ssl_session_cache shared:SSL:10m;
  ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers  HIGH:!aNULL:!MD5;
  ssl_prefer_server_ciphers on;

  location / {
    proxy_pass http://[PTERODACTYL CONTAINER DOMAIN]/;
    proxy_buffering off;
    proxy_set_header X-Real-IP $remote_addr;
  }
  
  location /afkwspath {
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_pass "http://[PTERODACTYL CONTAINER DOMAIN]/afkwspath";
  }
}
