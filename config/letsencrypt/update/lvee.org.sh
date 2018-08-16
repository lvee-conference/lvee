#!/bin/sh

/home/lvee/letsencrypt/certbot/certbot-auto certonly \
    --standalone \
    --email info@lvee.org \
    --renew-by-default \
    --rsa-key-size 4096 \
    -d lvee.org \
    -d www.lvee.org \
    -d mail.lvee.org \
    -d lists.lvee.org \
    -d summer.lvee.org \
    -d winter.lvee.org \
    --pre-hook 'systemctl stop nginx' \
    --post-hook 'systemctl start nginx'
