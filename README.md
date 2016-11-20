# rpi3+sickrage 0.1-alpha
# 

make:
- make ragepie && make
- Burn builds/build_rpi3/images/sdcard.img
- Boot your rpi3. After two reboots, connect to http:rpi3_ip:8081

users:password
- root:root
- sickrage:sickrage

software:
- torrent client: transmission

todo:
- wifi
