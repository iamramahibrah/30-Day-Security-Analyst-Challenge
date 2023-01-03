#!/bin/bash

# Store the target IP address or hostname in a variable
target=$1

# Run the nmap scan with the options provided
nmap -p 1-65535 -O -sV -sC -A $target
