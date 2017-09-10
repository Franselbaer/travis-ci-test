FROM alpine:3.6

RUN apk update && apk add --update alpine-sdk
RUN mkdir /app
WORKDIR /app
COPY hello.c /app
RUN gcc -Wall hello.c -o hello || exit 1
RUN rm hello.c
RUN apk del alpine-sdk
CMD /app/hello
