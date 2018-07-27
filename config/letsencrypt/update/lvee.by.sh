#!/bin/sh

/home/lvee/letsencrypt/certbot/certbot-auto certonly \
    --standalone \
    --email info@lvee.org \
    --renew-by-default \
    --rsa-key-size 4096 \
    -d lvee.by \
    -d www.lvee.by \
    -d mail.lvee.by \
    -d lists.lvee.by \
    -d summer.lvee.by \
    -d winter.lvee.by \
    --pre-hook 'systemctl stop nginx' \
    --post-hook 'systemctl start nginx'
