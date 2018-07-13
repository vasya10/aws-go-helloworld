.PHONY: compile build run

create-build-image:
	docker build -t go-builder -f Dockerfile-go-builder .

build:
	docker build -t aws-go-helloworld -f Dockerfile .

run:
	docker run --rm -p 8080:8080 aws-go-helloworld:latest
