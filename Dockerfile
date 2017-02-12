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

ENV MUSL_VERSION      1.1.16
ENV SOCAT_VERSION     1.7.3.2
ENV NCURSES_VERSION   6.0
ENV READLINE_VERSION  7.0
ENV OPENSSL_VERSION   1.0.2k

VOLUME /output

CMD /build/build.sh
