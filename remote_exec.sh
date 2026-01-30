#!/usr/bin/expect -f

# usage: ./remote_exec.sh "command to run"

set timeout 300
set password "4Y76HBYs^OxSQNbIbbfA7C0d"
set cmd [lindex $argv 0]
set host "151.243.109.243"

spawn ssh -o StrictHostKeyChecking=no root@$host $cmd

expect {
    "password:" {
        send "$password\r"
        exp_continue
    }
    eof
}
catch wait result
exit [lindex $result 3]
