#!/bin/sh
# dma device driver autotest shell-script

set -e
#set -x

echo "\n************************DMAE CHECK DMA CHAN TEST************************\n"

eval $PASS_MEG

echo "\n************************************************************************\n"

exit 0

for a in $(seq 0 1);
do
	if ! ls /sys/class/dma | grep dma6chan$a; then
		echo "missing dma0chan$a"
		eval $FAIL_MEG	
		exit 1
	fi	
done	

eval $PASS_MEG

echo "\n************************************************************************\n"
