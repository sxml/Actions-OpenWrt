#!/bin/bash
#
#   immortalwrt 2024-11-18 23.05
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

#移除不用软件包
rm -rf feeds/luci/applications/luci-app-dockerman
#rm -rf package/lean/luci-app-wrtbwmon
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -fr feeds/luci/themes/luci-theme-argon
#rm -fr feeds/luci/themes/luci-theme-design
#rm -rf feeds/luci/applications/luci-app-ddns-go
#rm -rf feeds/packages/net/ddns-go

# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='immortalwrt'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate

#修改默认主题
#sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")

# 设置ttyd免帐号登录
sed -i 's/\/bin\/login/\/bin\/login -f root/' feeds/packages/utils/ttyd/files/ttyd.config

# 克隆 kenzok8仓库
git clone --depth=1 https://github.com/kenzok8/openwrt-packages.git kenzok8-packages
cp -rf kenzok8-packages/smartdns package/smartdns
cp -rf kenzok8-packages/luci-app-smartdns package/luci-app-smartdns
cp -rf kenzok8-packages/luci-theme-argon package/luci-theme-argon
#cp -rf kenzok8-packages/ddns-go package/ddns-go
#cp -rf kenzok8-packages/gost package/gost
#git clone --depth=1 https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
#git clone --depth=1 https://github.com/kenzok8/small-package.git small-package
#cp -rf small-package/gost package/gost
#cp -rf small-package/luci-app-gost package/luci-app-gost
#cp -rf small-package/sagernet-core package/sagernet-core
#cp -rf small-package/v2ray-geodata package/v2ray-geodata

# 克隆 fw876 仓库
git clone --depth=1 -b main https://github.com/fw876/helloworld.git
#cp -rf helloworld/luci-app-ssr-plus package/luci-app-ssr-plus
cp -rf helloworld/xray-core package/xray-core
cp -rf helloworld/xray-plugin package/xray-plugin
cp -rf helloworld/shadowsocks-rust package/shadowsocks-rust
cp -rf helloworld/shadowsocksr-libev package/shadowsocksr-libev
cp -rf helloworld/v2ray-plugin package/v2ray-plugin
cp -rf helloworld/v2ray-core package/v2ray-core
#cp -rf helloworld/v2ray-geodata package/v2ray-geodata
cp -rf helloworld/trojan package/trojan
#cp -rf helloworld/sagernet-core package/sagernet-core
cp -rf helloworld/microsocks package/microsocks
cp -rf helloworld/redsocks2 package/redsocks2
cp -rf helloworld/ipt2socks package/ipt2socks
cp -rf helloworld/dns2socks package/dns2socks
cp -rf helloworld/lua-neturl package/lua-neturl
cp -rf helloworld/gn package/gn
cp -rf helloworld/shadow-tls package/shadow-tls
cp -rf helloworld/tuic-client package/tuic-client
cp -rf helloworld/naiveproxy package/naiveproxy
#rm -rf helloworld

# 克隆openwrt-passwall仓库
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages.git
cp -rf openwrt-passwall-packages/brook package/brook
cp -rf openwrt-passwall-packages/ssocks package/ssocks
cp -rf openwrt-passwall-packages/simple-obfs package/simple-obfs
cp -rf openwrt-passwall-packages/pdnsd-alt package/pdnsd-alt
cp -rf openwrt-passwall-packages/chinadns-ng package/chinadns-ng
cp -rf openwrt-passwall-packages/tcping package/tcping
cp -rf openwrt-passwall-packages/trojan-go package/trojan-go
cp -rf openwrt-passwall-packages/trojan-plus package/trojan-plus
cp -rf openwrt-passwall-packages/hysteria package/hysteria
cp -rf openwrt-passwall-packages/dns2tcp package/dns2tcp
cp -rf openwrt-passwall-packages/sing-box package/sing-box
cp -rf openwrt-passwall-packages/v2ray-geodata package/v2ray-geodata
#rm -rf openwrt-passwall-packages

#passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git
#cp -rf openwrt-passwall/luci-app-passwall package/luci-app-passwall
#rm -rf openwrt-passwall

#passwall2
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git
cp -rf openwrt-passwall2/luci-app-passwall2 package/luci-app-passwall2
#rm -rf openwrt-passwall2

#解析
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb

#添加luci-app-amlogic
git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git
cp -rf luci-app-amlogic/luci-app-amlogic package/luci-app-amlogic
#rm -rf luci-app-amlogic
#修改晶晨宝盒默认配置
# 1.设置OpenWrt 文件的下载仓库
sed -i "s|https.*/OpenWrt|https://github.com/sxml2015/amlogic-s9xxx-openwrt|g" package/luci-app-amlogic/root/etc/config/amlogic
# 2.设置 Releases 里 Tags 的关键字
sed -i "s|immortalwrt|immortalwrt|g" package/luci-app-amlogic/root/etc/config/amlogic
# 3.设置 Releases 里 OpenWrt 文件的后缀
sed -i "s|.img.gz|.img.gz|g" package/luci-app-amlogic/root/etc/config/amlogic
# 4.设置 OpenWrt 内核的下载路径
#sed -i "s|opt/kernel|BuildARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|http.*/library|https://github.com/breakings/OpenWrt/tree/main/opt/kernel|g" package/luci-app-amlogic/root/etc/config/amlogic

# themes 主题
#git clone --depth=1 https://github.com/sxml/luci-theme-design.git package/luci-theme-design
#git clone --depth=1 https://github.com/sxml/luci-app-design-config.git package/luci-app-design-config

# mihomo
#git clone --depth=1 https://github.com/morytyann/OpenWrt-mihomo package/luci-app-mihomo

# 应用补丁
# git apply ../config/patches/{0001*,0002*}.patch --directory=feeds/luci

./scripts/feeds update -a
./scripts/feeds install -a
