#!/usr/bin/with-contenv bashio

mkdir -p /run/systemd/journal
touch /run/systemd/journal/dev-log

# Log to stdout
syslogd -n -O - &
#tail -f /tmp/myfile &

apcupsd -b
