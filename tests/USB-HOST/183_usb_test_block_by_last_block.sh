#!/bin/bash
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*****************************USB TEST LAST BLOCK***************************\n"

fdisk -l /dev/${DEVICE_USB2C1}1 > $LOGFILE 2>&1

fil=$LOGFILE

if [ -f $fil ]; then

#get sector device 
seek=`grep Disk $fil | tail -1 | cut -d ' '  -f5`
xbs=`grep Units $fil | tail -1 | cut -d ' '  -f8`
fi

seek=`expr $seek / $xbs`
seek_over=$(($seek + 0))

cmd="dd if=/dev/zero of=/dev/${DEVICE_USB2C1}1 bs=$xbs count=1 seek=${seek_over}"
echo $cmd

if eval $cmd; then
	eval $FAIL_MEG
else
	eval $PASS_MEG
fi	

rm -rf $LOGFILE

echo "\n************************************************************************\n"
