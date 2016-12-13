icingaclient: icingadir nsis
	cp icinga2-setup-client.sh /usr/local/bin/
	cp icinga2.conf /etc/icinga2/scripts/files/
	cp icinga2-setup-windows-child.nsis /etc/icinga2/scripts/files/

icingadir: 
	mkdir /etc/icinga2/scripts/files

nsis: 
	which nsis > /dev/null
