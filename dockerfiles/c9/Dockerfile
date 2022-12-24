from dmitryrck/ruby

run sed -i "/security/d" /etc/apt/sources.list && apt-get update && \
  apt-get install -y git wget curl openssl ca-certificates build-essential \
    python sshfs tmux locales && \
  echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.utf8 && \
  git clone https://github.com/c9/core.git /c9 && \
  /c9/scripts/install-sdk.sh && \
  apt-get -y autoclean && apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

cmd node /c9/server.js -p 80 -l 0.0.0.0 -w /workspace -a :
