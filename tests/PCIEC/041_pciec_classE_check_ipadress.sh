#!/bin/sh
# pciec device driver autotest shell-script

#set -x

echo "\n**********************Check class E IP ADDRESS *************************\n"


OK=0
NG=0

START="240.0.0.0"
END="255.255.255.255"

echo "Check class E ip address"

echo "set ip address $START"
ifconfig $INTERFACE $START

if [ "$?" = "1" ]; then
	 OK=$(($OK + 1))
else 
	 NG=$(($NG + 1))
fi


echo "set ip address $END"
ifconfig $INTERFACE $END

if [ "$?" = "1" ]; then
	 OK=$(($OK + 1))
else 
	 NG=$(($NG + 1))
fi

if [ "$OK" = "2" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

# reset ipadress of board
$(dirname $0)/setting_ethernet.sh

echo "\n************************************************************************\n"
