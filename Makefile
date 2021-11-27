APP_REVISION = $(shell git rev-parse HEAD)

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

.DEFAULT_GOAL := usage

.PHONY: usage
usage:
	@echo
	@echo "Hi ${RED}${USER}!${NC} Welcome to ${GREEN}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make setup${NC}         run bin/setup"
	@echo "${YELLOW}make prettier${NC}      rubocop and linting"
	@echo "${YELLOW}make prettier-fix${NC}  autofix rubocop"
	@echo
	@echo "Build"
	@echo
	@echo "${YELLOW}make build${NC}         lint and test pre pushing"
	@echo

setup:
	bin/setup

prettier:
	bundle exec rubocop

prettier-fix:
	bundle exec rubocop -A .

build: prettier
	bundle exec rspec
