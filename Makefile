# .PHONY: check-proxy build run login clean help
 
default:	help

# INIT
dist_id ?= `./helper/getdistid.sh`
dist_ver ?= `./helper/getdistver.sh`
ARG_USER ?= $(USER)
ARG_PASSWORD ?= $(USER)
ARG_UID ?= `./helper/getuid.sh`
ARG_GID ?= `./helper/getuid.sh`
ARG_PROXY_HOST ?= `./helper/getproxyip.sh`
ARG_PROXY_PORT ?= `./helper/getproxyport.sh`
PRE_SUFFIX ?= "-pre"
FILE_ENA_PROXY ?= "./enable-proxy"

current_ip = `./helper/getip.sh`
today   = $(shell date "+%y%m%d")
user_id	= `./helper/getuid.sh`

myreponame="kaz3w"
myimagename=$(myreponame)"/"$(dist_id)
mytagname=$(dist_ver)
mycontainertag=$(myreponame)"-"$(dist_id)"-"$(dist_ver)


check:
	@echo "today          = "$(today)
	@echo "dist_id        = "$(dist_id)
	@echo "ARG_DISTVER    = "$(dist_ver)
	@echo "ARG_UID, _GID  = "$(user_id)
	@echo "current_ip     = "$(current_ip)
	@echo "ARG_PROXY_HOST = "$(ARG_PROXY_HOST)
	@echo "ARG_PROXY_PORT = "$(ARG_PROXY_PORT)
	@echo "REPO:TAG       = "$(myimagename)":"$(mytagname)
	@echo "FILE_ENA_PROXY = "$(FILE_ENA_PROXY)


help:
	@echo "build : All images"
	@echo "base  : $(mytagname)"

build:
	make base

base:
	@docker build --tag="$(myimagename):$(mytagname)" \
		--build-arg ARG_DISTVER=$(dist_ver) \
		--build-arg ARG_CACHEPROXY_IP=$(ARG_PROXY_HOST) \
		--build-arg ARG_CACHEPROXY_PORT=$(ARG_PROXY_PORT) \
		--build-arg ARG_USER=$(ARG_USER) \
		--build-arg ARG_PASS=$(ARG_PASSWORD) \
		--build-arg ARG_UID=$(user_id) \
		--build-arg ARG_GID=$(user_id) \
		--file=Dockerfile .


rebuild:
	@docker build --no-cache \
		--tag="$(myimagename):$(mytagname)" \
		--build-arg ARG_DISTVER=$(dist_ver) \
		--build-arg ARG_CACHEPROXY_IP=$(ARG_PROXY_HOST) \
		--build-arg ARG_CACHEPROXY_PORT=$(ARG_PROXY_PORT) \
		--build-arg ARG_USER=$(ARG_USER) \
		--build-arg ARG_PASS=$(ARG_PASSWORD) \
		--build-arg ARG_UID=$(user_id) \
		--build-arg ARG_GID=$(user_id) \
		--file=Dockerfile .

run:
	@docker run -itd --name $(mycontainertag) $(myimagename):$(mytagname) tail -F /dev/null

login:
	@docker exec -it $(mycontainertag) bash


restart:
	@echo "Restarting: "$(mycontainertag)
	@docker ps -a | grep $(mycontainertag) | awk -F" " '{print $$1}' | xargs docker restart
	@echo "Restarted"

stop:
	@echo "Stopping: "$(mycontainertag)
	@docker ps -a | grep $(mycontainertag) | awk -F" " '{print $$1}' | xargs docker stop
	@echo "Stopped"

ps:
	@docker container ps -a | grep $(myimagename)

kill:
	@echo "Stopping " $(mycontainertag) 
	docker stop $(mycontainertag) 
	@echo "Removing container" $(mycontainertag) 
	docker container rm -f $(mycontainertag) 

clean:
	@docker images | grep \<none\> | awk -F" " '{print $$3}' | xargs docker rmi 

allclean:
	@echo "Deleting unnecessary container(s)..."
	@docker ps -a  | grep Exited | awk -F" " '{print $$1}' | xargs docker rm
	@echo "Deleting unnecessary image(s)..."
	@docker images | grep \<none\> | awk -F" " '{print $$3}' | xargs docker rmi

proxy_enable:
	@touch $(FILE_ENA_PROXY)
	@echo "Enabled PROXY"

proxy_disable:
	@rm -f $(FILE_ENA_PROXY)
	@echo "Disabled PROXY"
