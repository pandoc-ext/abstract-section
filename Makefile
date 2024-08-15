FILTER_FILE := $(wildcard *.lua)
DIFF ?= diff
PANDOC ?= pandoc

.PHONY: test
test:
	pandoc lua test/runtests.lua test/perevirky
