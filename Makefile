installpath = "/usr/local/bin"
manpath = "/usr/local/man/man1"
clientdir = "/etc/icinga2/scripts/files"

files = icinga2-setup-client.sh \
		icinga2.conf \
		Icinga2-v2.6.0-x86_64.msi \
		icinga2-setup-windows-child.nsis \
		Makefile \
		icingaclient.1 \
		README.md

install: confdir nsis manpath
	cp icinga2-setup-client.sh ${installpath}/icingaclient
	cp icinga2.conf ${clientdir}/
	cp icinga2-setup-windows-child.nsis ${clientdir}/
	cp Icinga2-v2.6.0-x86_64.msi ${clientdir}/
	cp icingaclient.1 ${manpath}/
	mandb

confdir: 
	@echo "Checking for Icinga client workspace"
	@if test -d ${clientdir}; then : ; \
	else \
		mkdir ${clientdir}; \
	fi

nsis: 
	@echo "Checking for dependency: $@" 
	@if which makensis; then : ; \
	else \
		echo "$@ is a dependency but it was not found in PATH."; \
		exit 1; \
	fi

manpath:
	@echo "Checking path for manpage installation..."
	@if test -d ${manpath}; then : ; \
	else \
		mkdir -p /usr/local/man/man1 ; \
	fi

clean: 
	echo "Cleaning..."
	rm	${clientdir}/icinga2-setup-client.sh \
		${clientdir}/icinga2.conf \
		${clientdir}/icinga2-setup-windows-child.nsis \
		${clientdir}/Icinga2-v2.6.0-x86_64.msi \
		${manpath}/icingaclient.1
	mandb

dist:
	echo "Creating dist tarball..."
	@mkdir -p icingaclient
	@cp -R ${files} icingaclient/
	@tar -czf icingaclient.tgz icingaclient
	@rm icingaclient/*
	@rmdir icingaclient
