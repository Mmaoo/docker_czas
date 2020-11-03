FROM alpine:latest
LABEL maintainer="Marcin Choina"
ENV PHPVERSION=7
RUN apk add --update apache2 php${PHPVERSION}-apache2 php${PHPVERSION} && \
rm -rf /var/cache/apk/* 
ADD source.tar.gz /var/www/localhost/htdocs/
RUN ls -la /var/www/localhost/htdocs/
RUN chmod 755 /var/www/localhost/htdocs/index.html
EXPOSE 80/tcp
ENTRYPOINT ["httpd"]
CMD ["-D","FOREGROUND"]
