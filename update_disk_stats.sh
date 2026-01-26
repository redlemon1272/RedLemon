#!/bin/bash
# Updates disk stats for the edge function to read
df -B1 / | tail -1 | awk '{print "{\"total_bytes\": " $2 ", \"used_bytes\": " $3 ", \"free_bytes\": " $4 "}"}' > /root/supabase/docker/volumes/functions/disk_stats.json
