# Dockerfile and build environment sample

## ENVVARS

Declare in .bashrc.

|   | Variable Name | Value  | default |
| :--- | :---------- | :---------- | :---------- |
| 1 | DOCKER_PROXY_IP | none | docker build      |
| 2 | DOCKER_PROXY_PORT | 8142 | docker build    |



## Options for make

|   | Option | Summary | Summary |
| :--- | :---------- | :---------- | :---------- |
| 1 | build     | Build image  | docker build      |
| 2 | rebuild   | REBUILD image  |  docker build --no-cache  ...   |
| 3 | run       | Run container  |  docker run -itd ...       |
| 4 | login     | Login container  |  docker exec -it ...       |
| 5 | stop      | Stop container  |  docker container stop ...       |
| 6 | restart   | Restart container  |  docker container restart ...       |
| 7 | kill      | Kill contianer |  docker container kill       |



## make build
build Docker image
```
$ make build
make base
make[1]: Entering directory '/home/username/local/tmp/dockersample'
[+] Building 68.8s (11/22)                                                                                 docker:default
 => [internal] load build definition from Dockerfile                                                                 0.0s
 => => transferring dockerfile: 2.39kB                                                                               0.0s
 => resolve image config for docker-image://docker.io/docker/dockerfile:experimental                                 0.9s
 ...
 => exporting to image                                                                                              10.3s
 => => exporting layers                                                                                             10.3s
 => => writing image sha256:6fa266fad69944129df03e73109a67eff7c135d7915b6d2506740ef3376c893d                         0.0s
 => => naming to docker.io/kaz3w/ubuntu:20.04                                                                        0.0s
make[1]: Leaving directory '/home/username/local/tmp/dockersample'
```
## make rebuild
rebuild Docker image

```
$ make rebuild
```
## make run
```
$ make run
5d482161d42e8932e1eebaac3fcc1555a9ace2bd1a23f0f5ded1c4105a7627fc  (HASH value)
$
```
## make login
Log in to bash shell of container with prefifined account.
```
$ make login
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

Container username@5d482161d42e:~$ exit

```

## make stop
Stop the running container.
```
$ make stop
Stopping: kaz3w-ubuntu-20.04
5d482161d42e (HASH value)
Stopped
```

## make restart
Restart the stopped container.
```
$ make restart
Restarting: kaz3w-ubuntu-20.04
5d482161d42e (HASH value)
Restarted
```


## make proxy_enable
Switch to using apt-cache proxy server during a build process.
```
$ make proxy_enable
Enabled PROXY
```

## make proxy_disable [default]
Switch to NOT USING apt-cache proxy server during a build process.
```
$ make proxy_disable
Disabled PROXY
```
