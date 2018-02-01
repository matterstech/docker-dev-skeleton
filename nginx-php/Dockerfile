FROM nginx:1.13-alpine
COPY ./config /tmp
RUN mv /tmp/site.conf /etc/nginx/conf.d/default.conf \
 && mv /tmp/entrypoint.sh /root/entrypoint.sh \
 && apk add --no-cache tzdata

ENV PHP_ADDRESS "127.0.0.1"
STOPSIGNAL SIGTERM

ENTRYPOINT ["/bin/sh","/root/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
