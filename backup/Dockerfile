FROM debian:bookworm

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y cron rsync postgresql-client-15

ADD crontab /etc/cron.d/backup-cron
ADD backup.sh /backup.sh

RUN chmod 0644 /etc/cron.d/backup-cron && \
    crontab /etc/cron.d/backup-cron && \
    touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log