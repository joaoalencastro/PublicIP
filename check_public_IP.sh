#!/bin/bash

# Program to check my public IP address information

TIMESTAMP="$(date +"%x %r %Z")"
IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
LOG_FILE=/var/log/public_ip.log

if [ -f "$LOG_FILE" ]; then
	# The file is there
	:
else
	# Create the file
	touch /var/log/public_ip.log
fi

echo "$TIMESTAMP - My public IP was $IP" >> /var/log/public_ip.log
