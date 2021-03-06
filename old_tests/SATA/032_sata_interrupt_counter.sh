#!/bin/bash
# timer device driver autotest shell-script

set -e
#set -x

echo "\n*********************CHECK INTERRUPT COUTER TIMER TEST *****************\n"

get_counter_interrupt () {

    words=(`exec $(dirname $0)/../common/proc-interrupts-quiet.sh "$DRIVER"`)

    echo ${words[1]}    
}

# CMT interrupt test
INT_1=$( get_counter_interrupt )
echo "before interrupt: $INT_1"

$(dirname $0)/sata_copy_data.sh $RAM_DIR $HDD_DIR 10 > /dev/null

INT_2=$( get_counter_interrupt )
echo "after interrupt: $INT_2"

if [ $INT_2 -eq  $INT_1 ]; then   
    echo "CPU0 Interrupt cound is not increasing"
    eval $FAIL_MEG
else
	eval $PASS_MEG
fi

echo "\n************************************************************************\n"
