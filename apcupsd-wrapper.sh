#!/usr/bin/with-contenv bashio

# Log to stdout
syslogd -n -O - &

apcupsd -b
