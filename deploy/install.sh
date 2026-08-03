#!/bin/bash
# Run this once with sudo to finish the frab deploy:
#   sudo bash deploy/install.sh
#
# It: enables the needed Apache modules, installs the vhost and systemd
# unit that were prepared in this directory, starts the frab service, and
# obtains a Let's Encrypt certificate for scriptum.slobodnadomena.hr.
set -euo pipefail

APP_DIR="/home/stjepan/frab"
DOMAIN="scriptum.slobodnadomena.hr"
ADMIN_EMAIL="vrljicak.stjepan@gmail.com"

echo "== Enabling Apache modules =="
a2enmod proxy proxy_http headers

echo "== Installing vhost =="
cp "$APP_DIR/deploy/$DOMAIN.conf" "/etc/apache2/sites-available/$DOMAIN.conf"
a2ensite "$DOMAIN.conf"
apache2ctl configtest
systemctl reload apache2

echo "== Installing systemd service =="
cp "$APP_DIR/deploy/frab.service" /etc/systemd/system/frab.service
systemctl daemon-reload
systemctl enable --now frab
sleep 2
systemctl --no-pager status frab

echo "== Allowing Apache through the firewall (if ufw is active) =="
if command -v ufw >/dev/null && ufw status | grep -q "Status: active"; then
  ufw allow 'Apache Full' || true
fi

echo "== Installing certbot and obtaining a certificate =="
if ! command -v certbot >/dev/null; then
  apt-get update
  apt-get install -y certbot python3-certbot-apache
fi
certbot --apache -d "$DOMAIN" --redirect -m "$ADMIN_EMAIL" --agree-tos -n

echo "== Done =="
systemctl --no-pager status frab | head -5
echo "Visit: https://$DOMAIN"
