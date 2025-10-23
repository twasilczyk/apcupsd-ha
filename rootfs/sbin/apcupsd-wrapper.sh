#!/usr/bin/with-contenv bashio

echo "wrap12"
# Log to stdout
syslogd -n -O - &

echo "wrap3"
# Parse HA config
export DEVICEADDR=$(bashio::config 'deviceaddr')
if [ -z "$DEVICEADDR" ]; then
    bashio::log.error "UPS Address not configured!"
    exit 1
fi
export DEVICEPORT=161

echo "wrap4"
export SNMPCOMMUNITY=$(bashio::config 'snmpcommunity')
if [ -z "$SNMPCOMMUNITY" ]; then
    export SNMPCOMMUNITY="public"
fi

export POLLTIME=$(bashio::config 'polltime')

echo "wrap5"
# Generate apcupsd config
envsubst < /etc/apcupsd/apcupsd.conf.in > /etc/apcupsd/apcupsd.conf

echo "wrap6"
# Start apcupsd in foreground
apcupsd -b
echo "wrap7"