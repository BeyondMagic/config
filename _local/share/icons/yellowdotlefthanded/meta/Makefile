all:
	$(MAKE) -C sources

	@echo -e "\n************\n\nCursors were correctly created. Type 'make install' now.\n \n************\n"
install:
	$(MAKE) install -C sources
	@echo -e "\n************\n\nCongratulations. Cursors were correctly installed.\n\n************\n"
old: all
	$(MAKE) -C sources_old
	@echo -e "\n************\n\nOld style cursors were correctly created. Type 'make install_old' now.\n \n************\n"
install_old: install
	$(MAKE) install -C sources_old
	@echo -e "\n************\n\nOld style cursors properly added.\n\n************\n"
clean:
	rm -rf cursors/* cursors_old/*
