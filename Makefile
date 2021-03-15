# REQUIRED SECTION
ROOT_DIR:=$(pwd)
# END OF REQUIRED SECTION

.PHONY: help dependencies up start stop restart status ps clean

deploy: ## Start all or c=<name> containers in foreground
	docker-compose -f docker-compose.yml up -d $(c)

start:
	docker run -d -v $(pwd):/home/mirror static_mirror_statmirror tail -f /dev/null

stop:
	docker stop static_mirror_statmirror

rmcon:
	docker rm static_mirror_statmirror

rmimage:
	docker rmi static_mirror_statmirror

sync: ## Start all or c=<name> containers in foreground
	docker-compose -f docker-compose.yml start -d $(c)

down: ## Start all or c=<name> containers in foreground
	docker-compose down $(c)
