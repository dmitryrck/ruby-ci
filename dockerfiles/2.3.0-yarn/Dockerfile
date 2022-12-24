from ruby:2.3.0

env DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=10.8.0 \
  NPM_VERSION=3.10.10 \
  YARN_VERSION=1.0.2

run sed -i "/deb-src/d" /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y build-essential libpq-dev apt-transport-https cmake && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install --global npm@$NPM_VERSION && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn && \
  gem install --no-ri --no-rdoc bundler && \
  rm -rf /var/lib/apt/lists/*
