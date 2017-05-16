prog=       icingaclient

bindir=     /usr/local/bin
agentdir=   /var/${prog}
libdir=     /usr/local/lib/${prog}
msi=        Icinga2-v2.6.3-x86_64.msi

sharedir=   /usr/local/share/${prog}
nsis=       buildclient.nsis
templates=  agent.conf childnode.conf

man1=       ${prog}.1
man1dir=    /usr/local/man/man1
man5=       icinga2.conf.5 
man5dir=    /usr/local/man/man5


# The default target 'build' checks and gathers dependencies.
build: ${prog} ${man} ${msi} ${nsis} ${templates}

${prog}: icingaclient.sh
	cp icingaclient.sh $@

${msi}:
	@echo "Downloading $@..."
	curl -O https://packages.icinga.com/windows/$@

${sharedir}/${msi}: ${msi}
	install -Dm 555 ${msi} $@

makensis:
	@echo "Checking for dependency package $@..."
	@which $@

${agentdir}:
	mkdir -p $@

# After a build, install the program.
install: build ${sharedir}/${msi} makensis ${agentdir} ${sharedir}
	install -m 444 ${man1} ${man1dir}/
	install -m 444 ${man5} ${man5dir}/
	install -m 444 ${nsis} ${sharedir}/${nsis}
	@for f in ${templates}; do \
		install -m 444 $$f ${sharedir}/$$f; \
		echo "Installed $$f in ${sharedir}"; \
	done
	install -m 755 ${prog} ${bindir}

# Useful target for creating a tarball of a build to deploy to Icinga2 hosts
# which do not have access to the internet.
dist: build Makefile
	@echo "Creating tarball ${prog}.tar.gz..."
	@mkdir -p $@
	@cp -R ${prog} ${man} ${msi} ${nsis} ${templates} Makefile $@/
	@tar -f icingaclient.tar.gz -cz $@
	@rm $@/*
	@rmdir $@

# Not a 'real' target since clean deletes temporary working files.
.PHONY: clean
clean:
	rm -f ${prog} ${msi} ${prog}.tar.gz
