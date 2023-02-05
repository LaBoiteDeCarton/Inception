sed -i "/s/DOMAINE_NAME/$DOMAINE_NAME/g" /etc/nginx/nginx.conf
nginx -g daemon off;