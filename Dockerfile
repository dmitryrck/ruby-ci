from ruby:2.3.7

env \
  CHROMEDRIVER_VERSION=2.43 \
  DEBIAN_FRONTEND=noninteractive \
  LANG=en_US.UTF-8 \
  NODE_VERSION=12.16.1

run \
  sed -i "/deb-src/d" /etc/apt/sources.list && \
  wget -q -O- https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y build-essential libpq-dev postgresql-client google-chrome-stable unzip cmake locales && \
  sed -i -e "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen && \
  dpkg-reconfigure locales && update-locale && \
  wget -q -O- "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  wget -q http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
  unzip chromedriver_linux64.zip -d /usr/local/bin && rm chromedriver_linux64.zip && \
  gem update --system && npm install -g parcel-bundler && \
  rm -rf /var/lib/apt/lists/*
