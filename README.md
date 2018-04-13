# Dante & Docker

Dante is a free SOCKS server and a SOCKS client, implementing RFC 1928 and
related standards. 

## Software specficiation

* Base image: Alpine Linux
* Dante version: 1.4.2
* [![](https://images.microbadger.com/badges/image/adegtyarev/dante.svg)](https://microbadger.com/images/adegtyarev/dante "the download size and the number of layers")

## Usage

The image is ready to run Dante server or client in a Docker environment:

    $ docker run --rm adegtyarev/dante sockd -v
    Dante v1.4.2.  Copyright (c) 1997 - 2014 Inferno Nettverk A/S, Norway

Should you run a private SOCKS server with simple auth using Docker Compose,
create file `.env` with the following content:

* *SOCKD_PORT*: the port to listen to
* *SOCKD_USER_NAME*: the username to be used by clients
* *SOCKD_USER_PASSWORD*: the password

For example:

    cat .env
    SOCKD_PORT=1080
    SOCKD_USER_NAME=user
    SOCKD_USER_PASSWORD=password

Run a new container:

    docker-compose up -d

The SOCKS server should be up and ready to serve.  An example command to test:

    curl -x socks5h://username:password@127.0.0.1:1080 http://example.com


## Author

Alexey Degtyarev
