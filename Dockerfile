# Elixir 1.4: https://hub.docker.com/_/elixir/
FROM elixir:1.4

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Install the Phoenix (1.2) framework itself
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# Install NodeJS 6.x and the NPM
# You should skip this part if you're going to build an API
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs

# Set /app as workdir
RUN mkdir /app
ADD . /app
WORKDIR /app