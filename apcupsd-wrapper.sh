#!/usr/bin/with-contenv bashio

# Log to stdout
mkdir -p /run/systemd/journal
#touch /run/systemd/journal/dev-log
syslogd -n -O - &

apcupsd -b
