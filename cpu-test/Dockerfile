FROM alpine:3.14
MAINTAINER Marwan Attar
RUN apk add --no-cache --upgrade bash
RUN apk --no-cache add curl
COPY cpu.sh cpu.sh
RUN chmod +x cpu.sh
ENTRYPOINT ["./cpu.sh"]
