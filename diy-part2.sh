#!/bin/bash
#============================================================
# # 20230421
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
#rm -rf feeds/packages/net/smartdns
rm -fr feeds/luci/themes/luci-theme-design
#rm -rf feeds/packages/net/samba4

# samba4
#svn co https://github.com/openwrt/packages/trunk/net/samba4 feeds/packages/net/samba4

#添加smartdns
#svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/smartdns
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/luci-app-smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

#SSR-plus
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus

#clash小猫
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd

#passwall
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/luci-app-passwall
#svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci-smartdns-new-version/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus
svn co https://github.com/fw876/helloworld/trunk/xray-core package/xray-core
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-core package/xray-core
#svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/xray-plugin
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-plugin package/xray-plugin
#svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/shadowsocksr-libev
svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/v2ray-plugin
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-plugin package/v2ray-plugin
svn co https://github.com/fw876/helloworld/trunk/v2ray-core package/v2ray-core
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-core package/v2ray-core
svn co https://github.com/fw876/helloworld/trunk/v2ray-geodata package/v2ray-geodata
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-geodata package/v2ray-geodata
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/pdnsd-alt
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/hysteria
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/simple-obfs
#git clone https://github.com/sxml/luci-app-kcptun.git package/kcptun
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan package/trojan
svn co https://github.com/fw876/helloworld/trunk/dns2tcp package/dns2tcp
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2tcp package/dns2tcp
#svn co https://github.com/fw876/helloworld/trunk/sagernet-core package/sagernet-core
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/sagernet-core package/sagernet-core
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/microsocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/dns2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/ipt2socks
svn co https://github.com/fw876/helloworld/trunk/lua-neturl package/lua-neturl
svn co https://github.com/fw876/helloworld/trunk/redsocks2 package/redsocks2
svn co https://github.com/fw876/helloworld/trunk/gn package/gn
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-gost package/luci-app-gost
svn co https://github.com/breakings/OpenWrt/trunk/general/gost package/gost
#svn co https://github.com/kenzok8/openwrt-packages/trunk/gost package/gost

#alist
#git clone https://github.com/sbwml/openwrt-alist.git package/openwrt-alist
#git clone https://github.com/sbwml/luci-app-alist package/alist
#svn co https://github.com/sbwml/openwrt-alist/trunk package/luci-app-alist
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-alist package/luci-app-alist
svn co https://github.com/kenzok8/openwrt-packages/trunk/alist package/alist

#naiveproxy代理
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/naiveproxy
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/naiveproxy package/naiveproxy
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
#git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
svn co https://github.com/thinktip/luci-theme-neobird/trunk package/luci-theme-neobird

#git clone https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
#git clone https://github.com/gngpp/luci-app-design-config.git package/luci-app-design-config
svn co https://github.com/gngpp/luci-theme-design/trunk package/luci-theme-design
svn co https://github.com/gngpp/luci-app-design-config/trunk package/luci-app-design-config

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

# GNU sed (流编辑器)
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=4.8/g' tools/sed/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633/g' tools/sed/Makefile

./scripts/feeds update -a
./scripts/feeds install -a
