FROM dockette/alpine:3.15

RUN echo '@community http://nl.alpinelinux.org/alpine/v3.15/community' >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    # DEPENDENCIES #############################################################
    apk add --update git && \
    # NODEJS ###################################################################
    apk add --update nodejs-current@community npm@community && \
    # NODEJS ###################################################################
    npm i -g vercel && \
    # CLEAN UP #################################################################
    rm -rf /var/cache/apk/*

WORKDIR /srv

CMD nodejs
