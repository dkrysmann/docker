#
# Dockerfile for openrefine
#

FROM java:8-jre-alpine
# Identify the maintainer of an image
MAINTAINER My Name "dkrysmann@gmail.com"


ENV OPENREFINE_VERSION 3.0
ENV OPENREFINE_FILE openrefine-linux-${OPENREFINE_VERSION}.tar.gz
ENV OPENREFINE_URL https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl jq tar \
    && curl -sSL ${OPENREFINE_URL} | tar xz --strip 1

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data"]
