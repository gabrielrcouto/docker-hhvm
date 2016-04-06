FROM brunoric/hhvm:deb-hhvm
MAINTAINER gabrielrcouto <gabrielrcouto@gmail.com>

# Installing packages
RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install -y xorg libssl-dev libxrender-dev libjpeg8-dev libjpeg8 fontconfig ttf-mscorefonts-installer xfonts-75dpi curl mysql-client-5.5
RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb php7.0-cli php7.0-curl php7.0-gd php7.0-intl php7.0-mysql php7.0-mcrypt php-memcached
RUN apt-get clean && apt-get autoremove -y

# Default command
CMD ["/scripts/start.sh"]
