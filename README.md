always-connected-daemon
=======================
---

Daemon checks airport connection every 20 seconds, reconnects you in the case you've been disconnected.

Edit checkconnection.sh variables:
---

```bash
WIFI_NETWORK_NAME="YOUR_WIRELESS_NETWORK_NAME"
WIFI_PASSWORD="YOUR_PASSWORD"
```

*If your WiFi network name has any whitespace in it, escape the space with \s. For example:
"My Network" would be:

```bash
WIFI_NETWORK_NAME="My\sNetwork\sWith\sWhite\sSpaces"
```

Edit check.connection.plist:
---
```xml
<dict>
<key>Label</key>
<string>check.connection</string>
<key>ProgramArguments</key>
    <array>
        <string>path/to/home/bin/checkconnection.sh</string>
    </array>
</dict>
```

*Path should begin at /root. Do not use ~/. For example: 

> /Users/username/bin/checkconnection.sh

Install checkconnection.sh script:
---

1. Place checkconnection.sh in ~/bin/
2. Make checkconnection.sh executable:

```bash
chmod a+x ~/bin/checkconnection.sh
```

Create [launchd][appleDoc] daemon:
---

1. Place check.connection.plist in ~/Library/LaunchAgents/
2. Load check.connection.plist into launchctl, to launch at start up:

```bash
launchctl load ~/Library/LaunchAgents/check.connection.plist
```

Optional: To start using Daemon right away use 

```bash
launchctl start check.connection
```

Otherwise it will launch when you restart your computer.

[appleDoc]: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man8/launchd.8.html