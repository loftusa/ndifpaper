COPY_FILES = $(patsubst src/%,output/%,$(wildcard src/*) $(wildcard src/*/*))

all: $(COPY_FILES)

output/%: src/%
	echo $@
	cp -r -f -v -T $< $@

deploy:
	rsync -a --info=name src/ output/ --exclude=.git/*
