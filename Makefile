installpath = "/usr/local/bin"
clientdir = "/etc/icinga2/scripts/files"

files = icinga2-setup-client.sh \
		icinga2.conf \
		Icinga2-v2.5.4-x86_64.msi \
		icinga2-setup-windows-child.nsis \
		Makefile \
		README.md

install: confdir nsis
	cp icinga2-setup-client.sh ${installpath}/icinga2-setup-client
	cp icinga2.conf ${clientdir}/
	cp icinga2-setup-windows-child.nsis ${clientdir}/
	cp Icinga2-v2.5.4-x86_64.msi ${clientdir}/

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
		echo "$@ is a dependency but its binary was not found in PATH."; \
		exit 1; \
	fi

clean: 
	@echo "Cleaning..."
	rm	${clientdir}/icinga2-setup-client.sh \
		${clientdir}/icinga2.conf \
		${clientdir}/icinga2-setup-windows-child.nsis \
		${clientdir}/Icinga2-v2.5.4-x86_64.msi

dist:
	@echo "Creating dist tarball..."
	@mkdir -p icingaclient
	@cp -R ${files} icingaclient/
	@tar -czf icingaclient.tgz icingaclient
	@rm icingaclient/*
	@rmdir icingaclient
