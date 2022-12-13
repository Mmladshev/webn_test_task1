all: help

ANSIBLE=ansible
PLAYBOOK=ansible-playbook
DOCKER=docker
DOCKER_USER=mmladshev

help:
	@echo "Make command examples for Ansible"
	@echo "    build                    	  Build docker image for backend using script.py"
	@echo "    push                    	  	  Push local docker image to DockerHub"
	@echo "    deploy                    	  Deploy everyting"
	@echo "    scale                     	  Scale backend service"
	@echo "    restart                        Restart all services"
	@echo "    clean                     	  Stop all service, same as docker-sompose down"
	@echo "    prune                     	  'Clear volumes'"

build:
	docker build -t backend .

push:
	docker image tag backend:latest $(DOCKER_USER)/webinartest:latest
	docker image push $(DOCKER_USER)/webinartest:latest

deploy:
	$(PLAYBOOK)  ansible/main.yaml -i ansible/inventory/hosts.ini

scale:
	$(PLAYBOOK)  ansible/scale.yaml -i ansible/inventory/hosts.ini

restart:
	$(PLAYBOOK)  ansible/restart.yaml -i ansible/inventory/hosts.ini

clean:
	$(PLAYBOOK)  ansible/stop.yaml -i ansible/inventory/hosts.ini

prune:
	$(DOCKER) volume prune