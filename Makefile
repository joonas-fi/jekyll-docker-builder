NAME = joonas/jekyll-builder
VERSION = 0.1.0

.PHONY: all build

all: build

build:
	docker build -t $(NAME):$(VERSION) .
