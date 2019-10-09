from ruby:2.3.7

env DEBIAN_FRONTEND=noninteractive \
  LANG=en_US.UTF-8 \
  NODE_VERSION=10.13.0 \
  PHANTOMJS_VERSION=2.1.1

run sed -i "/deb-src/d" /etc/apt/sources.list && \
  apt-get update && apt-get install -y mysql-client curl libpq-dev postgresql-client locales && \
  curl -sSL "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2" | tar xfj - -C /usr/local && \
  ln -s /usr/local/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
  sed -i -e "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  gem update --system && \
  rm -rf /var/lib/apt/lists/*
