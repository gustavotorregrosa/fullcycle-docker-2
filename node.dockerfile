FROM alpine:latest

RUN apk add --no-cache openssl

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN apk add nodejs
RUN apk add npm
RUN npm install -g typescript

COPY ./startnode.sh/ /usr/local/bin/startnode.sh
RUN chmod +x /usr/local/bin/startnode.sh

RUN mkdir /home/visualnuts
COPY ./challenge/ /home/fullcycle/

WORKDIR /home/fullcycle

EXPOSE 3000

ENTRYPOINT ["startnode.sh"]
