FROM registry.access.redhat.com/ubi8:8.4

ARG YQ_VERSION=v4.9.6
ARG YQ_BINARY=yq_linux_amd64

RUN curl -L https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/${YQ_BINARY}.tar.gz | \
  tar xz && mv ${YQ_BINARY} /usr/bin/yq

RUN curl -Lo /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
  chmod +x /usr/bin/jq

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

