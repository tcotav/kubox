FROM alpine:3.3
RUN apk add --no-cache curl
RUN apk add --no-cache tcpdump
ENTRYPOINT ["sh"]
