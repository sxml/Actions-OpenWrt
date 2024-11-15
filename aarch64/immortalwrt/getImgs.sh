#!/bin/bash

#sudo wget https://github.com/HoldOnBro/Actions-OpenWrt/releases/download/Files4Compile/mk_openwrt_src_20201028.tar.gz
#sudo wget https://github.com/HoldOnBro/Actions-OpenWrt/releases/download/Files4Compile/Armbian_20.10_Aml-s9xxx_buster_5.9.2-flippy-47+.img.xz
#sudo wget https://github.com/HoldOnBro/Actions-OpenWrt/releases/download/Files4Compile/Armbian_20.10_Aml-s9xxx_buster_5.4.73-flippy-47+o.img.xz
#sudo wget https://github.com/HoldOnBro/Actions-OpenWrt/releases/download/Files4Compile/Armbian_20.10_Beikeyun_buster_5.4.73-flippy-47+o.img.xz
#sudo wget https://github.com/HoldOnBro/Actions-OpenWrt/releases/download/Files4Compile/Armbian_20.10_L1-Pro_buster_5.4.73-flippy-47+o.img.xz
# Files 标签 ID 获取 （F大打包文件） https://api.github.com/repos/sxml/Actions-OpenWrt/releases/latest
wget $(curl -s https://api.github.com/repos/sxml/Actions-OpenWrt/releases/51377457 | grep browser_download_url | cut -d '"' -f 4)
