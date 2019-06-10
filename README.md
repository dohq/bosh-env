# bosh-env
![Docker Pulls](https://img.shields.io/docker/pulls/dohq/bosh-env.svg)  
An image that satisfies the required dependencies for the `bosh create-env` command.  

BaseImage: Ubuntu/18.04
Packages:
* build-essential
* zlibc
* zlib1g-dev
* ruby
* ruby-dev
* openssl
* libxslt1-dev
* libxml2-dev
* libssl-dev
* libreadline7
* libreadline-dev
* libyaml-dev
* libsqlite3-dev
* sqlite3
* curl
* wget

Additional CLI  
* Terraform
* jq
* bosh


## Usage
```
docker run -v $PWD:/work -it dohq/bosh-env:latest
root@foobarbaz# cd /work
root@foobarbaz# bosh create-env ...
```

## Requirements
docker

## Installation
`docker pull dohq/bosh-env:latest`

## Author
dohq(dorastone@gmail.com)
