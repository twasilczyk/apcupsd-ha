#!/usr/bin/with-contenv bashio

# Log to stdout
syslogd -n -O - &

# Parse HA config
export DEVICEADDR=$(bashio::config 'deviceaddr')
if [ -z "$DEVICEADDR" ]; then
    bashio::log.error "UPS Address not configured!"
    exit 1
fi
export DEVICEPORT=161

export SNMPCOMMUNITY=$(bashio::config 'snmpcommunity')
if [ -z "$SNMPCOMMUNITY" ]; then
    export SNMPCOMMUNITY="public"
fi

export POLLTIME=$(bashio::config 'polltime')

# Generate apcupsd config
envsubst < /etc/apcupsd/apcupsd.conf.in > /etc/apcupsd/apcupsd.conf

# Start apcupsd in foreground
apcupsd -b
