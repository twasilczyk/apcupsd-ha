# apcupsd add-on for Home Assistant

## About

This add-on complements [apcupsd integration](https://www.home-assistant.io/integrations/apcupsd) when used with Network Management Card (NMC) equipped / Ethernet-connected APC UPS devices. It's primary purpose is to translate between SNMPv1 exposed by UPS and Network Information Server (NIS) consumed by apcupsd integration - without requiring additional hosts to serve this daemon.

## Installation

1. Install apcupsd add-on repository \
   [![Add this repository to my HA.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Ftwasilczyk%2Fha-addons)
2. Install apcupsd **add-on** \
   Settings → Add-ons → Add-on store → apcupsd → Install
3. Configure add-on \
   Configuration → set NMC IP address → Save
4. Start add-on \
   Info → Start
5. Add apcupsd **integration** \
   Settings → Devices & services → Add integration → APC UPS Daemon
6. Configure integration \
   Leave default settings (`localhost:3551`) and click Submit

## Supported devices

Generally, all NMC (e.g. AP9630) equipped APC UPS (e.g. SMT1500) are expected to work. UPS devices connected over USB are not supported.

## Controlling outlet groups

Upstream apcupsd intentionally doesn't support write operations on network connected UPS-es, so you need to use [snmp switch integration](https://www.home-assistant.io/integrations/snmp/#switch).

Just add this to your `configuration.yaml` (this example is for SMT1500 + AP9630):
```
switch:
  - platform: snmp
    name: "UPS group 1"
    host: UPS IP ADDRESS
    username: homeassistant
    version: "3"
    baseoid: "1.3.6.1.4.1.318.1.1.1.12.3.2.1.3.1"
    payload_on: 1
    payload_off: 2
    command_payload_off: 3
    vartype: Integer
  - platform: snmp
    name: "UPS group 2"
    host: UPS IP ADDRESS
    username: homeassistant
    version: "3"
    baseoid: "1.3.6.1.4.1.318.1.1.1.12.3.2.1.3.2"
    payload_on: 1
    payload_off: 2
    vartype: Integer

```

Where `homeassistant` is SNMPv3 user name - which should be replaced by `community` for SNMPv1/v2. Please refer to [snmp integration](https://www.home-assistant.io/integrations/snmp/#switch) for more details. This configuration assumes the core network equipment and HA host is connected to outlet group 1, so switching it off results in a power cycle (see `command_payload_off`).
