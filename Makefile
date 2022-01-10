include config.mk

HOMEDIR = $(shell pwd)

build:
	mdzk build

pushall: sync
	git push origin main

sync:
	rsync -a $(HOMEDIR)/html $(USER)@$(SERVER):$(APPDIR) --exclude node_modules/ \
		--omit-dir-times --no-perms

set-up-server-dir:
	ssh $(USER)@$(SERVER) "mkdir -p $(APPDIR)"
