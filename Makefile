EXE=flatflatpak

.PHONY: install
install:
	mkdir -p ~/bin
	cp $(EXE).sh ~/bin/$(EXE)

.PHONY: uninstall
uninstall:
	rm ~/bin/$(EXE)
