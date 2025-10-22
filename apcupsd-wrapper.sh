#!/usr/bin/with-contenv bashio

echo "cfg start"
echo $(bashio::config 'deviceaddr')
echo $(bashio::config 'snmpcommunity')
echo $(bashio::config 'polltime')
echo "cfg end"

# Log to stdout
mkdir -p /run/systemd/journal
exec syslogd -n -O - &

# Start apcupsd in foreground
exec apcupsd -b
