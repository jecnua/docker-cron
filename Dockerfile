FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get install -y man cron nano

RUN echo "* *    * * *   root    echo 'test' > /proc/1/fd/1 2> /proc/1/fd/2" >> /etc/crontab

# Run the command on container startup
CMD ["cron", "-f"]
