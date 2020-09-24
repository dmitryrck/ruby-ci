from ruby:2.5.8

env \
  DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=12.18.3

run \
  sed -i "/deb-src/d" /etc/apt/sources.list && \
  wget -q -O- https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y build-essential libpq-dev postgresql-client google-chrome-stable unzip cmake && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  gem install -v 1.17.3 bundler && \
  npm install -g parcel-bundler && \
  rm -rf /var/lib/apt/lists/*
