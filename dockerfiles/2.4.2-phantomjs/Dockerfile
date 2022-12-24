from ruby:2.4.2

env DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=10.13.0 \
  PHANTOMJS_VERSION=2.1.1

run sed -i "/deb-src/d" /etc/apt/sources.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pg.list && \
  apt-get update && \
  apt-get install -y build-essential libpq-dev postgresql-client-9.6 && \
  curl -sSL "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2" | tar xfj - -C /usr/local && \
  ln -s /usr/local/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install npm -g && \
  rm -rf /var/lib/apt/lists/*
