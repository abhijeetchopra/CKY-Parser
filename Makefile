include .env

.PHONY: init

APP_NAME=cky-parser

init:
		@echo "ERROR: no Makefile target selected"
		@echo ""
		@echo "USAGE: make [list, build, scan, start, stop, remove, clean]"
		@echo ""
		@exit 1

.PHONY: list
list:
		@echo "Running containers:"
		@docker ps | grep $(APP_NAME) || true

		@echo "" && echo "Stopped containers:"
		@docker ps -a | grep Exited | grep $(APP_NAME) || true

		@echo "" && echo "Images:"
		@docker images | grep $(APP_NAME) || true

.PHONY: build
build:
		@# build container
		@FILE_VERSION=$$(cat VERSION); \
		echo "Enter version to build...(leave blank to read from VERSION file which currently is: $$FILE_VERSION)"; \
		read READ_VERSION; \
		echo $$READ_VERSION; \
		echo $$FILE_VERSION; \
		VERSION=$${READ_VERSION:-$$FILE_VERSION}; \
		docker build -t $(APP_NAME):$$VERSION .;

.PHONY: snyk-container-scan
snyk-container-scan:
		@# scan container with snyk for high severity CVEs
		@FILE_VERSION=$$(cat VERSION); \
		echo "Enter version to build...(leave blank to read from VERSION file which currently is: $$FILE_VERSION)"; \
		read READ_VERSION; \
		echo $$READ_VERSION; \
		echo $$FILE_VERSION; \
		VERSION=$${READ_VERSION:-$$FILE_VERSION}; \
		snyk container test --severity-threshold=high --exclude-base-image-vulns $(APP_NAME):$$VERSION;

.PHONY: snyk-code-scan
snyk-code-scan:
		@# scan static code with snyk for high severity CVEs
		snyk code test;

.PHONY: sonarqube
sonarqube:
		docker run -d --name sonarqube \
			-e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
			-p 9000:9000 sonarqube:latest

.PHONY: sonar-scanner
sonar-scanner:
		docker run --platform linux/x86_64 --rm \
			-e SONAR_HOST_URL="http://localhost:9000" \
			-e SONAR_SCANNER_OPTS="-Dsonar.projectKey=$(APP_NAME)" \
			-e SONAR_LOGIN="$(SONARQUBE_AUTH_TOKEN)" \
			-v "$(PWD):/usr/src" \
			sonarsource/sonar-scanner-cli:latest

.PHONY: start
start:
		@# start container
		@FILE_VERSION=$$(cat VERSION); \
		echo "Enter version to start...(leave blank to read from VERSION file which currently is: $$FILE_VERSION)"; \
		read READ_VERSION; \
		echo $$READ_VERSION; \
		echo $$FILE_VERSION; \
		VERSION=$${READ_VERSION:-$$FILE_VERSION}; \
		docker run --rm -d -v "$$PWD:/usr/share/nginx/html" -p 80:80 $(APP_NAME):$$VERSION;

.PHONY: shell
shell:
		@# start shell in running container
		@FILE_VERSION=$$(cat VERSION); \
		echo "Enter version to start...(leave blank to read from VERSION file which currently is: $$FILE_VERSION)"; \
		read READ_VERSION; \
		echo $$READ_VERSION; \
		echo $$FILE_VERSION; \
		VERSION=$${READ_VERSION:-$$FILE_VERSION}; \
		CONTAINER_ID=$$(docker ps | grep $(APP_NAME):$$VERSION | awk '{print $$1}'); \
		docker exec -it $$CONTAINER_ID /bin/sh

.PHONY: stop
stop:
		@# stop container
		@VERSION=$$(cat VERSION); docker stop $$(docker container ls | grep $(APP_NAME) | grep $$VERSION | awk '{print $$1}') || true;

.PHONY: remove
remove:
		@# remove container
		@VERSION=$$(cat VERSION); docker rm $$(docker container ls --all | grep $(APP_NAME) | grep $$VERSION | awk '{print $$1}') || true;

.PHONY: clean
clean:
		@# stop container
		@VERSION=$$(cat VERSION); docker stop $$(docker container ls | grep $(APP_NAME) | grep $$VERSION | awk '{print $$1}') || true;

		@# remove container
		@VERSION=$$(cat VERSION); docker rm $$(docker container ls --all | grep $(APP_NAME) | grep $$VERSION | awk '{print $$1}') || true;

		@# remove image
		@VERSION=$$(cat VERSION); docker rmi $$(docker image ls | grep $(APP_NAME) | grep $$VERSION | awk '{print $$3}') || true;
