# apcupsd add-on for Home Assistant

## About

This add-on complements [apcupsd integration](https://www.home-assistant.io/integrations/apcupsd) when used with Network Management Card (NMC) equipped APC UPS devices. It's primary purpose is to translate between SNMPv1 exposed by UPS and Network Information Server (NIS) consumed by apcupsd integration - but without requiring additional hosts to serve this daemon.

## Installation

1. [![Add this repository to my HA.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Ftwasilczyk%2Fha-addons)
2. Settings --> Add-ons --> Add-on store --> apcupsd --> Install
3. Configuration --> set NMC IP address --> Save
4. Info --> Start
5. Settings --> Devices & services --> Add integration --> APC UPS Daemon
6. Leave default settings (`localhost:3551`) and click Submit
