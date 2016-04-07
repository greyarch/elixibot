docker run -v `pwd`:/work -w /work --rm -it --net=host -e MIX_ENV=prod msaraiva/elixir-dev:1.2.2 /bin/sh -c "mix hex.info && mix deps.get && mix deps.compile && mix compile"
