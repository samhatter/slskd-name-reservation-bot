FROM alpine:3.21

WORKDIR /app

COPY . .

ENV SLSKD_HTTP_PORT=1024
ENV SLSKD_NO_AUTH=true

RUN apk add --update --no-cache wget unzip icu-dev bash
RUN wget https://github.com/slskd/slskd/releases/download/0.20.1/slskd-0.20.1-linux-musl-x64.zip  && unzip slskd-0.20.1-linux-musl-x64.zip  -d /slskd

CMD ["/bin/bash", "/app/slskd-name-reservation-bot.sh"]