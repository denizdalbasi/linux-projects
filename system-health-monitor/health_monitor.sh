#!/bin/bash

LOG_DIR="/home/ubuntu/logs"
LOG_FILE="$LOG_DIR/health.log"
DISCORD_WEBHOOK="YOUR_DISCORD_WEBHOOK_URL_HERE"

mkdir -p "$LOG_DIR"

CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 155 - $8}')
RAM_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

echo "[$CURRENT_DATE] CPU: ${CPU_USAGE}% | RAM: ${RAM_USAGE}% | Disk: ${DISK_USAGE}%" >> "$LOG_FILE"

find "$LOG_DIR" -type f -mtime +7 -exec rm {} \;

if [ "$CPU_USAGE" -gt 80 ] && [ "$DISCORD_WEBHOOK" != "YOUR_DISCORD_WEBHOOK_URL_HERE" ]; then
    MESSAGE="{\"content\": \"⚠️ **ALERT:** High CPU usage detected on server! Current CPU: ${CPU_USAGE}% at $CURRENT_DATE\"}"
    curl -H "Content-Type: application/json" -X POST -d "$MESSAGE" "$DISCORD_WEBHOOK"
fi
