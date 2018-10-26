FROM nginx:stable-alpine

RUN apk update && \
    apk add apache2-utils 
    

ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD etc/local-8000-service.conf /etc/nginx/conf.d/local-8000-service.conf
ADD etc/public-443-service.conf /etc/nginx/conf.d/public-443-service.conf
ADD etc/app-service.srv /etc/nginx/conf.d/app-service.srv
ADD etc/alastria-service.srv /etc/nginx/conf.d/alastria-service.srv
ADD etc/graylog-service.srv /etc/nginx/conf.d/graylog-service.srv


ADD script/entrypoint.sh /entrypoint.sh
ADD script/le.sh /le.sh

RUN \
 rm /etc/nginx/conf.d/default.conf && \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 apk add  --update certbot tzdata openssl && \
 rm -rf /var/cache/apk/*

CMD ["/entrypoint.sh"]
