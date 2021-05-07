FROM ubuntu:20.04

ENV BOSH_CLI_VERSION 6.4.1
ENV JQ_CLI_VERSION 1.6

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3 curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "Dowdload bosh..." \
    && curl -sfL https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VERSION}/bosh-cli-${BOSH_CLI_VERSION}-linux-amd64 -o /usr/local/bin/bosh \
    && chmod +x /usr/local/bin/bosh

RUN echo "Dowdload jq..." \
    && curl -sfL  https://github.com/stedolan/jq/releases/download/jq-${JQ_CLI_VERSION}/jq-linux64 -o /usr/local/bin/jq \
    && chmod +x /usr/local/bin/jq
