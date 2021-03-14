# REQUIRED SECTION
ROOT_DIR:=$(pwd)
# END OF REQUIRED SECTION

.PHONY: help dependencies up start stop restart status ps clean

up: ## Start all or c=<name> containers in foreground
	docker-compose -f docker-compose.yml up -d $(c)

down: ## Start all or c=<name> containers in foreground
	docker-compose down $(c)