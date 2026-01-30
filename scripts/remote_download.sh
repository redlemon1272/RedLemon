#!/usr/bin/expect -f

# usage: ./remote_download.sh "/remote/path" "/local/path"

set timeout 900
set password "123Scarface123!"
set src [lindex $argv 0]
set dest [lindex $argv 1]
set host "151.243.109.243"

spawn scp -o StrictHostKeyChecking=no root@$host:$src $dest

expect {
    "password:" {
        send "$password\r"
        exp_continue
    }
    eof
}
catch wait result
exit [lindex $result 3]
