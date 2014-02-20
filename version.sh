#!/bin/sh
#
ARCH=$(uname -m)

if [ $(which nproc) ] ; then
	CORES=$(nproc)
else
	CORES=1
fi

#Debian 7 (Wheezy): git version 1.7.10.4 and later needs "--no-edit"
unset GIT_OPTS
unset GIT_NOEDIT
LC_ALL=C git help pull | grep -m 1 -e "--no-edit" >/dev/null 2>&1 && GIT_NOEDIT=1

if [ "${GIT_NOEDIT}" ] ; then
	GIT_OPTS="${GIT_OPTS} --no-edit"
fi

config="omap2plus_defconfig"

#toolchain="arm9_gcc_4_7"
#toolchain="gcc_arm_embedded_4_8"
#toolchain="cortex_gcc_4_6"
#toolchain="cortex_gcc_4_7"
toolchain="cortex_gcc_4_8"
#toolchain="gcc_linaro_gnueabihf_4_8"

#Kernel/Build
KERNEL_REL=3.13
KERNEL_TAG=${KERNEL_REL}.4
BUILD=bone5

#v3.X-rcX + upto SHA
#KERNEL_SHA="e6036c0b88962df82a8853971b86a55f09faef40"

#git branch
BRANCH="am33x-v3.13"

BUILDREV=1.0
DISTRO=cross
DEBARCH=armhf
