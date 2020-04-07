from ruby:2.7.1

env \
  DEBIAN_FRONTEND=noninteractive \
  LANG=en_US.UTF-8 \
  NODE_VERSION=12.16.1

run \
  sed -i "/deb-src/d" /etc/apt/sources.list && apt update && apt install -y locales && \
  sed -i -e "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen && \
  dpkg-reconfigure locales && update-locale && \
  wget -q -O- "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  gem update --system && \
  rm -rf /var/lib/apt/lists/*
