#!/usr/bin/with-contenv bashio

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

cat /etc/apcupsd/apcupsd.conf.in
envsubst < /etc/apcupsd/apcupsd.conf.in > /etc/apcupsd/apcupsd.conf
cat /etc/apcupsd/apcupsd.conf

# Log to stdout
mkdir -p /run/systemd/journal
syslogd -n -O - &

# Start apcupsd in foreground
apcupsd -b
