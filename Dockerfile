FROM alpine:3.5

RUN apk update && apk add --update alpine-sdk
RUN mkdir /app
WORKDIR /app
COPY hello.c /app
RUN gcc -Wall hello.c -o hello
RUN apk del alpine-sdk
CMD /app/hello
