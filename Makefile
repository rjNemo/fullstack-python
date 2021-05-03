.PHONY: install
install:
	pipenv install
.PHONY: run
run:
	mkdocs serve
.PHONY: build
build:
	mkdocs build