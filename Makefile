installpath = "/usr/local/bin"
manpath = "/usr/local/man/man1"
clientdir = "/etc/icinga2/scripts/files"

files = icingaclient.sh \
		icinga2.conf \
		Icinga2-v2.6.0-x86_64.msi \
		icinga2-setup-windows-child.nsis \
		Makefile \
		icingaclient.1 \
		README.md

install: confdir nsis manpath
	cp icingaclient.sh ${installpath}/icingaclient
	cp icinga2.conf ${clientdir}/
	cp icinga2-setup-windows-child.nsis ${clientdir}/
	cp Icinga2-v2.6.0-x86_64.msi ${clientdir}/
	cp icingaclient.1 ${manpath}/
	mandb

confdir: 
	@echo "Checking for Icinga client workspace"
	@mkdir -p ${clientdir}

nsis: 
	@echo "Checking for dependency: $@" 
	@which makensis

manpath:
	@echo "Checking path for manpage installation..."
	@mkdir -p ${manpath}

clean: 
	echo "Cleaning..."
	rm	${clientdir}/icingaclient.sh \
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
