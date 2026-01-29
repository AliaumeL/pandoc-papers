.PHONY: install uninstall create-dirs stow update

# find where pandoc stores its data files
# as described here <https://pandoc.org/demo/example33/3.1-general-options.html>

XDG_DATA_HOME_STUB = $(shell [ -n "$$XDG_DATA_HOME" ] && echo "$$XDG_DATA_HOME" || echo "$$HOME/.local/share")


# 1. Check if XDG_DATA_HOME is set, if so
#    1a. Check if XDG_DATA_HOME/pandoc exists, if so, use it
#    1b. See if ~/.pandoc exists, if so, use it
#    	  1bi. If neither exists, use XDG_DATA_HOME/pandoc and create it
# 2. If XDG_DATA_HOME is not set
# 3. If neither exists, use
# 1. See if  XDG_DATA_HOME/pandoc exists
HAS_XDG_PANDOC = $(shell [ -n "$$XDG_DATA_HOME_STUB" ] && [ -d "$$XDG_DATA_HOME_STUB/pandoc" ] && echo "yes" || echo "no")
# 2. Try ~/.pandoc
HAS_HOME_PANDOC = $(shell [ -d "$$HOME/.pandoc" ] && echo "yes" || echo "no")

ifeq ($(HAS_XDG_PANDOC),yes)
PANDOC_INSTALL_DIR = $(XDG_DATA_HOME_STUB)/pandoc
else ifeq ($(HAS_HOME_PANDOC),yes)
PANDOC_INSTALL_DIR = $(HOME)/.pandoc
else
PANDOC_INSTALL_DIR = $(XDG_DATA_HOME_STUB)/pandoc
endif

# List all files concerned with installation and uninstallation
FILTERS = $(find filters -type f -name '*.lua')
DEFAULTS = $(find defaults -type f -name '*.yaml')
TEMPLATES = $(find templates -type d)



install: create-dirs
	@echo "Installing pandoc-papers to $(PANDOC_INSTALL_DIR)"
	mkdir -p $(PANDOC_INSTALL_DIR)/defaults
	mkdir -p $(PANDOC_INSTALL_DIR)/filters
	mkdir -p $(PANDOC_INSTALL_DIR)/templates
	@echo "Copying filters to $(PANDOC_INSTALL_DIR)/filters"
	cp -r filters/* $(PANDOC_INSTALL_DIR)/filters/
	@echo "Copying templates to $(PANDOC_INSTALL_DIR)/templates"
	cp -r templates/* $(PANDOC_INSTALL_DIR)/templates/
	@echo "Copying default YAML files to $(PANDOC_INSTALL_DIR)/defaults"
	cp -r defaults/* $(PANDOC_INSTALL_DIR)/defaults/
	@echo "Installation complete."

create-dirs:
	mkdir -p $(PANDOC_INSTALL_DIR)/defaults
	mkdir -p $(PANDOC_INSTALL_DIR)/filters
	mkdir -p $(PANDOC_INSTALL_DIR)/templates

update: 
	git pull origin main


stow: create-dirs
	@echo "Stowing pandoc-papers to $(PANDOC_INSTALL_DIR)"
	stow --target=$(PANDOC_INSTALL_DIR) --dir=pandoc-papers .
	@echo "Stow complete."

unstow:
	@echo "Unstowing pandoc-papers from $(PANDOC_INSTALL_DIR)"
	stow --target=$(PANDOC_INSTALL_DIR) --dir=pandoc-papers -D .
	@echo "Unstow complete."

	
uninstall:
	@echo "Uninstalling pandoc-papers from $(PANDOC_INSTALL_DIR)"
	@echo "Removing filters from $(PANDOC_INSTALL_DIR)/filters"
	for file in $(FILTERS); do \
		rm -f $(PANDOC_INSTALL_DIR)/filters/$(basename $$file); \
	done
	@echo "Removing templates from $(PANDOC_INSTALL_DIR)/templates"
	for dir in $(TEMPLATES); do \
		rm -rf $(PANDOC_INSTALL_DIR)/templates/$(basename $$dir); \
	done
	@echo "Removing default YAML files from $(PANDOC_INSTALL_DIR)/defaults"
	for file in $(DEFAULTS); do \
		rm -f $(PANDOC_INSTALL_DIR)/defaults/$(basename $$file); \
	done
	@echo "Uninstallation complete."	
