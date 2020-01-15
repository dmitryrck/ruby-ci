from ruby

env DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=10.13.0

run sed -i "/deb-src/d" /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y build-essential cmake && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install -g \
    eslint@5.15.3 \
    eslint-plugin-vue@next \
    eslint-plugin-vue@latest \
    eslint-plugin-html \
    babel-eslint \
    eslint-config-standard \
    eslint-plugin-import@latest \
    eslint-plugin-node@latest \
    eslint-plugin-promise@latest \
    eslint-plugin-standard@latest && \
  gem install --no-document parser pronto pronto-rubocop pronto-flay rubocop-rspec \
    rubocop-performance pronto-eslint_npm pronto-reek reek pronto-fasterer rubocop:0.75.0 && \
  rm -rf /var/lib/apt/lists/*
