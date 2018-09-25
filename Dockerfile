FROM alpine:3.8
MAINTAINER Danilo Pereira <developer@danilo.info>

ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $HOME/.pyenv/shims:$HOME/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


## Install base packages
RUN apk add --no-cache --update \
  bash \
  curl \ 
  build-base \
  patch \
  ca-certificates \
  git \
  bzip2-dev \
  linux-headers \
  ncurses-dev \
  openssl \
  openssl-dev \
  readline-dev \
  sqlite-dev \
  libffi-dev \
  && update-ca-certificates \
  && rm -rf /var/cache/apk/*

## Install pyenv
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

RUN pyenv install 2.7.15
RUN pyenv install 3.4.9
RUN pyenv install 3.5.6
RUN pyenv install 3.6.6
RUN pyenv install 3.7.0

RUN pyenv local 2.7.15 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset

RUN pyenv local 3.4.9 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset
RUN pyenv local 3.5.6 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset
RUN pyenv local 3.6.6 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset
RUN pyenv local 3.7.0 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset

RUN pyenv local 2.7.15 3.4.9 3.5.6 3.6.6 3.7.0
