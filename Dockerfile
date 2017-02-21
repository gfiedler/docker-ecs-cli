FROM alpine
MAINTAINER Gerald Fiedler <gfiedler@sftech.de>
RUN apk --update upgrade \
 && apk --no-cache add --virtual build-dependencies ca-certificates curl \
 && update-ca-certificates \
 && curl --location --silent https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest > /usr/local/bin/ecs-cli \
 && echo $(curl --location --silent https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5)'  /usr/local/bin/ecs-cli' | md5sum -c - \
 && chmod +x /usr/local/bin/ecs-cli \
 && apk del build-dependencies
 
