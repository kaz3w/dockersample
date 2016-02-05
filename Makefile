all: build

mytagname=kaz3w/ub1404_base
myver=0.1

help:
	@echo "build : All images"
	@echo "base  : $(mytagname):$(myver)"

build:
	make base

base:
	@docker build --tag="$(mytagname):$(myver)" --file=Dockerfile .


run:
	@docker run -it --name ub1404_nase $(mytagname):$(myver) /bin/bash

clean:
	@docker images | grep \<none\> | awk -F" " '{print $$3}' | xargs docker rmi 

allclean:
	@echo "Deleting unnecessary container(s)..."
	@docker ps -a  | grep Exited | awk -F" " '{print $$1}' | xargs docker rm
	@echo "Deleting unnecessary image(s)..."
	@docker images | grep \<none\> | awk -F" " '{print $$3}' | xargs docker rmi

