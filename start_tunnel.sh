#!/usr/bin/expect -f

set timeout -1
set password "123Scarface123!"
set remote_host "151.243.109.243"
set remote_port 9999
set target_host "aws-0-us-east-1.pooler.supabase.com"
set target_port 5432

# Start Reverse Tunnel: Remote(9999) -> Local machine -> Target(5432)
spawn ssh -o StrictHostKeyChecking=no -R $remote_port:$target_host:$target_port root@$remote_host -N

expect {
    "password:" {
        send "$password\r"
        exp_continue
    }
}
# Keep script running to maintain tunnel
expect eof
