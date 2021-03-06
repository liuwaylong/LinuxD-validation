#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE DATA FROM RAM TO USB2.0*******************\n"

if ! ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 2.0 upper port and test again."
	exit 1
fi

$(dirname $0)/usb_copy_data.sh $RAM_DIR $USB2_CH2_DIR 100 1

echo "\n************************************************************************\n"