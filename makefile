CMD   := flush-dns
SRC   := ./$(CMD).sh
TGT   := /usr/local/bin/$(CMD)
ROOT  := $(shell id -nu 0)
WHEEL := $(shell id -ng 0)

define USAGE

To install, run 'sudo make install'.
To uninstall, run 'sudo make uninstall'.
endef

all:
	$(error $(USAGE))

install:
	@cp $(SRC) $(TGT)
	@chmod 0755 $(TGT)
	@chown $(ROOT):$(WHEEL) $(TGT)
	@echo $(TGT): installed. Try running "'$(CMD)'" from your shell. prompt.

uninstall:
	@rm -f $(TGT)
	@echo $(TGT): removed
