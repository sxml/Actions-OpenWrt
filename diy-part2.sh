#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#移除不用软件包    
rm -rf package/lean/luci-app-dockerman
rm -rf package/lean/luci-app-wrtbwmon
#添加额外软件包
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
# 编译 po2lmo (如果有po2lmo可跳过)
#pushd package/luci-app-openclash/tools/po2lmo
#make && sudo make install
#popd

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus
#luci-app-filebrowser文件助手（可在线查看路由器上的文件）
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-app-filebrowser package/luci-app-filebrowser
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/filebrowser package/filebrowser
svn co https://github.com/project-openwrt/openwrt/trunk/package/lienol/luci-app-fileassistant package/luci-app-fileassistant
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray package/xray

#依IP地址限速
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos package/luci-app-eqos

# 流量监控
svn co https://github.com/brvphoenix/wrtbwmon/trunk/wrtbwmon package/wrtbwmon
git clone https://github.com/brvphoenix/luci-app-wrtbwmon
cd luci-app-wrtbwmon
git reset --hard ff7773abbf71120fc39a276393b29ba47353a7e2 && cp -r luci-app-wrtbwmon ../package/
cd ..
# themes
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-edge package/luci-theme-edge
svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy package/luci-theme-rosy

#luci-app-koolddns阿里解析
git clone https://github.com/xrouterservice/luci-app-koolddns.git package/luci-app-koolddns
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
#naiveproxy代理
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/naiveproxy
#赋予koolddns权限
chmod 0755 package/luci-app-koolddns/root/etc/init.d/koolddns
chmod 0755 package/luci-app-koolddns/root/usr/share/koolddns/aliddns

#添加smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/smartdns package/smartdns
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-smartdns package/luci-app-smartdns

# udp2raw
git clone https://github.com/sxml/openwrt-udp2raw.git package/udp2raw-tunnel
git clone https://github.com/sxml/luci-app-udp2raw.git package/luci-app-udp2raw

./scripts/feeds update -a
./scripts/feeds install -a

#readd cpufreq for aarch64 cpu调频
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

#replace coremark.sh with the new one
#rm package/lean/coremark/coremark.sh
#cp $GITHUB_WORKSPACE/general/coremark.sh package/lean/coremark/

#temp fix for dnsforwarder
#sed -i "s/PKG_SOURCE_URL:=.*/PKG_SOURCE_URL:=https:\/\/github\.com\/1715173329\/dnsforwarder\.git/" package/lean/dnsforwarder/Makefile
#sed -i "s/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=587e61ae4d75dc976f538088b715a3c8ee26c144/" package/lean/dnsforwarder/Makefile
#sed -i "s/\ \ URL:=.*/\ \ URL:=https:\/\/github\.com\/1715173329\/dnsforwarder/" package/lean/dnsforwarder/Makefile===================================
