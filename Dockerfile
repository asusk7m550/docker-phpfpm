FROM       centos:latest
MAINTAINER Jasper Aikema <jaikema@it-ernity.nl>

# Update base image
RUN yum -y update && yum clean all

# Install EPEL
RUN yum -y install epel-release

# Install the ius repo
RUN rpm -ivh https://centos7.iuscommunity.org/ius-release.rpm

# Install the software
RUN yum -y install php71u-fpm

# Clenup after
RUN rm -rf /var/cache/yum

# Use custom configuration
COPY files/php-fpm.conf /etc/php-fpm.d/www.conf

# Expose the port
EXPOSE 9000

# Start the agent
CMD ["/usr/sbin/php-fpm", "--nodaemonize"]
