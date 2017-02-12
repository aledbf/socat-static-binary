FROM debian:jessie

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get upgrade -yy \
  && apt-get install -yy \
    automake \
    build-essential \
    curl \
    git  \
    pkg-config \
    libwrap0-dev \
    linux-libc-dev \
  && apt-get clean

RUN mkdir /build
ADD . /build

ENV MUSL_VERSION 1.1.16
ENV SOCAT_VERSION 1.7.3.2
ENV NCURSES_VERSION 5.9
ENV READLINE_VERSION 6.3
ENV OPENSSL_VERSION 1.0.2k

ENV PREFIX /build/usr/local
ENV PKG_CONFIG_PATH /build/usr/local/lib/pkgconfig

VOLUME /output

CMD /build/build.sh
