FROM alpine:3.8

RUN apk add --update \
  bash \
  libffi-dev \
  openssl-dev \
  python-dev \
  py-pip \
  py-setuptools \
  ca-certificates \
  gcc \
  musl-dev \
  linux-headers \
  curl \
  jq;

ENV OPENSTACK_CLI_VERSION "3.16.1"

RUN pip install --upgrade pip

RUN pip install --upgrade --no-cache-dir python-openstackclient==${OPENSTACK_CLI_VERSION}

RUN pip install --upgrade python-designateclient

RUN apk del gcc musl-dev linux-headers

RUN rm -rf /var/cache/apk/*

VOLUME ["/data"]

CMD ["/bin/bash"]
