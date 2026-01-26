#!/bin/bash
(crontab -l 2>/dev/null; echo "0 9 * * * /root/backup.sh >> /var/log/backup.log 2>&1") | crontab -
echo "✅ Cron job installed: 0 9 * * * /root/backup.sh"
