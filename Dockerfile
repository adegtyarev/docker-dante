FROM    alpine:latest

ENV     DANTE_VER 1.4.2

ENV     DANTE_URL https://www.inet.no/dante/files/dante-$DANTE_VER.tar.gz

ENV     DANTE_SHA baa25750633a7f9f37467ee43afdf7a95c80274394eddd7dcd4e1542aa75caad

RUN     apk add --no-cache --virtual .build-deps \
            build-base \
            curl \
            linux-pam-dev && \
        install -v -d /src && \
        curl -sSL $DANTE_URL -o /src/dante.tar.gz && \
        echo "$DANTE_SHA */src/dante.tar.gz" | sha256sum -c && \
        tar -C /src -vxzf /src/dante.tar.gz && \
        cd /src/dante-$DANTE_VER && \
        # https://lists.alpinelinux.org/alpine-devel/3932.html
        ac_cv_func_sched_setscheduler=no ./configure && \
        make -j install && \
        cd / && rm -r /src && \
        apk del .build-deps && \
        apk add --no-cache \
            linux-pam
        
COPY    sockd.conf /etc/

COPY    docker-entrypoint.sh /

EXPOSE  1080

ENTRYPOINT  ["/docker-entrypoint.sh"]

CMD     ["sockd"]
