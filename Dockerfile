FROM ubuntu:latest
MAINTAINER kaz3w <kaz3w@xenon11.sakura.ne.jp>

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN sed -ri "s/\/\/archive/\/\/jp.archive/" /etc/apt/sources.list \
 && sed -ri "s/^# deb/deb/" /etc/apt/sources.list

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	debian-keyring \
	git \
	wget \
	build-essential \
	cmake \
	openssh-client \
	supervisor \
	expect \
	autoconf \
	libncurses5-dev \
	lib32ncurses5-dev \
	software-properties-common \
	apt-file \
	openjdk-7-jre \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && apt-file update 

WORKDIR /tmp
RUN wget -nv http://ftp.jaist.ac.jp/pub/GNU/automake/automake-1.15.tar.gz --directory-prefix=/tmp; wget -nv http://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.xz --directory-prefix=/tmp

WORKDIR /usr/local/src 
RUN tar Jxvf /tmp/autoconf-latest.tar.xz \
	&& cd autoconf-2.69 \
	&& ./configure \
	&& make && make install \
	&& cd .. \
	&& tar zxvf /tmp/automake-1.15.tar.gz \
	&& cd automake-1.15 \
	&& ./configure \
	&& make && make install \
	&& cd .. \
	&& tar Jxvf /tmp/autoconf-latest.tar.xz \
	&& cd autoconf-2.69 \
	&& ./configure \
	&& make && make install \
	&& cd .. \
	&& git clone https://github.com/vim/vim.git \
	&& cd vim \
	&& ./configure && cd src && make && make install \
	&& rm -f /tmp/*.gz /tmp/*.xz

WORKDIR /
