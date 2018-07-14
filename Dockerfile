FROM golang:alpine

WORKDIR /chameleon-saas
COPY bin/helloworld .

EXPOSE 8080

CMD ["helloworld"]
