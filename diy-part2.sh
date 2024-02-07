#!/bin/bash
#============================================================
# 2024-01-31
#https://github.com/HoldOnBro/Actions-OpenWrt
#https://github.com/breakings/OpenWrt
#============================================================
#移除不用软件包
rm -rf feeds/luci/applications/luci-app-dockerman
#rm -rf package/lean/luci-app-wrtbwmon
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -fr feeds/luci/themes/luci-theme-design
#20231010
#rm -rf feeds/packages/utils/prometheus-node-exporter-lua

# 克隆 kenzok8仓库
git clone --depth=1 https://github.com/kenzok8/openwrt-packages.git kenzok8-packages
cp -rf kenzok8-packages/smartdns package/smartdns
cp -rf kenzok8-packages/luci-app-smartdns package/luci-app-smartdns
#cp -rf kenzok8-packages/gost package/gost
#git clone --depth=1 https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
git clone --depth=1 https://github.com/kenzok8/small-package.git small-package
cp -rf small-package/gost package/gost
cp -rf small-package/luci-app-gost package/luci-app-gost
#cp -rf small-package/sagernet-core package/sagernet-core
cp -rf small-package/v2ray-geodata package/v2ray-geodata

# 克隆 fw876 仓库
git clone --depth=1 -b main https://github.com/fw876/helloworld.git
cp -rf helloworld/luci-app-ssr-plus package/luci-app-ssr-plus
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
#rm -rf openwrt-passwall-packages

#passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git
cp -rf openwrt-passwall/luci-app-passwall package/luci-app-passwall
#rm -rf openwrt-passwall

#passwall2
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git
cp -rf openwrt-passwall2/luci-app-passwall2 package/luci-app-passwall2
#rm -rf openwrt-passwall2

#解析
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb

#文件助手
#git clone --depth=1 https://github.com/Lienol/openwrt-package.git fileassistant
#cp -rf fileassistant/luci-app-fileassistant package/luci-app-fileassistant
git clone https://github.com/sxml/luci-app-fileassistant.git package/luci-app-fileassistant
#rm -rf fileassistant

# 临时修复xfsprogs
#sed -i 's/TARGET_CFLAGS += -DHAVE_MAP_SYNC/TARGET_CFLAGS += -DHAVE_MAP_SYNC -D_LARGEFILE64_SOURCE/' feeds/packages/utils/xfsprogs/Makefile
# Fix xfsprogs build error
sed -i 's|TARGET_CFLAGS += -DHAVE_MAP_SYNC.*|TARGET_CFLAGS += -DHAVE_MAP_SYNC $(if $(CONFIG_USE_MUSL),-D_LARGEFILE64_SOURCE)|' feeds/packages/utils/xfsprogs/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

#shadowsocks-rust
#git clone --depth=1 https://github.com/breakings/OpenWrt OpenWrt/general/shadowsocks-rust
#cp -rf OpenWrt/general/shadowsocks-rust package/shadowsocks-rust

#添加luci-app-amlogic
git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git
cp -rf luci-app-amlogic/luci-app-amlogic package/luci-app-amlogic
#rm -rf luci-app-amlogic
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
git clone --depth=1 https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone --depth=1 https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
git clone --depth=1 https://github.com/gngpp/luci-theme-design.git package/luci-theme-design
git clone --depth=1 https://github.com/gngpp/luci-app-design-config.git package/luci-app-design-config

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

#修改perl
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=$(PERL_VERSION)/g' package/lang/perl/Makefile
#sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' package/lang/perl/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=d91115e90b896520e83d4de6b52f8254ef2b70a8d545ffab33200ea9f1cf29e8/g' package/lang/perl/Makefile

./scripts/feeds update -a
./scripts/feeds install -a
