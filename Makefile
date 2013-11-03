NAME=phonegap

.PHONY: clean

all: $(NAME)

$(NAME): description/$(NAME).ml
	 ocamlfind ocamlopt -shared -package goji_lib $< -o description/$@.cmxs
	 goji generate -d . description/$@.cmxs
	 cd $@ && export OCAMLPATH="../" && make && make doc

clean:
	-rm -rf */*.cm* */*.o *~ */*~ $(NAME)