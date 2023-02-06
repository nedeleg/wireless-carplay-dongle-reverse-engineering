########################
# Copyright(c) 2014-2020 DongGuan HeWei Communication Technologies Co. Ltd.
# file    once.sh
# brief   
# author  Haiguang Yin
# version 1.0.0
# date    14Apr20
########################
#!/bin/bash

rm /usr/lib/libjpeg*
rm /usr/lib/libturbojpeg*
rm -rf /etc/assets && ln -s /tmp /etc/assets
rm -f /usr/lib/libAirPlay*
rm -f /usr/lib/libcarlifevehicle.so*
rm -f /usr/lib/libprotobuf.so*
rm -f /usr/lib/libScreenStream.so*
rm -f /usr/lib/libAudioStream.so*
rm -f /usr/lib/libmydecodejpeg.so*
rm -f /usr/lib/libAudioStream.so*
rm -f /usr/lib/libmydecodejpeg.so*
rm -f /usr/lib/libav*
rm -f /usr/lib/libsw*

rm -f /usr/lib/liblzo2.so*
rm -f /usr/lib/libdmsdpcrypto.so
rm -f /lib/libasan.so.1.0.0
rm -f /lib/libubsan.so.0.0.0
rm -f /usr/sbin/hciattach

#use new version boa html file
rm -f /etc/boa/www/*

sdioCardID=`cat /sys/bus/sdio/devices/mmc0:0001:1/device`
if [ "$sdioCardID" == "0xb822" ]; then
	if [ -e /tmp/update/rtl8822_rootfs.tar.gz ]; then
		tar -xvf /tmp/update/rtl8822_rootfs.tar.gz -C /tmp/update/
	fi
elif [ "$sdioCardID" == "0x4354" ] || [ "$sdioCardID" == "0x4335" ]; then
	if [ -e /tmp/update/bcm4354_rootfs.tar.gz ]; then
		tar -xvf /tmp/update/bcm4354_rootfs.tar.gz -C /tmp/update/
	fi
	if [ "$sdioCardID" == "0x4335" ]; then
		test -e /lib/firmware/bcm/bcm4350.hcd && rm -f /lib/firmware/bcm/*bcm435*
		rm -f /tmp/update/lib/firmware/bcm/bcm4350.hcd
		rm -f /tmp/update/lib/firmware/bcm/fw_bcm4354a1_ag_apsta.bin
		rm -f /tmp/update/lib/firmware/bcm/nvram_bcm4354_m.txt
		if [ -e /tmp/update/bcm4335_rootfs.tar.gz ]; then
			tar -xvf /tmp/update/bcm4335_rootfs.tar.gz -C /tmp/update/
		fi
	fi
fi
rm -f /tmp/update/rtl8822_rootfs.tar.gz
rm -f /tmp/update/bcm43*_rootfs.tar.gz

echo "Start upg"
rm /tmp/*.img;rm /tmp/update.tar.gz;mv /tmp/update/tmp/* /tmp/;chmod +x /tmp/upg;/tmp/upg
echo "End upg"