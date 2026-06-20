#!/bin/bash
LOGFILE="$HOME/system_monitor1.log"

echo "========================" >> "$LOGFILE"
echo "Timestamp: $(date) " >> "$LOGFILE"

echo "CPU LOAD: ">> "$LOGFILE"
top -bn1 | grep "Cpu(s)" >> "$LOGFILE"

echo "MEMORY USAGE: " >> "$LOGFILE"
free -h >> "$LOGFILE"

echo "Disk Usage :" >> "$LOGFILE"
df -h / >> "$LOGFILE"

echo "" >> "$LOGFILE"
