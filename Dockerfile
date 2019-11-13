FROM ubuntu:16.04

ENV BOSH_CLI_VERSION 6.1.1
ENV JQ_CLI_VERSION 1.6
ENV TERRAFORM_CLI_VERSION 0.12.13

RUN apt-get update && \
    apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 curl && \
    curl -sfL -o /usr/local/bin/bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VERSION}/bosh-cli-${BOSH_CLI_VERSION}-linux-amd64 && \
    chmod +x /usr/local/bin/ && \
    curl -sfL -o /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-${JQ_CLI_VERSION}/jq-linux64 && \
    chmod +x /usr/local/bin/jq && \
    curl -sfL -O https://releases.hashicorp.com/terraform/${TERRAFORM_CLI_VERSION}/terraform_${TERRAFORM_CLI_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_CLI_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_CLI_VERSION}_linux_amd64.zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
