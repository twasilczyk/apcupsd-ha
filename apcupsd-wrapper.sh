#!/usr/bin/with-contenv bashio

#syslog diag
ls -l /dev/log || true

# Log to stdout
touch /tmp/myfile
syslogd -n -O /tmp/myfile &
tail -f /tmp/myfile &

apcupsd -b
