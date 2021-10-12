MKFILE_DIR := $(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

UNAME_S=$(shell uname -s)
ifeq ($(UNAME_S),Linux)
	GOOS := linux
endif
ifeq ($(UNAME_S),Darwin)
	GOOS := darwin
endif

