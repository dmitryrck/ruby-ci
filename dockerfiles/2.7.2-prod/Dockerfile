from ruby:2.7.2

env \
  DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=12.18.3

run \
  sed -i "/deb-src/d" /etc/apt/sources.list && \
  apt update && \
  apt install -y build-essential libpq-dev postgresql-client cmake && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1
