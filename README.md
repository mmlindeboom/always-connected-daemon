always-connected-daemon
=======================

Daemon checks airport connection every 20 seconds, reconnects you in the case you've been disconnected.


Edit checkconnection.sh variables:
===================================

WIFI_NETWORK_NAME*
WIFI_PASSWORD

*If your Wifi network name has a space in it, escape the space with \s. For example: 
"My Network" would be:

<pre><code>WIFI_NETWORK_NAME="My\sNetwork"</code></pre>

Edit check.connection.plist:
===========================
<pre><code><string>path/to/home/bin/checkconnection.sh</string></code></pre>

*Path should begin at /root. Do not use ~/. For example: 

<pre><code><string>/Users/username/bin/checkconnection.sh</string></code></pre>


Install checkconnection.sh script:
=====================================

1. Place checkconnection.sh in ~/bin/
2. Make checkconnection.sh executable: 

<pre><code>chmod 777 ~/bin/checkconnection.sh</code></pre>


Create [launchd](https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man8/launchd.8.html) daemon:
=====================

1. Place check.connection.plist in ~/Library/LaunchAgents/
2. Load check.connection.plist into launchctl, to launch at start up:

<pre><code>launchctl load ~/Library/LaunchAgents/rokkan.wificonnect.plist</code></pre>

Optional: To start using Daemon right away use 

<pre><code>launchctl start check.connection</code></pre>

Otherwise it will launch when you restart your computer.

