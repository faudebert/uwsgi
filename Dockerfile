FROM debian:buster

ENV LANG=C.UTF-8
ENV PYTHONUNBUFFERED=1

RUN groupadd --gid 1000 platform && \
  adduser --gecos ',,,' --uid 1000 --gid 1000 --disabled-password platform && \
  mkdir -p /usr/src/app && \
  chown platform:platform /usr/src/app && \
  apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    python3-virtualenv \
    uwsgi \
    uwsgi-plugin-python3 && \
  pip3 install Django==3.2.18

WORKDIR /usr/src/app
USER platform

ENTRYPOINT ["/usr/bin/uwsgi"]
