FROM phusion/passenger-ruby22

# In China, set apt source to aliyun mirror.
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get dist-upgrade -y

# Install Node
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN npm install --registry=https://registry.npm.taobao.org -g bower

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Nginx and Passenger are disabled by default. Enable them like so:
RUN rm -f /etc/service/nginx/down

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD bootstrap.sh /etc/my_init.d/001_bootstrap.sh
ADD nginx-default-site /etc/nginx/sites-enabled/default
ADD ssh-config $HOME/.ssh/config
ADD ssh-config /home/app/.ssh/config

RUN mkdir /home/app/webapp
RUN chown app:app /home/app/.ssh/config /home/app/webapp
RUN chmod +x /etc/my_init.d/001_bootstrap.sh

EXPOSE 80
