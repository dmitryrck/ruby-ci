from dmitryrck/ruby:3.2.2

ENV DOCKERIZE_VERSION v0.7.0

run \
  wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xzf - -C /usr/local/bin && \
  apt update && apt install --yes libvips42 && apt clean
