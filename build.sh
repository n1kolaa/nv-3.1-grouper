#!/bin/bash
# Build kernel

rm ~/bootimg_tools/boot.img
rm ~/bootimg_tools/zImage
rm ~/agnostic/*.zip
rm ~/agnostic/boot.img
cd ~/nv-3.1-grouper
export CROSS_COMPILE=~/arm-cortex_a9/bin/arm-cortex_a9-linux-gnueabihf- && export ARCH=arm && export SUBARCH=arm
make tegra3_android_defconfig && make -j3 ARCH=arm SUBARCH=arm
cp ~/nv-3.1-grouper/arch/arm/boot/zImage ~/bootimg_tools/
cd ~/bootimg_tools
./mkbootimg --kernel zImage --ramdisk initramfs.cpio.gz -o boot.img
cp ~/bootimg_tools/boot.img ~/agnostic/
cd ~/agnostic
zip -r agnostic-nv-31-grouper-alphaXY ./
