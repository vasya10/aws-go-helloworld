FROM golang:alpine

ENV GOPATH /chameleon-saas
ENV PATH $PATH:$GOPATH/bin

WORKDIR /chameleon-saas
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

EXPOSE 8080

CMD ["helloworld"]
