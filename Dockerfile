FROM jruby:1.7.22-jdk
MAINTAINER Manuel Aristaran <manuel@jazzido> (@manuelaristaran)

RUN apt-get update && apt-get install -y git software-properties-common mupdf-tools --no-install-recommends
RUN add-apt-repository -y "deb http://httpredir.debian.org/debian jessie contrib" && apt-get update && apt-get install -y ttf-mscorefonts-installer

RUN mkdir /tabula-data
VOLUME /tabula-data

RUN git clone -b master https://github.com/tabulapdf/tabula.git /tabula
RUN cd /tabula && bundle install

ENV TABULA_DATA_DIR /tabula-data

EXPOSE 9292

CMD cd /tabula && TABULA_DATA_DIR=$TABULA_DATA_DIR rackup -o 0.0.0.0 -p 9292
