FROM ubuntu:xenial

RUN apt update
RUN apt install -y xnbd-server

COPY entrypoint.sh /entrypoint.sh

EXPOSE 10809

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
