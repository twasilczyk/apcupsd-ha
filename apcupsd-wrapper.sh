#!/usr/bin/with-contenv bashio

DEVICEADDR=$(bashio::config 'deviceaddr')
if [ -z "$DEVICEADDR" ]; then
    bashio::log.error "UPS Address not configured!"
    exit 1
fi

SNMPCOMMUNITY=$(bashio::config 'snmpcommunity')
if [ -z "$SNMPCOMMUNITY" ]; then
    SNMPCOMMUNITY="public"
fi

export POLLTIME=$(bashio::config 'polltime')

echo "cfg start"
echo 1 $(bashio::config 'deviceaddr')
echo 2 $(bashio::config 'snmpcommunity')
echo 3 $(bashio::config 'polltime')
echo "cfg split"
echo "1 $DEVICEADDR"
echo "2 $SNMPCOMMUNITY"
echo "2 $POLLTIME"
echo "cfg end"

cat /etc/apcupsd/apcupsd.conf.in
envsubst < /etc/apcupsd/apcupsd.conf.in > /etc/apcupsd/apcupsd.conf
cat /etc/apcupsd/apcupsd.conf

# Log to stdout
mkdir -p /run/systemd/journal
syslogd -n -O - &

# Start apcupsd in foreground
apcupsd -b
