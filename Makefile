.PHONY: clean build setup

build:
	dune build && dune build @melange

clean:
	dune clean

setup:
	opam install melange.1.0.0 dune.3.8.0
