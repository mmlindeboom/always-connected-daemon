#!/bin/bash
AIRPORT="en1"; #may be en0, use networksetup -listallhardwareports to check
WIFI_NETWORK_NAME="YOUR_WIRELESS_NETWORK_NAME"
WIFI_PASSWORD="YOUR_PASSWORD"
THE_DATE=$(date)
# Check to see if connected to WIFI_NETWORK_NAME every 20 seconds
function connect {
    networksetup -setairportpower $AIRPORT off
	networksetup -setairportpower $AIRPORT on
	sleep 2

	if networksetup -getairportnetwork $AIRPORT | grep -i -a $WIFI_NETWORK_NAME ;
	then
	    echo 'Connected!';
	fi

	if networksetup -setairportnetwork $AIRPORT $WIFI_NETWORK_NAME $WIFI_PASSWORD | grep -i -a "Failed" ;
	then
	    echo 'Failed to connect, just restarting...';
	    networksetup -setairportpower $AIRPORT off
	    networksetup -setairportpower $AIRPORT on
	    sleep 1
	fi

	networksetup -getairportnetwork $AIRPORT
}

while true; 
do
	echo 'Checking on' $THE_DATE
	if networksetup -getairportnetwork $AIRPORT | grep -i -a $WIFI_NETWORK_NAME  ;
	then
		echo "Connected"
	else 
		connect
	fi
	sleep 20
done

