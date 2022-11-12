FROM alpine:latest

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
