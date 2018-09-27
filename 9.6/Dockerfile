FROM postgres:9.6-alpine
MAINTAINER djin

COPY localtime /etc/localtime
COPY crontab_dump /etc/cron.d/crontab_dump
COPY pg_dump.sh /var/lib/postgresql
RUN crontab /etc/cron.d/crontab_dump \
&& chown postgres:postgres /var/lib/postgresql/pg_dump.sh \
&& chmod +x /var/lib/postgresql/pg_dump.sh \
&& ln -sf /var/lib/postgresql/pg_dump.sh /usr/local/bin/pg_dump.sh \
&& sed -i '/TODO/i\crond' /usr/local/bin/docker-entrypoint.sh \
&& sed -i '/exec "\$@"/i\sed -i "s/{db}/\$DBBACK/g" \/var\/lib\/postgresql\/pg_dump\.sh' /usr/local/bin/docker-entrypoint.sh \
&& sed -i '/exec "\$@"/i\mkdir \/var\/lib\/postgresql\/data\/backup || true' /usr/local/bin/docker-entrypoint.sh \
&& sed -i '/exec "\$@"/i\sed -i "s\/\#log_min_duration_statement = -1\/log_min_duration_statement = 100\/g" \/var\/lib\/postgresql\/data\/postgresql\.conf' /usr/local/bin/docker-entrypoint.sh
