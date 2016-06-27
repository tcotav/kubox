FROM alpine:3.4
RUN apk add --no-cache curl
RUN apk add --no-cache tcpdump
RUN apk add --no-cache python
ENTRYPOINT ["sh"]
