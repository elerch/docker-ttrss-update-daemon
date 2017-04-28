# We'd like a systemd init system that we likely already have on disk.
# Mariadb is using systemd and is based on debian:jessie so we'll go with that
FROM debian:jessie

RUN apt-get update && \
    apt-get install -qq php5-mysql php5-cli curl && \
    adduser --disabled-password --gecos "" ttrss && \
    mkdir /var/ttrss

WORKDIR /var/ttrss
USER ttrss
# container expects things at /var/tt-rss
CMD ["/usr/bin/php", "/var/ttrss/update_daemon2.php"]
