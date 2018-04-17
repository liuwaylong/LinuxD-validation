#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/config_ether.sh

SHELL_SCRIPT_FILE="$1"
ONLY_RUN_FROM_PC="$2"
RUNNING_FROM_PC=0

echo -e "\n ${BEGIN_TIMER} \n"

# check source code run from HOST PC
if ifconfig | grep -i $IPSERVER > /dev/null; then

RUNNING_FROM_PC=1

if [ "$ONLY_RUN_FROM_PC" = "1" ];then

	$(dirname $0)/$SHELL_SCRIPT_FILE

else	

$CMD_SSH <<ENDSSH
	
	exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_ethernet.sh $SHELL_SCRIPT_FILE

ENDSSH

fi

# check source code run from board
else
	if [ "$ONLY_RUN_FROM_PC" = "1" ];then
		echo "this item test only run from HOST PC via SSH. Please check again"
	else
		$(dirname $0)/$SHELL_SCRIPT_FILE
	fi
fi

echo -e "\n ${END_TIMER} \n"
