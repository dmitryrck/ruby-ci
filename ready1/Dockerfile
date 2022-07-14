from ruby

env \
  DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=16.14.0

run \
  sed -i "/deb-src/d" /etc/apt/sources.list && \
  apt update && apt install -y build-essential cmake && \
  wget -O- -q "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
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
  npm install -g \
    @babel/core@7.18.6 \
    @babel/eslint-parser@7.18.2 \
    eslint-plugin-prettier-vue@4.2.0 \
    eslint-plugin-vue@9.2.0 \
    eslint-config-prettier@8.5.0 \
    eslint@8.19.0 \
    prettier@2.7.1 && \
  gem install --no-document parser pronto pronto-rubocop pronto-flay \
    rubocop-rspec rubocop-performance pronto-eslint_npm pronto-reek reek \
    pronto-fasterer rubocop faraday-retry && \
  rm -rf /var/lib/apt/lists/*
