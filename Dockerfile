FROM debian:jessie
MAINTAINER Alexey Nurgaliev <atnurgaliev@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive \
    PREFIX="/usr/local/firebird" \
    SOURCE_URL="https://github.com/FirebirdSQL/firebird/releases/download/R2_5_9/Firebird-2.5.9.27139-0.tar.bz2"

RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y libncurses5-dev bzip2 curl gcc g++ make libicu52 libicu-dev &&\
    \
    mkdir -p /tmp/firebird &&\
    cd /tmp/firebird &&\
    curl -L -o firebird.tar.bz2 ${SOURCE_URL} &&\
    tar --strip=1 -xf firebird.tar.bz2 &&\
    \
    ./configure --prefix=${PREFIX} --with-system-icu &&\
    make &&\
    make silent_install &&\
    \
    cd / &&\
    rm -R /tmp/firebird &&\
    find ${PREFIX} -name .debug -prune -exec rm -rf {} \; && \
    \
    apt-get purge -y --auto-remove libncurses5-dev bzip2 curl gcc g++ make libicu-dev

COPY firebird.conf ${PREFIX}/firebird.conf
COPY docker-entrypoint.sh ${PREFIX}/docker-entrypoint.sh
RUN chmod +x ${PREFIX}/docker-entrypoint.sh

VOLUME ["/sqlbase"]

EXPOSE 3050/tcp

ENTRYPOINT ["/usr/local/firebird/docker-entrypoint.sh"]
CMD ["/usr/local/firebird/bin/fbguard"]
