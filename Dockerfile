FROM ubuntu:18.04
MAINTAINER dohq <dorastone@gmail.com>

ENV BOSH_CLI_VERSION 5.5.1
ENV JQ_CLI_VERSION 1.6
ENV TERRAFORM_CLI_VERSION 0.12.1

RUN apt-get update && \
      apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3 curl wget ssh && \
      wget https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VERSION}/bosh-cli-${BOSH_CLI_VERSION}-linux-amd64 && \
      mv bosh-cli-${BOSH_CLI_VERSION}-linux-amd64 bosh && \
      chmod +x bosh && \
      mv bosh /usr/local/bin/ && \
      wget https://github.com/stedolan/jq/releases/download/jq-${JQ_CLI_VERSION}/jq-linux64 && \
      mv jq-linux64 jq && \
      chmod +x jq && \
      mv jq /usr/local/bin/ && \
      wget https://releases.hashicorp.com/terraform/${TERRAFORM_CLI_VERSION}/terraform_${TERRAFORM_CLI_VERSION}_linux_amd64.zip && \
      unzip terraform_${TERRAFORM_CLI_VERSION}_linux_amd64.zip && \
      mv terraform /usr/local/bin/ && \
      rm terraform_${TERRAFORM_CLI_VERSION}_linux_amd64.zip && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*