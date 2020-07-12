FROM alpine:3.3

ARG EPUBCHECK_VERSION=4.2.4
ENV EPUBCHECK epubcheck-$EPUBCHECK_VERSION

RUN set -eux; \
  apk add --no-cache \
    curl \
    openjdk7 \
    unzip \
  && \
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
  ls -lhAF /tmp /app && \
  apk del --no-cache \
    curl \
    unzip \
  ;

VOLUME ["/app/data"]
WORKDIR /app

ENTRYPOINT ["java", "-jar", "/app/epubcheck/epubcheck.jar"]
CMD [ "--version" ]
