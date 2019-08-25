#!/bin/sh

set -e

: ${SOCKD_USER_NAME:=user}

echo $1 | grep -q ^sockd- || exec "$@"

case $1 in
    'sockd-username')
        if [ -z "${SOCKD_USER_PASSWORD}" ]; then
            echo "Set \$SOCKD_USER_PASSWORD variable please"
            exit 1
        fi

        id $SOCKD_USER_NAME || adduser -D $SOCKD_USER_NAME

        echo $SOCKD_USER_NAME:$SOCKD_USER_PASSWORD |chpasswd

        exec sockd
    ;;
esac
