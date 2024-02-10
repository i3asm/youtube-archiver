#!/bin/bash
# Start cron
cron
# Tail the cron log in the foreground to keep the container running and display logs
tail -f /var/log/cron.log

python3 youtube_dl_script.py