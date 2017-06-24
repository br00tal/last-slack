FROM mhart/alpine-node:7

RUN apk add --no-cache curl \
  git \
  gzip \
  tar \
  && mkdir /app \
  && git clone https://github.com/DekodeInteraktiv/last-slack /app \
  && cd /app \
  && npm install \
  && rm -rf .git \
  && rm -rf /var/cache/apk/* \
  && rm -rf /root/.npm \
  && curl -LO https://github.com/jwilder/dockerize/releases/download/v0.5.0/dockerize-alpine-linux-amd64-v0.5.0.tar.gz \
  && tar xzf dockerize-alpine-linux-amd64-v0.5.0.tar.gz \
  && apk del curl \
  git \
  gzip \
  tar \
  && mv dockerize /usr/bin/dockerize \
  && chmod +x /usr/bin/dockerize

# Copy files into place
COPY files/* /app/

# Command to run
CMD /app/init.sh
