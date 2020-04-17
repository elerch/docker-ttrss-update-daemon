# We'll use the same image that we use for php-fpm. That is not a minimal
# image, but realistically you'll generally have the two images on the same
# machine
FROM docker.lerch.org/php-fpm-ttrss:1

COPY docker-entrypoint /
# ttrss pretends php can be somewhere else, but really it must be at
# /usr/bin/php
RUN ln -s /usr/local/bin/php /usr/bin/php

ENTRYPOINT ["/docker-entrypoint"]
USER www-data
