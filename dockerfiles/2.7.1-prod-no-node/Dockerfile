from ruby:2.7.1

env \
  DEBIAN_FRONTEND=noninteractive \
  LANG=en_US.UTF-8

run \
  sed -i "/deb-src/d" /etc/apt/sources.list && apt update && apt install -y locales && \
  sed -i -e "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen && \
  dpkg-reconfigure locales && update-locale && \
  gem update --system && \
  rm -rf /var/lib/apt/lists/*
