#!/usr/bin/with-contenv bashio

# Log to stdout
mkdir -p /run/systemd/journal
syslogd -n -O - &

# Start apcupsd in foreground
apcupsd -b
