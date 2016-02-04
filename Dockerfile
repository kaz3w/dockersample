FROM ubuntu:latest
MAINTAINER kaz3w <kaz3w@xenon11.sakura.ne.jp>

RUN sed -ri "s/\/\/archive/\/\/jp.archive/" /etc/apt/sources.list \
 && sed -ri "s/^# deb/deb/" /etc/apt/sources.list
#RUN sed -ri "s/^# deb/deb/" /etc/apt/sources.list

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
 && rm -rf /var/lib/apt/lists/* \
 && apt-file update 

WORKDIR /tmp
RUN wget -nv http://ftp.jaist.ac.jp/pub/GNU/automake/automake-1.15.tar.gz --directory-prefix=/tmp; wget -nv http://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.xz --directory-prefix=/tmp

WORKDIR /usr/local/src 
RUN tar zxvf /tmp/automake-1.15.tar.gz; cd automake-1.15;./configure; cd ..; make; make install; \
	tar Jxvf /tmp/autoconf-latest.tar.xz; cd autoconf-2.69;./configure; cd ..; make; make install;\
	git clone https://github.com/vim/vim.git

WORKDIR /usr/local/src/vim
RUN echo `pwd`;./confifure;cd src;make;make install

WORKDIR /

