FROM mysql:5.7.18

# Install Additional Tools
RUN apt-key adv --refresh-keys --keyserver pgp.mit.edu 5072E1F5
RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update -y --fix-missing
RUN apt-get install --no-install-recommends -y \
    vim nano mc htop wget net-tools iproute2 xauth iputils-ping telnet

# Cleanup to reduce image size
RUN rm -rf /var/lib/apt/lists/* /tmp/*

WORKDIR /var/lib/mysql

# Mounts
VOLUME [ "/var/lib/mysql" ]