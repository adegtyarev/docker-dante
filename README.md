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

### Dante & Docker Compose

Should you run using Docker Compose a private SOCKS server with simple
username/password auth, clone this project and create a settings file:

    $ git clone git@github.com:adegtyarev/docker-dante.git
    $ cd docker-dante
    $ vim .env

Set the following parameters:

* *SOCKD_PORT*: the port to listen to
* *SOCKD_USER_NAME*: the username to be used by clients
* *SOCKD_USER_PASSWORD*: the password

For example:

    $ cat .env
    SOCKD_PORT=1080
    SOCKD_USER_NAME=user
    SOCKD_USER_PASSWORD=password

Start a new container:

    $ docker-compose up -d

The SOCKS server should be up and ready to serve.  An example command to test
the proxy service you have just set up:

    $ curl -x socks5h://username:password@127.0.0.1:1080 http://example.com

Access the logs with:

    $ docker-compose logs -f dante


## Author

Alexey Degtyarev @adegtyarev
