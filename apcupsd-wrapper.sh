#!/usr/bin/with-contenv bashio

#syslog diag
ls -l /dev/log || true

# Log to stdout
touch /tmp/myfile
killall syslogd || true
rm /dev/log || true
syslogd -n -O /tmp/myfile &
tail -f /tmp/myfile &

apcupsd -b
