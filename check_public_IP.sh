#!/bin/bash

# Program to check my public IP address information

TIMESTAMP="$(date +"%x %r")"
TIMESTAMP2="$(date +%s)"
IP="$(dig +short myip.opendns.com @208.67.222.222)"
LOG_FILE=/var/log/public_ip.log
MAX_LOG_FILE_SIZE=2048

if [ -f "$LOG_FILE" ]; then
	# The file is there
	:
else
	# Create the file
	touch /var/log/public_ip.log
fi

# Get file size in bytes
LOG_FILE_SIZE=`du -b $LOG_FILE | tr -s '\t' ' ' | cut -d' ' -f1`

# Compare to rotate
if [ $LOG_FILE_SIZE -gt $MAX_LOG_FILE_SIZE ]; then
	mv $LOG_FILE $LOG_FILE.$TIMESTAMP
fi

echo "$TIMESTAMP - My public IP was $IP" >> $LOG_FILE
