#!/usr/bin/with-contenv bashio

#syslog diag
ls -l /dev/log || true
ls -l /run/systemd/journal/dev-log || true
test -S /run/systemd/journal/dev-log || echo "journald socket not present here"
mkdir -p /run/systemd/journal
touch /run/systemd/journal/dev-log

# Log to stdout
touch /tmp/myfile
killall syslogd || true
rm /dev/log || true
syslogd -n -O /tmp/myfile &
tail -f /tmp/myfile &

apcupsd -b
