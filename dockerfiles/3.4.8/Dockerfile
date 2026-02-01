from ruby:3.4.8

env \
  DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=24.13.0 \
  DOCKERIZE_VERSION=v0.7.0

run \
  wget -q -O- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /etc/google-chrome.gpg && \
  echo "deb [signed-by=/etc/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt update && \
  apt install -y build-essential libpq-dev postgresql-client google-chrome-stable unzip cmake rsync libvips42 && \
  apt clean && \
  wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xzf - -C /usr/local/bin && \
  curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install -g yarn deno
