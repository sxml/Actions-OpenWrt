#!/bin/bash
#============================================================
# # 2023-12-22
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com 
#============================================================
#移除不用软件包
#rm -rf package/lean/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-dockerman
#rm -rf package/lean/luci-app-wrtbwmon
rm -rf feeds/packages/net/smartdns
rm -fr feeds/luci/themes/luci-theme-design
#rm -rf feeds/packages/net/samba4
#20231010
#rm -rf feeds/packages/utils/prometheus-node-exporter-lua

#添加smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/luci-app-smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

#SSR-plus
svn co https://github.com/fw876/helloworld/branches/main/luci-app-ssr-plus package/luci-app-ssr-plus

#passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/luci-app-passwall
#svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci-smartdns-dev/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2

svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/brook package/brook
#cp -rf $GITHUB_WORKSPACE/general/brook package/brook

svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/ssocks package/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/chinadns-ng package/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/tcping package/tcping
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/trojan-go package/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/trojan-plus package/trojan-plus
svn co https://github.com/fw876/helloworld/branches/main/xray-core package/xray-core
#svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/xray-core package/xray-core
#svn co https://github.com/fw876/helloworld/branches/main/xray-plugin package/xray-plugin
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/xray-plugin package/xray-plugin
#svn co https://github.com/fw876/helloworld/branches/main/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/fw876/helloworld/branches/main/shadowsocksr-libev package/shadowsocksr-libev
svn co https://github.com/fw876/helloworld/branches/main/v2ray-plugin package/v2ray-plugin
#svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/v2ray-plugin package/v2ray-plugin
svn co https://github.com/fw876/helloworld/branches/main/v2ray-core package/v2ray-core
#svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/v2ray-core package/v2ray-core
svn co https://github.com/fw876/helloworld/branches/main/v2ray-geodata package/v2ray-geodata
#svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/v2ray-geodata package/v2ray-geodata
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/pdnsd-alt package/pdnsd-alt
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/hysteria package/hysteria
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/simple-obfs package/simple-obfs
#git clone https://github.com/sxml/luci-app-kcptun.git package/kcptun
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/trojan package/trojan
svn co https://github.com/fw876/helloworld/branches/main/dns2tcp package/dns2tcp
#svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/dns2tcp package/dns2tcp
#svn co https://github.com/fw876/helloworld/branches/main/sagernet-core package/sagernet-core
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/sagernet-core package/sagernet-core
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/microsocks package/microsocks
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/dns2socks package/dns2socks
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/ipt2socks package/ipt2socks
svn co https://github.com/fw876/helloworld/branches/main/lua-neturl package/lua-neturl
svn co https://github.com/fw876/helloworld/branches/main/redsocks2 package/redsocks2

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-gost package/luci-app-gost
svn co https://github.com/breakings/OpenWrt/trunk/general/gost package/gost
#svn co https://github.com/kenzok8/openwrt-packages/trunk/gost package/gost

#naiveproxy
svn co https://github.com/fw876/helloworld/branches/main/gn package/gn

#Tuic
svn co https://github.com/fw876/helloworld/branches/main/tuic-client package/tuic-client

#sing-box 20230907
svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/sing-box package/sing-box

#shadow-tls 20231020
svn co https://github.com/fw876/helloworld/branches/main/shadow-tls package/shadow-tls

#naiveproxy代理
svn co https://github.com/fw876/helloworld/branches/main/naiveproxy package/naiveproxy
#svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/naiveproxy package/naiveproxy
#解析
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb

#文件助手
#git clone https://github.com/sxml/luci-app-fileassistant.git package/luci-app-fileassistant
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-fileassistant package/luci-app-fileassistant
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-fileassistant package/luci-app-fileassistant

#添加luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
#修改晶晨宝盒默认配置
# 1.设置OpenWrt 文件的下载仓库
sed -i "s|https.*/OpenWrt|https://github.com/sxml/Actions-OpenWrt|g" package/luci-app-amlogic/root/etc/config/amlogic
# 2.设置 Releases 里 Tags 的关键字
sed -i "s|ARMv8|ARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic
# 3.设置 Releases 里 OpenWrt 文件的后缀
sed -i "s|.img.gz|.img.gz|g" package/luci-app-amlogic/root/etc/config/amlogic
# 4.设置 OpenWrt 内核的下载路径
#sed -i "s|opt/kernel|BuildARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|http.*/library|https://github.com/breakings/OpenWrt/tree/main/opt/kernel|g" package/luci-app-amlogic/root/etc/config/amlogic

# themes 主题
svn co https://github.com/Leo-Jo-My/luci-theme-opentomcat/trunk package/luci-theme-opentomcat
svn co https://github.com/thinktip/luci-theme-neobird/trunk package/luci-theme-neobird

svn co https://github.com/gngpp/luci-theme-design/trunk package/luci-theme-design
svn co https://github.com/gngpp/luci-app-design-config/trunk package/luci-app-design-config

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

function install-bmx6-bmx6-json() {
  # 下载 bmx6
  wget https://github.com/openwrt/packages/raw/master/utils/bmx6/bmx6-1.2.2.tar.gz
  tar -xf bmx6-1.2.2.tar.gz

  # 编译 bmx6
  cd bmx6-1.2.2
  make
  sudo make install

  # 下载 bmx6-json
  wget https://github.com/openwrt/packages/raw/master/utils/bmx6/bmx6-json-1.2.2.tar.gz
  tar -xf bmx6-json-1.2.2.tar.gz

  # 编译 bmx6-json
  cd bmx6-json-1.2.2
  make
  sudo make install
}

./scripts/feeds update -a
./scripts/feeds install -a
