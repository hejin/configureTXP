#!/bin/bash
useradd txp
mkdir -p /data/fdx/downloads
chown -R txp:txp /data/fdx/downloads
mkdir -p ~txp/.config/qBittorrent/
cp qBittorrent.conf ~txp/.config/qBittorrent/
chown -R txp:txp ~txp/.config/
