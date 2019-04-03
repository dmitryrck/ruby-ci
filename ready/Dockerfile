from ruby

env DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=10.13.0

run sed -i "/deb-src/d" /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y build-essential cmake && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install -g eslint eslint-plugin-vue@next && \
  gem install --no-document pronto pronto-rubocop pronto-flay rubocop-rspec \
    pronto-eslint_npm pronto-reek pronto-fasterer && \
  rm -rf /var/lib/apt/lists/*
