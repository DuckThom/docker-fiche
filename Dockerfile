FROM alpine:3.4

MAINTAINER Thomas Wiringa thomas.wiringa@gmail.com

RUN apk add --no-cache --virtual .build-deps \
    build-base \
    make \
    git \
    gcc

RUN git clone https://github.com/solusipse/fiche.git \
    && cd /fiche \
    && make

RUN mkdir /app \
    && mv /fiche/fiche /app/ \
    && rm -vrf /fiche

RUN apk del .build-deps

COPY . /app/
WORKDIR /app/

EXPOSE 9999

ENTRYPOINT ["/app/docker-entrypoint.sh"]
