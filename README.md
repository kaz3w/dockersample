# Dockerfile and build environment sample

## prerequisites

## Options for make
## make build, make rebuild
build Docker image (docker build ...)
```
$ make build
make base
make[1]: Entering directory '/home/username/local/tmp/dockersample'
[+] Building 68.8s (11/22)                                                                                 docker:default
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => => transferring dockerfile: 2.39kB                                                                               0.0s
 => resolve image config for docker-image://docker.io/docker/dockerfile:experimental                                 0.9s
 => CACHED docker-image://docker.io/docker/dockerfile:experimental@sha256:600e5c62eedff338b3f7a0850beb7c05866e0ef27  0.0s
 => [internal] load .dockerignore                                                                                    0.0s
 => => transferring context: 34B                                                                                     0.0s
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                                      0.0s
[+] Building 68.9s (11/22)                                                                                 docker:default
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => => transferring dockerfile: 2.39kB                                                                               0.0s
 => resolve image config for docker-image://docker.io/docker/dockerfile:experimental                                 0.9s
 => CACHED docker-image://docker.io/docker/dockerfile:experimental@sha256:600e5c62eedff338b3f7a0850beb7c05866e0ef27  0.0s
 => [internal] load .dockerignore                                                                                    0.0s 
 => => transferring context: 34B                                                                                     0.0s 
 => [internal] load build definition from Dockerfile                                                                 0.0s 
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                                      0.0s 
[+] Building 69.0s (11/22)                                                                                 docker:default 
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => => transferring dockerfile: 2.39kB                                                                               0.0s
 => resolve image config for docker-image://docker.io/docker/dockerfile:experimental                                 0.9s
 => CACHED docker-image://docker.io/docker/dockerfile:experimental@sha256:600e5c62eedff338b3f7a0850beb7c05866e0ef27  0.0s
 => [internal] load .dockerignore                                                                                    0.0s
 => => transferring context: 34B                                                                                     0.0s
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                                      0.0s
[+] Building 69.2s (11/22)                                                                                 docker:default
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => => transferring dockerfile: 2.39kB                                                                               0.0s
 => resolve image config for docker-image://docker.io/docker/dockerfile:experimental                                 0.9s
 => CACHED docker-image://docker.io/docker/dockerfile:experimental@sha256:600e5c62eedff338b3f7a0850beb7c05866e0ef27  0.0s
 => [internal] load .dockerignore                                                                                    0.0s
 => => transferring context: 34B                                                                                     0.0s
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                                      0.0s
[+] Building 69.3s (11/22)                                                                                 docker:default
 => [ 2/18] WORKDIR /etc/apt/apt.conf.d/                                                                             0.0s
 => [ 3/18] RUN sed -ie "s/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/192.168.1.187:8142\/archive.ubuntu.com\/u  0.3s
 => [ 4/18] RUN apt-get update -q &&     DEBIAN_FRONTEND=noninteractive apt-get upgrade -y     && apt-get autoclea  22.3s
 => [ 5/18] RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime                                                 0.4s
 => [ 6/18] RUN apt-get update  && DEBIAN_FRONTEND=noninteractive apt-get install -y  --no-install-recommends  deb  45.1s
 => => # Preparing to unpack .../048-python-apt-common_2.0.1ubuntu0.20.04.1_all.deb ...                                  
 => => # Unpacking python-apt-common (2.0.1ubuntu0.20.04.1) ...                                                          
 => => # Selecting previously unselected package python3-apt.                                                            
[+] Building 513.0s (22/23)                                                                                docker:default
 => [ 8/18] RUN groupadd -g 1000 username  && useradd -m -s /bin/bash -u 1000 -g 1000 -G sudo,root username  && echo   0.4s
[+] Building 513.1s (22/23)                                                                                docker:default
 => [ 8/18] RUN groupadd -g 1000 username  && useradd -m -s /bin/bash -u 1000 -g 1000 -G sudo,root username  && echo   0.4s 
[+] Building 513.3s (22/23)                                                                                docker:default 
 => [ 8/18] RUN groupadd -g 1000 username  && useradd -m -s /bin/bash -u 1000 -g 1000 -G sudo,root username  && echo   0.4s 
[+] Building 513.4s (22/23)                                                                                docker:default 
 => [ 8/18] RUN groupadd -g 1000 username  && useradd -m -s /bin/bash -u 1000 -g 1000 -G sudo,root username  && echo   0.4s 
[+] Building 513.5s (22/23)                                                                                docker:default 
 => [10/18] RUN locale-gen en_US.UTF-8                                                                               2.2s 
[+] Building 513.6s (23/23) FINISHED                                                                       docker:default 
 => [internal] load build definition from Dockerfile                                                                 0.0s 
 => => transferring dockerfile: 2.39kB                                                                               0.0s
 => resolve image config for docker-image://docker.io/docker/dockerfile:experimental                                 0.9s
 => CACHED docker-image://docker.io/docker/dockerfile:experimental@sha256:600e5c62eedff338b3f7a0850beb7c05866e0ef27  0.0s
 => [internal] load .dockerignore                                                                                    0.0s
 => => transferring context: 34B                                                                                     0.0s
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                                      0.0s 
 => CACHED [ 1/18] FROM docker.io/library/ubuntu:20.04                                                               0.0s 
 => [ 2/18] WORKDIR /etc/apt/apt.conf.d/                                                                             0.0s
 => [ 3/18] RUN sed -ie "s/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/192.168.1.187:8142\/archive.ubuntu.com\/u  0.3s
 => [ 4/18] RUN apt-get update -q &&     DEBIAN_FRONTEND=noninteractive apt-get upgrade -y     && apt-get autoclea  22.3s
 => [ 5/18] RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime                                                 0.4s
 => [ 6/18] RUN apt-get update  && DEBIAN_FRONTEND=noninteractive apt-get install -y  --no-install-recommends  de  473.8s
 => [ 7/18] RUN dpkg-reconfigure tzdata                                                                              0.7s
 => [ 8/18] RUN groupadd -g 1000 username  && useradd -m -s /bin/bash -u 1000 -g 1000 -G sudo,root username  && echo   0.4s
 => [ 9/18] RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers                                                  0.4s
 => [10/18] RUN locale-gen en_US.UTF-8                                                                               2.2s
 => [11/18] WORKDIR /root                                                                                            0.0s
 => [12/18] RUN sed -ie "s/#force_color_prompt/force_color_prompt/g" .bashrc                                         0.3s
 => [13/18] RUN echo "PS1='\033[44m\033[01;37mContainer\033[0m \[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[  0.4s
 => [14/18] WORKDIR /home/username                                                                                    0.0s
 => [15/18] RUN sed -ie "s/#force_color_prompt/force_color_prompt/g" /home/username/.bashrc                           0.3s
 => [16/18] RUN echo "PS1='\033[44m\033[01;37mContainer\033[0m \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[  0.4s
 => exporting to image                                                                                              10.3s
 => => exporting layers                                                                                             10.3s
 => => writing image sha256:6fa266fad69944129df03e73109a67eff7c135d7915b6d2506740ef3376c893d                         0.0s
 => => naming to docker.io/kaz3w/ubuntu:20.04                                                                        0.0s
make[1]: Leaving directory '/home/username/local/tmp/dockersample'
```
## make rebuild
rebuild Docker image
(docker build --no-cache ....)
```
$ make rebuild
```
## make run
```
$ make run
5d482161d42e8932e1eebaac3fcc1555a9ace2bd1a23f0f5ded1c4105a7627fc
$
```
## make login
```
$ make login
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

Container username@5d482161d42e:~$ exit
$ 
```

## make stop
```
$ make stop
Stopping: kaz3w-ubuntu-20.04
5d482161d42e
Stopped
```

## make restart
```
$ make restart
Restarting: kaz3w-ubuntu-20.04
5d482161d42e
Restarted
```


## make proxy_enable
switch to using apt-cache proxy during building Docker image
```
$ make proxy_enable
Enabled PROXY
```

## make proxy_disable [default]
switch to not using apt-cache proxy during building Docker image
```
$ make proxy_disable
Disabled PROXY
```
