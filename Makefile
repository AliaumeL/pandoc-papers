# Makefile for installing and removing pandoc-papers templates and defaults

# Repository name used for the defaults file
REPO_NAME := pandoc-papers

# Pandoc directories (using modern directory structure)
PANDOC_DATA_DIR := $(HOME)/.local/share/pandoc
PANDOC_TEMPLATES_DIR := $(PANDOC_DATA_DIR)/templates
PANDOC_DEFAULTS_DIR := $(PANDOC_DATA_DIR)/defaults

# Fallback to old directory structure if it exists
ifeq ($(wildcard $(HOME)/.pandoc),$(HOME)/.pandoc)
	PANDOC_DATA_DIR := $(HOME)/.pandoc
	PANDOC_TEMPLATES_DIR := $(PANDOC_DATA_DIR)/templates
	PANDOC_DEFAULTS_DIR := $(PANDOC_DATA_DIR)/defaults
endif

# Paper styles to install
STYLES := acmart lipics lncs plain

# Get the absolute path of the current directory
REPO_DIR := $(shell pwd)

.PHONY: help install remove clean

help:
	@echo "Pandoc Papers - Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  install  - Install templates and defaults to Pandoc directories"
	@echo "  remove   - Remove templates and defaults from Pandoc directories"
	@echo "  clean    - Remove generated files (same as remove)"
	@echo ""
	@echo "Installation directories:"
	@echo "  Templates: $(PANDOC_TEMPLATES_DIR)"
	@echo "  Defaults:  $(PANDOC_DEFAULTS_DIR)"

install:
	@echo "Installing pandoc-papers templates and defaults..."
	@mkdir -p $(PANDOC_TEMPLATES_DIR)
	@mkdir -p $(PANDOC_DEFAULTS_DIR)
	@# Install each style directory to templates
	@for style in $(STYLES); do \
		echo "Installing $$style style..."; \
		mkdir -p $(PANDOC_TEMPLATES_DIR)/$$style; \
		cp -r $$style/* $(PANDOC_TEMPLATES_DIR)/$$style/; \
	done
	@# Install filters directory
	@echo "Installing filters..."
	@mkdir -p $(PANDOC_TEMPLATES_DIR)/filters
	@cp -r filters/* $(PANDOC_TEMPLATES_DIR)/filters/
	@# Install defaults files
	@for style in $(STYLES); do \
		echo "Installing $$style defaults..."; \
		cp $$style/defaults.yaml $(PANDOC_DEFAULTS_DIR)/$(REPO_NAME)-$$style.yaml; \
	done
	@echo ""
	@echo "Installation complete!"
	@echo ""
	@echo "You can now use the templates with:"
	@echo "  pandoc --defaults=$(REPO_NAME)-acmart input.md -o output.tex"
	@echo "  pandoc --defaults=$(REPO_NAME)-lipics input.md -o output.tex"
	@echo "  pandoc --defaults=$(REPO_NAME)-lncs input.md -o output.tex"
	@echo "  pandoc --defaults=$(REPO_NAME)-plain input.md -o output.tex"

remove:
	@echo "Removing pandoc-papers templates and defaults..."
	@# Remove style directories from templates
	@for style in $(STYLES); do \
		if [ -d "$(PANDOC_TEMPLATES_DIR)/$$style" ]; then \
			echo "Removing $$style style..."; \
			rm -rf $(PANDOC_TEMPLATES_DIR)/$$style; \
		fi; \
	done
	@# Remove filters directory
	@if [ -d "$(PANDOC_TEMPLATES_DIR)/filters" ]; then \
		echo "Removing filters..."; \
		rm -rf $(PANDOC_TEMPLATES_DIR)/filters; \
	fi
	@# Remove defaults files
	@for style in $(STYLES); do \
		if [ -f "$(PANDOC_DEFAULTS_DIR)/$(REPO_NAME)-$$style.yaml" ]; then \
			echo "Removing $$style defaults..."; \
			rm -f $(PANDOC_DEFAULTS_DIR)/$(REPO_NAME)-$$style.yaml; \
		fi; \
	done
	@echo ""
	@echo "Removal complete!"

clean: remove
