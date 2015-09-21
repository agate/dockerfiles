FROM phusion/passenger-ruby22

# Install Node
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g bower

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Nginx and Passenger are disabled by default. Enable them like so:
RUN rm -f /etc/service/nginx/down

# Clean up APT when done.
RUN apt-get dist-upgrade -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD pre_bootstrap.sh /etc/my_init.d/001_pre_bootstrap.sh
ADD bootstrap.sh /etc/my_init.d/010_bootstrap.sh
ADD post_bootstrap.sh /etc/my_init.d/099_post_bootstrap.sh
RUN chown +x /etc/my_init.d/001_pre_bootstrap.sh
RUN chown +x /etc/my_init.d/010_bootstrap.sh
RUN chown +x /etc/my_init.d/099_post_bootstrap.sh

ADD ssh-config $HOME/.ssh/config
ADD nginx-default-site /etc/nginx/sites-enabled/default
RUN mkdir /home/app/webapp

EXPOSE 80
