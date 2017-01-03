# **icingaclient** - Icinga windows installer

# SYNOPSIS
icingaclient \[client fqdn\] \[client address\] \[parent fqdn\] 
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
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<style>
table.head, table.foot { width: 100%; }
td.head-rtitle, td.foot-os { text-align: right; }
td.head-vol { text-align: center; }
table.foot td { width: 50%; }
table.head td { width: 33%; }
div.spacer { margin: 1em 0; }
</style>
<title>
ICINGACLIENT(1)</title>
</head>
<body>
<div class="mandoc">
<table class="head">
<tbody>
<tr>
<td class="head-ltitle">
ICINGACLIENT(1)</td>
<td class="head-vol">
General Commands Manual</td>
<td class="head-rtitle">
ICINGACLIENT(1)</td>
</tr>
</tbody>
</table>
<div class="section">
<h1 id="NAME">NAME</h1> <b class="name">icingaclient</b> &#8212; <span class="desc">generate a Windows installer for Icinga2</span></div>
<div class="section">
<h1 id="SYNOPSIS">SYNOPSIS</h1><table class="synopsis">
<col style="width: 12.00ex;"/>
<col/>
<tbody>
<tr>
<td>
<b class="name">icingaclient</b></td>
<td>
[<span class="opt"><i class="arg">client_fqdn</i></span>] [<span class="opt"><i class="arg">client_address</i></span>] [<span class="opt"><i class="arg">parent_fqdn</i></span>] [<span class="opt"><i class="arg">parent_address</i></span>] [<span class="opt"><i class="arg">zone_name</i></span>]</td>
</tr>
</tbody>
</table>
</div>
<div class="section">
<h1 id="DESCRIPTION">DESCRIPTION</h1> <b class="name">icingaclient</b> is a program that creates a 'one-click' installer for a Windows-based Icinga2 client. The installer automates the enrolment of the node into an existing Icinga2 cluster.<div class="spacer">
</div>
There are two usage modes. Arguments can be passed to <b class="name">icingaclient</b> from the command line. If no arguments are specified, <b class="name">icingaclient</b> will prompt the user for input. In the case where the parent zone name is not equivalent to the parent's hostname, <i class="arg">zone_name</i> may be appended after all other arguments.<div class="spacer">
</div>
<b class="name">icingaclient</b> is simply a collection of wrapper scripts. Firstly, icinga2(1) pki commands are called for SSL certificate generation. Configuration files are then built for parent and client nodes. Finally, nsis(1) bundles the generated files into a familiar 'exe' install wizard for Windows.<div style="height: 1.00em;">
&#160;</div>
</div>
<div class="section">
<h1 id="EXAMPLES">EXAMPLES</h1> Create an installer for a Windows host called <i class="file">dc01.business.com</i> whose parent Icinga instance is <i class="file">icingahq.business.com</i><blockquote style="margin-top: 0.00em;margin-bottom: 0.00em;">
<div class="display">
<code class="lit">$ icingaclient dc01.business.com 10.0.0.25 icingahq.business.com 10.0.0.15</code></div>
</blockquote>
<div style="height: 1.00em;">
&#160;</div>
Configure a client in an icinga zone where the zone name is not the same as the hostname of the parent.<blockquote style="margin-top: 0.00em;margin-bottom: 0.00em;">
<div class="display">
<code class="lit">$ icingaclient dc01.business.com 10.0.0.25 icingahq.business.com 10.0.0.15 master-zone</code></div>
</blockquote>
<div style="height: 1.00em;">
&#160;</div>
</div>
<div class="section">
<h1 id="SEE_ALSO">SEE ALSO</h1> <a class="link-man">icinga2(1)</a>, <a class="link-man">makensis(1)</a>, and the official Icinga2 documentation at <a class="link-ext" href="https://docs.icinga.org/icinga2/latest/">https://docs.icinga.org/icinga2/latest/</a></div>
<table class="foot">
<tbody>
<tr>
<td class="foot-date">
January 3, 2017</td>
<td class="foot-os">
OpenBSD 6.0</td>
</tr>
</tbody>
</table>
</div>
</body>
</html>

