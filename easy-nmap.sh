#!/bin/bash

figlet r4vindra
# Check if an argument is provided
echo "Its an Easy and Simple nmap Scan, Scnannig OS and Services Version using default Scripts!"
echo "-----------------------------------------------------------------------------------------"
if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi
read -p "Port numbers to scan. EX: 22,80,443,etc : " PORTS
echo "---------------------------------------------"
echo "---------------------------------------------"
target="$1"
timestamp=$(date +"%Y%m%d_%H%M%S")
output_file="$target-nmap-scan.txt"

# Perform the Nmap scan
echo "Running Nmap scan on $target..."
if [ -n "$PORTS" ]; then
	nmap -v -p $PORTS -A -O -sVC -oN "$output_file" "$target"
elif
	[ -z "$PORTS" ]; then
	echo "You Have Not Defined any Specific Ports, So All Ports are being Scanned."
	echo "------------------------------------------------------------------------"
	echo "------------------------------------------------------------------------"
	nmap -v -p- -A -O -sVC -oN "$output_file" "$target"
else
	echo "Unexpected Arguement!"
fi

echo "Scan completed. Results saved in: $output_file"
