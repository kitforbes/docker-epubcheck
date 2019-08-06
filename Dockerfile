FROM alpine:3.3

RUN apk add --update bash curl unzip openjdk7 && \
  rm /var/cache/apk/*

ARG EPUBCHECK_VERSION
ENV EPUBCHECK epubcheck-$EPUBCHECK_VERSION

RUN curl -L -o "/tmp/$EPUBCHECK.zip" "https://github.com/w3c/epubcheck/releases/download/v${EPUBCHECK#*-}/$EPUBCHECK.zip" \
  && unzip "/tmp/$EPUBCHECK.zip" -d /app \
  && rm "/tmp/$EPUBCHECK.zip" \
  && ( cd /app; ln -s "$EPUBCHECK" epubcheck )

VOLUME ["/app/data"]
WORKDIR /app

ENTRYPOINT ["java", "-jar", "/app/epubcheck/epubcheck.jar"]
