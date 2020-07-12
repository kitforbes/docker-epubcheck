FROM alpine:3.3

RUN set -eux; \
  apk add \
    bash \
    curl \
    unzip \
    openjdk7 \
  --no-cache

ARG EPUBCHECK_VERSION=4.2.2
ENV EPUBCHECK epubcheck-$EPUBCHECK_VERSION

RUN set -eux; \
  curl -fsSL \
    -o "/tmp/$EPUBCHECK.zip" \
    --url "https://github.com/w3c/epubcheck/releases/download/v${EPUBCHECK#*-}/$EPUBCHECK.zip" && \
  unzip -q -o "/tmp/$EPUBCHECK.zip" -d /app && \
  ln -sv "/app/$EPUBCHECK" /app/epubcheck && \
  rm -rfv \
    "/tmp/$EPUBCHECK.zip" \
    /app/epubcheck/*.txt \
    /app/epubcheck/licenses \
  && \
  ls -lhAF /tmp /app

VOLUME ["/app/data"]
WORKDIR /app

ENTRYPOINT ["java", "-jar", "/app/epubcheck/epubcheck.jar"]
CMD [ "--version" ]
