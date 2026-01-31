#!/usr/bin/expect -f

set timeout 300
set password "4Y76HBYs^OxSQNbIbbfA7C0d"
set src [lindex $argv 0]
set dest [lindex $argv 1]
set host "151.243.109.243"

spawn scp -o StrictHostKeyChecking=no $src root@$host:$dest

expect {
    "password:" {
        send "$password\r"
        exp_continue
    }
    eof
}
catch wait result
exit [lindex $result 3]
