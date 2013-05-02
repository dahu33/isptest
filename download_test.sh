#!/bin/bash

OUT="download_result.csv"
TIMEOUT=200
DATE=$(date +"%Y-%m-%d %H:%M")
URLS="http://ftp.riken.jp/Linux/ubuntu-iso/CDs/13.04/ubuntu-13.04-server-amd64.iso
http://ftp.jaist.ac.jp/pub/Linux/ubuntu-releases/13.04/ubuntu-13.04-server-amd64.iso
http://ubuntu.mirrors.proxad.net/13.04/ubuntu-13.04-server-amd64.iso
http://mirror.ovh.net/ubuntu-releases/13.04/ubuntu-13.04-server-amd64.iso
http://mirror.anl.gov/pub/ubuntu-iso/CDs/13.04/ubuntu-13.04-server-amd64.iso
http://mirror.pnl.gov/releases/13.04/ubuntu-13.04-server-amd64.iso
http://mirror.us.leaseweb.net/ubuntu-releases/13.04/ubuntu-13.04-desktop-amd64.iso"

touch ${OUT}
for url in ${URLS}; do
    echo -e "\nDownloading (timeout: ${TIMEOUT}s): ${url} ..."
    curl -m ${TIMEOUT} -w"${DATE},%{url_effective},%{speed_download},%{time_total}\n" -o /dev/null ${url} >>${OUT}
done
