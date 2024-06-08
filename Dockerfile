# syntax = docker/dockerfile:experimental
ARG ARG_DISTVER
FROM ubuntu:${ARG_DISTVER}

LABEL maintainer="maintainer@example.com"

# for DISTRO Cache --->
ARG ARG_CACHEPROXY_IP
ARG ARG_CACHEPROXY_PORT
ENV CACHEPROXY=${ARG_CACHEPROXY_IP}:${ARG_CACHEPROXY_PORT}
WORKDIR /etc/apt/apt.conf.d/
# RUN echo "Acquire::http { Proxy http://${ARG_CACHEPROXY_IP}; };" >> 01proxy
# if cache maintenance completed
RUN sed -ie "s/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/${CACHEPROXY}\/archive.ubuntu.com\/ubuntu/g" /etc/apt/sources.list
WORKDIR /
# ---> for DISTRO Cache

# USER, PASSWD, UID, GID
ARG ARG_USER
ARG ARG_PASS
ARG ARG_UID
ARG ARG_GID

ENV USERNAME=${ARG_USER}
ENV USERPASSWD=${ARG_PASS}

# Upgrade OS
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Install Tools
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y  --no-install-recommends \
	debian-keyring \
	git \
	wget \
	build-essential \
	cmake \
	openssh-client \
	supervisor \
	expect \
	autoconf \
	libncurses-dev \
	software-properties-common \
	vim \
	apt-file \
	gnupg gnupg2 \
	localehelper \
	sudo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && apt-file update 

WORKDIR /

#### GLOBAL

ENV TZ='Asia/Tokyo'
RUN dpkg-reconfigure tzdata

ARG GROUPNAME=${USERNAME}
RUN groupadd -g ${ARG_GID} ${GROUPNAME} \
 && useradd -m -s /bin/bash -u ${ARG_UID} -g ${ARG_GID} -G sudo,root ${USERNAME} \
 && echo ${USERNAME}:${USERPASSWD} | chpasswd

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

#### ROOT
WORKDIR /root
RUN sed -ie "s/#force_color_prompt/force_color_prompt/g" .bashrc
RUN echo "PS1='\033[44m\033[01;37mContainer\033[0m \[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" | tee -a .bashrc


#### USER
USER ${USERNAME}

ENV HOME_DIR /home/${USERNAME}
ENV BASHRC_PATH ${HOME_DIR}/.bashrc

# Modify .bashrc
WORKDIR ${HOME_DIR}
RUN sed -ie "s/#force_color_prompt/force_color_prompt/g" ${BASHRC_PATH}
RUN echo "PS1='\033[44m\033[01;37mContainer\033[0m \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" | tee -a ${BASHRC_PATH}
