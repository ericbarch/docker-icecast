FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt -y update && \
  apt -y full-upgrade && \
  apt -y install icecast2 && \
  apt -y autoclean && \
  apt clean

RUN chown -R icecast2: /etc/icecast2

USER icecast2

ENTRYPOINT ["icecast2"]
CMD ["-c", "/etc/icecast2/icecast.xml"]

EXPOSE 8000
