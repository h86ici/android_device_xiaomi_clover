#!/bin/bash
# 執行指令為 ./HavocOS_clover_repo_sync.sh

cd ~/mipad4_rom/aex7

git config --global user.name "h86ici"

git config --global user.email "ssij66@yahoo.com"

repo init -u git://github.com/AospExtended/manifest.git -b 10.x

export LC_ALL=C
 
#repo sync -j8
repo sync -c -j8 --force-sync --no-clone-bundle --no-tags

export USE_CCACHE=1

ccache -M 50G

export CCACHE_COMPRESS=1

export WITH_DEXPREOPT=false

. build/envsetup.sh

lunch aosp_clover-userdebug

# mka aex -j8 | tee log.txt
mka aex -j8

# make -j8 otapackage

# cd $OUT


