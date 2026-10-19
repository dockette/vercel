FROM dockette/alpine:3.24

RUN apk update && apk upgrade && \
    # DEPENDENCIES #############################################################
    apk add --no-cache git && \
    # NODEJS ###################################################################
    apk add --no-cache nodejs npm && \
    # VERCEL ###################################################################
    npm i -g vercel && \
    # CLEAN UP #################################################################
    npm cache clean --force && \
    rm -rf /var/cache/apk/*

WORKDIR /srv

CMD ["node"]
