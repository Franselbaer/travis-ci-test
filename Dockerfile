FROM alpine:3.6 AS build

RUN apk update && apk add --update alpine-sdk
RUN mkdir /app
WORKDIR /app
COPY hello.c /app
RUN gcc -Wall -pedantic-errors hello.c -o hello
CMD /app/hello

FROM alpine:3.6
COPY harden.sh /
RUN chmod 755 /harden.sh
RUN /harden.sh
RUN rm /harden.sh
COPY --from=build /app/hello /app/hello
CMD /app/hello
