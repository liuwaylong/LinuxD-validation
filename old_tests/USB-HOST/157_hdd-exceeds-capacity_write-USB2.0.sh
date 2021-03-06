#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n*******************HDD EXCEEDS CAPACITY WRITE**********************\n"

echo "Make sure inserted hard disk(SATA) via SATA-USB transfer port to USB 2.0 lower port"
sleep 1

if ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
	$(dirname $0)/usb_exceeds_capacity_write.sh $USB2_DIR
else
	if ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
		$(dirname $0)/usb_exceeds_capacity_write.sh $USB2_CH2_DIR
	else
		echo "Device not found.Please hard disk(SATA) via SATA-USB transfer port to USB 2.0 upper or lower port and test again."
		exit 1
	fi
fi

echo "\n*******************************************************************\n"