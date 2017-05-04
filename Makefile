prog=       icingaclient

bindir=     /usr/local/bin
agentdir =  "/var/${prog}"
libdir=     /usr/local/lib/${prog}
msi=        Icinga2-v2.6.3-x86_64.msi

sharedir=   /usr/local/share/${prog}
templates=  agent.conf childnode.conf
nsis=       buildclient.nsis

mandir =    /usr/local/man/man1
man=        ${prog}.1

# The default target 'build' checks and gathers dependencies.
build: ${prog} ${man} ${msi} ${nsis} ${templates}

${prog}: icingaclient.sh
	cp icingaclient.sh $@

${msi}:
	@echo "Downloading $@..."
	curl -O https://packages.icinga.com/windows/$@

${libdir}/${msi}: ${msi}
	install -Dm 555 ${msi} $@

makensis:
	@echo "Checking for dependency package $@..."
	@which $@

${agentdir}:
	mkdir -p $@

# After a build, install the program.
install: build ${libdir}/${msi} makensis  ${agentdir}
	install -m 444 ${man} ${mandir}
	install -m 444 ${nsis} ${sharedir}
	@for f in ${templates}; do \
		install -Dm 444 $$f ${sharedir} \
		echo "Installed $$f in ${sharedir}"; \
	done
	install -m 755 ${prog} ${bindir}

# Useful target for creating a tarball of a build to deploy to Icinga2 hosts
# which do not have access to the internet.
dist: build
	@echo "Creating tarball ${prog}.tar.gz..."
	@mkdir -p $@
	@cp -R ${prog} ${man} ${msi} ${nsis} ${templates} $@/
	@tar -f icingaclient.tar.gz -cz $@
	@rm $@/*
	@rmdir $@

# Not a 'real' target since clean deletes temporary working files.
.PHONY: clean
clean:
	rm -f ${prog} ${msi} ${prog}.tar.gz
