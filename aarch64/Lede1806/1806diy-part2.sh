#!/bin/bash
#============================================================
# sxml
# 2026-10-07 2512
# part2 开头执行 vim、igmpproxy 修复（feeds 已经 update/install 完毕，不会被覆盖）
# part2 在 feeds update、feeds install完成之后执行
#============================================================
#=====修复 vim‑fuller 编译失败问题=====
rm -rf feeds/packages/utils/vim
git clone https://github.com/openwrt/packages.git --depth=1 -b openwrt-18.06 feeds-tmp
cp -r feeds-tmp/packages/utils/vim feeds/packages/utils/
rm -rf feeds-tmp

#=====修复 igmpproxy automake编译报错【需要IPTV保留；不需要可以直接整块删除】=====
rm -rf feeds/packages/net/igmpproxy
git clone https://github.com/openwrt/packages.git --depth=1 -b openwrt-18.06 feeds-tmp-igmpproxy
# ⚠️重点：18.06分支仓库根目录下是packages文件夹！
cp -r feeds-tmp-igmpproxy/packages/net/igmpproxy feeds/packages/net/
rm -rf feeds-tmp-igmpproxy

# #修复 python‑cython host编译whl缺失报错
# rm -rf feeds/packages/lang/python/python-cython
# git clone --depth=1 -b openwrt-18.06 https://github.com/openwrt/packages.git feeds‑tmp‑cython
# cp -r feeds‑tmp‑cython/packages/lang/python/python-cython feeds/packages/lang/python/
# rm -rf feeds‑tmp‑cython

# 20261009修复 python-cython host 构建失败
rm -rf build_dir/hostpkg/pypi/Cython-* 
rm -rf staging_dir/hostpkg/stamp/.python-cython*
rm -rf tmp/host-stage-python-cython 
# 强制重新编译相关 host 包
make package/feeds/packages/python-cython/host/{clean,compile} -j1 V=s

#替换完feeds内软件包，重新install注册包
./scripts/feeds install -a
###########################################################################
# 下面放你原来part2.sh其他自定义脚本，例如修改IP、主题、配置文件等，写在此处下方
###########################################################################
#示例（你原有注释参考）
#sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
