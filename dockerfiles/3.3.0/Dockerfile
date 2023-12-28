from ruby:3.3.0

env \
  DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=18.14.2 \
  DOCKERIZE_VERSION=v0.7.0

run \
  wget -q -O- https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt update && \
  apt install -y build-essential libpq-dev postgresql-client google-chrome-stable unzip cmake libvips42 && \
  apt clean && \
  wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xzf - -C /usr/local/bin && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install -g yarn
