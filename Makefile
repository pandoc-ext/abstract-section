FILTER_FILE := $(wildcard *.lua)
DIFF ?= diff
PANDOC ?= pandoc

.PHONY: test
test: test-hrule test-in-div

test-%: $(FILTER_FILE) test/input-%.md test/test-%.yaml
	@$(PANDOC) --defaults test/test-$*.yaml | \
	    $(DIFF) test/expected-$*.md -
