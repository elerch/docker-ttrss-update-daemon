TT-RSS Update Daemon Image
==========================

This image is based on [docker-php-fpm-ttrs](https://git.lerch.org/lobo/docker-php-fpm-ttrss),
which in turn is based on the [official php image](https://hub.docker.com/_/php)
[fpm-alpine variant](https://hub.docker.com/layers/php/library/php/fpm-alpine3.11/images/sha256-a50b1044549fd42508067a5876bbde12c030f317974e77ce6c308ea711cb45e4?context=explore).

This image could be lighter, basing it directly on alpine with additions for
php and mysql, but this image is based on the above chain mostly because it
would be most common to run the updater on the same machine as the fpm module.
When in that configuration, the only actual additional disk space is for the
shell script entrypoint.

Running the image
-----------------

The shell script will honor an environment variable called "MULTIPROCESS".
When this variable is set to 1, it will run the update_daemon2.php script.
This spawns multiple processes and therefore consumes more memory, which
may or may not be a problem if running a full tt-rss stack on a 512MB RAM
instance for example.

I have noticed that the update script will die from time to time, so it's
best to run with a restart policy.

```sh
docker run -d                    \
  --restart=always               \
  -e MULTIPROCESS=0              \
  -v host/ttrss/path:/var/tt-rss \
  docker.lerch.org/ttrss-update-daemon:1
```
