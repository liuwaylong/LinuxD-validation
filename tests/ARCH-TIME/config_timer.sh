#!/bin/sh
# timer device driver autotest shell-script

. $(dirname $0)/../../boards-conf/def_configs

DRIVER="arch_timer"						# timer driver name of renesas
INTERRUPT="arch_timer"						# timer driver interrupt

DRIVER_PATH="ARCH-TIME"						# path driver for run test
