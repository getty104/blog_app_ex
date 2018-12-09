FROM elixir:latest

ENV NODE_VERSION 8.x

RUN apt-get update -yq && apt-get install -yq apt-transport-https build-essential libpq-dev postgresql postgresql-contrib graphviz
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
  && apt-get install -y nodejs

RUN wget -q -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yq && apt-get install -yq yarn

RUN apt install -y inotify-tools

RUN mix local.hex --force && \
  mix archive.install hex phx_new 1.4.0 --force

WORKDIR ./blog_app
