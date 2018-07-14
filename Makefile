imageName=aws-go-helloworld
imageTag=latest
buildAgent=go-build-agent

.PHONY: compile build run create-build-image

# help: 
# make compile build - compile and build a docker image
# make run - run a docker instance

# compiles .go files and creates bin/helloworld binary
compile:
	GOPATH=${PWD} && go get -d -v ./...
	GOPATH=${PWD} && go install -v ./...

# docker build agent used by Jenkins only for creating the binary
create-build-agent:
	docker build -t ${buildAgent} -f Dockerfile-build-agent .

# creates a docker image with helloworld server installed
build:
	docker build -t ${imageName} -f Dockerfile .

# run a docker instance of the helloworld server
run:
	docker run --rm -p 8080:8080 ${imageName}:${imageTag}
