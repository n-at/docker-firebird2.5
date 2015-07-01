FROM ubuntu:14.04

MAINTAINER Alexey Nurgaliev <atnurgaliev@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libncurses5-dev bzip2 curl gcc g++ make

RUN mkdir /tmp/firebird && \
    cd /tmp/firebird && \
    curl -L -o firebird.tar.bz2 \
        "http://downloads.sourceforge.net/project/firebird/firebird/2.5.4-Release/Firebird-2.5.4.26856-0.tar.bz2" && \
    tar --strip=1 -xf firebird.tar.bz2 && \
    ./configure --enable-superserver --prefix=/usr/local/firebird && \
    make && \
    make silent_install && \
    cd / && \
    rm -R /tmp/firebird

RUN apt-get purge -y --auto-remove libncurses5-dev bzip2 curl gcc g++ make

ADD setup.sh /usr/local/firebird/setup.sh
RUN chmod +x /usr/local/firebird/setup.sh
RUN /usr/local/firebird/setup.sh

VOLUME ["/sqlbase"]

EXPOSE 3050

ENTRYPOINT ["/usr/local/firebird/bin/fbguard"]
