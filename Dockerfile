FROM alpine:latest
ENV PHPVERSION 82

RUN apk add --update apache2 && \
    apk add --update php${PHPVERSION}-apache2 && \
    apk add --update php${PHPVERSION} && \
    git clone https://github.com/fabiofloresjr/aulagithub:/var/www/localhost/htdocs && \ 
    rm -rf /var/cache/apk/* && \
    rm -rf /var/www/localhost/htdocs/index.html && \
    echo "<?php phpinfo(); ?>" > /var/www/localhost/htdocs/index.php && \
    chmod 755 /var/www/localhost/htdocs/index.php

EXPOSE 80/tcp
ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]