FROM jruby:1.7.22-jdk
MAINTAINER Manuel Aristaran <manuel@jazzido> (@manuelaristaran)


RUN echo "deb http://httpredir.debian.org/debian jessie contrib" > /etc/apt/sources.list.d/contrib.list
RUN apt-get update && apt-get install -y git ttf-mscorefonts-installer mupdf-tools --no-install-recommends

RUN mkdir /tabula-data
VOLUME /tabula-data

RUN git clone --depth=10 -b master https://github.com/tabulapdf/tabula.git /tabula
RUN cd /tabula && bundle install

ENV TABULA_DATA_DIR /tabula-data

EXPOSE 9292

CMD cd /tabula && TABULA_DATA_DIR=$TABULA_DATA_DIR JRUBY_OPTS="--server" rackup -o 0.0.0.0 -p 9292
