FROM asusk7m550/ius-centos:latest
MAINTAINER Jasper Aikema <jaikema@it-ernity.nl>

# Update base image
RUN yum -y update && yum clean all

RUN yum -y install php71u-fpm

COPY files/php-fpm.conf /etc/php-fpm.d/www.conf
RUN mkdir -p /usr/share/nginx
COPY html /usr/share/nginx/html


EXPOSE 9000

# Start the agent
CMD /usr/sbin/php-fpm --nodaemonize
