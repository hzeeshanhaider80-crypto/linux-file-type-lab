#!/bin/bash

#Linux server heath report

REPORT_DIR="reports/system"
mkdir -p "$REPORT_DIR"

REPORT_FILE=$REPORT_DIR/system-health-$(date + %F-%H%M%S).txt

{

echo "==================================================================="

echo "Linux  server health report "
echo "================================================================"
echo "Date: $(date)"
echo "Hostname: $(hostname)"

echo "Operating system"
cat /etc/os-release | grep -E '^(NAME|VERSION)='
echo 

echo "Uptime"
uptime

echo "Disk usage"
df -h

echo "Memory usage"
free -h

echo "Top cpu processes"
ps 

echo "IP address"
hostname -I
} > "$REPORT_FILE"
echo "Health-rport generated"
echo $REPORT_FILE
