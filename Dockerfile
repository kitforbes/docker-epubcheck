FROM alpine:3.18.4

ARG VERSION=5.0.1

RUN set -eux; \
  apk add --no-cache \
    curl \
    openjdk8 \
    unzip \
  && \
  curl -fsSL \
    -o "/tmp/epubcheck-$VERSION.zip" \
    --url "https://github.com/w3c/epubcheck/releases/download/v${VERSION}/epubcheck-$VERSION.zip" && \
  unzip -q -o "/tmp/epubcheck-$VERSION.zip" -d /app && \
  ln -sv "/app/epubcheck-$VERSION" /app/epubcheck && \
  rm -rfv \
    "/tmp/epubcheck-$VERSION.zip" \
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
