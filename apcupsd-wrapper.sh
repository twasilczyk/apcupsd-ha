#!/usr/bin/with-contenv bashio

# Log to stdout
mkdir -p /run/systemd/journal
syslogd -n -O - &

echo "OK T"

apcupsd -b
