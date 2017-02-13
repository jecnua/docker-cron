FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get install -y man cron nano
COPY config/crontab /etc/crontab

RUN echo "* *    * * *   root    echo 'test' > $FD_STDOUT 2> $FD_STDERR" >> /etc/crontab

# Run the command on container startup
CMD ["cron", "-f"]
