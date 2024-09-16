#!/bin/sh
# uid=1000(katsumi) gid=1000(katsumi) groups=1000(katsumi),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),122(lpadmin),135(lxd),136(sambashare),999(docker)
id -g `whoami`
