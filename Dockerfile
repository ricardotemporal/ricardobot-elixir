FROM  elixir:1.18.3-alpine

WORKDIR /usr/src/ricardobot

COPY . .

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

CMD ["mix", "run", "--no-halt"]