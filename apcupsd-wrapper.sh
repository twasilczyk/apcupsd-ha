#!/usr/bin/with-contenv bashio

DEVICEADDR=$(bashio::config 'deviceaddr')
if [ -z "$DEVICEADDR" ]; then
    bashio::log.error "UPS Address not configured!"
    exit 1
fi

SNMPCOMMUNITY=$(bashio::config 'snmpcommunity')
if [ -z "$DEVICEADDR" ]; then
    echo "default"
    SNMPCOMMUNITY="public"
fi

POLLTIME=$(bashio::config 'polltime')

echo "cfg start"
echo 1 $(bashio::config 'deviceaddr')
echo 2 $(bashio::config 'snmpcommunity')
echo 3 $(bashio::config 'polltime')
echo "cfg split"
echo "1 $DEVICEADDR"
echo "2 $SNMPCOMMUNITY"
echo "2 $POLLTIME"
echo "cfg end"

# Log to stdout
mkdir -p /run/systemd/journal
syslogd -n -O - &

# Start apcupsd in foreground
apcupsd -b
