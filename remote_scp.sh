#!/usr/bin/expect -f

# usage: ./remote_scp.sh local_file remote_path

set timeout 300
set password "123Scarface123!"
set local_file [lindex $argv 0]
set remote_path [lindex $argv 1]
set host "151.243.109.243"

spawn scp -o StrictHostKeyChecking=no $local_file root@$host:$remote_path

expect {
    "password:" {
        send "$password\r"
        exp_continue
    }
    eof
}
catch wait result
exit [lindex $result 3]
