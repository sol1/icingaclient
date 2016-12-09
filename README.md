# **icingaclient** - Icinga windows installer

# SYNOPSIS
icingaclient \[*client fqdn*\] \[client address\] \[parent fqdn\] 
\[parent address\] \[zone name\]

# DESCRIPTION
icingaclient(1) generates a Windows installer file allowing one-click
configuration and enrolment of a Windows client in an Icinga2 cluster. 

It wraps the icinga2 commands for signed SSL certificate generation and fills
out icinga2 configuration templates. Finally it calls **nsis** to bundle the
generated files into a Windows installer. 

Parameters can be passed into **icingaclient** from the command line. If no 
arguments are specified, **icingaclient** will prompt the user for input.

# EXAMPLES
