FROM brunoric/hhvm:deb-hhvm
MAINTAINER gabrielrcouto <gabrielrcouto@gmail.com>

# Installing packages
RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y xorg libssl-dev libxrender-dev libjpeg8-dev libjpeg8 fontconfig ttf-mscorefonts-installer xfonts-75dpi curl mysql-client
RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
RUN apt-get clean && apt-get autoremove -y

# Default command
CMD ["/scripts/start.sh"]
