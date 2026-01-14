#!/usr/bin/expect -f

# Download file FROM server to local
# Usage: ./remote_download.sh /path/on/server /local/path

set timeout 600
set password "123Scarface123!"
set remote_path [lindex $argv 0]
set local_path [lindex $argv 1]
set host "151.243.109.243"

spawn scp -o StrictHostKeyChecking=no root@$host:$remote_path $local_path

expect {
    "password:" {
        send "$password\r"
        exp_continue
    }
    eof
}
catch wait result
exit [lindex $result 3]
