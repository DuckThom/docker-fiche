FROM alpine:3.4

MAINTAINER Thomas Wiringa thomas.wiringa@gmail.com

RUN apk add --no-cache \
    build-base \
    git \
    make \
    gcc

RUN git clone https://github.com/solusipse/fiche.git \
    && cd /fiche \
    && make

RUN mkdir /app \
    && mv /fiche/fiche /app/ \
    && rm -vrf /fiche

COPY . /app/
WORKDIR /app/

EXPOSE 9999

ENTRYPOINT ["/app/docker-entrypoint.sh"]
