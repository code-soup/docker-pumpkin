FROM ubuntu

MAINTAINER Vlado Bosnjak <hi@codesoup.co>

# Set environment variables
ENV HOME /root

# Cloudflare DNS
RUN echo "nameserver 1.1.1.1" | tee /etc/resolv.conf > /dev/null

# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    software-properties-common \
    git \
    unzip \
    mcrypt \
    wget \
    make \
    openssl \
    ssh \
    locales \
    composer \
    sudo \
    nodejs \
    npm \
    yarn \
    libtool \
    automake \
    php-pear php7.2-mysql php7.2-zip php7.2-xml php7.2-mbstring php7.2-curl php7.2-json php7.2-pdo php7.2-tokenizer php7.2-cli php7.2-imap php7.2-intl php7.2-gd php7.2-xdebug php7.2-soap \
    apache2 libapache2-mod-php7.2 \
    apt-utils \
    --no-install-recommends && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir gitftp && cd gitftp && \
    git clone https://github.com/git-ftp/git-ftp.git . && \
    tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" && \
    git checkout "$tag" && \
    make install && \
    cd / && \
    mkdir libssh2 && cd libssh2 && \
    git clone https://github.com/libssh2/libssh2.git . && \
    ./buildconf && ./configure && make && make install && \
    cd / && \
    mkdir curl && cd curl && \
    apt-get remove -y libcurl3-gnutls libcurl4 && \
    apt-get update && \
    wget https://curl.haxx.se/download/curl-7.64.1.tar.gz && \
    tar -xvzf curl-7.64.1.tar.gz && \
    cd curl-7.64.1 && \
    ./configure --with-libssh2=/usr/local && \
    make && make install && \
    apt-get install -y git


# Ensure UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
RUN locale-gen en_US.UTF-8

# Timezone & memory limit
RUN echo "date.timezone=Europe/London" > /etc/php/7.2/cli/conf.d/date_timezone.ini && echo "memory_limit=1G" >> /etc/php/7.2/apache2/php.ini

# Goto temporary directory.
WORKDIR /tmp