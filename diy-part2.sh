#!/bin/bash
#============================================================
# # 2024-01-18
#https://github.com/breakings/OpenWrt
#https://github.com/binge8/op
#============================================================
merge_package(){
    # 参数1是分支名,参数2是库地址。所有文件下载到openwrt/package/openwrt-packages路径。
    # 同一个仓库下载多个文件夹直接在后面跟文件名或路径，空格分开。
    trap 'rm -rf "$tmpdir"' EXIT
    branch="$1" curl="$2" && shift 2
    rootdir="$PWD"
    localdir=package/openwrt-packages
    [ -d "$localdir" ] || mkdir -p "$localdir"
    tmpdir="$(mktemp -d)" || exit 1
    git clone -b "$branch" --depth 1 --filter=blob:none --sparse "$curl" "$tmpdir"
    cd "$tmpdir"
    git sparse-checkout init --cone
    git sparse-checkout set "$@"
    mv -f "$@" "$rootdir"/"$localdir" && cd "$rootdir"
}

#移除不用软件包
#rm -rf package/lean/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-dockerman
#rm -rf package/lean/luci-app-wrtbwmon
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -fr feeds/luci/themes/luci-theme-design
#rm -rf feeds/packages/net/samba4
#20231010
rm -rf feeds/packages/utils/prometheus-node-exporter-lua

#添加smartdns
merge_package master https://github.com/kenzok8/openwrt-packages openwrt-packages/smartdns
merge_package master https://github.com/kenzok8/openwrt-packages openwrt-packages/luci-app-smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns

#添加passwall
merge_package main https://github.com/xiaorouji/openwrt-passwall luci-app-passwall
merge_package main https://github.com/xiaorouji/openwrt-passwall2 luci-app-passwall2

merge_package main https://github.com/xiaorouji/openwrt-passwall-packages brook
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages chinadns-ng
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages tcping
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages trojan-go
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages trojan-plus
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages shadowsocks-rust
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages ssocks
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages dns2socks
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages ipt2socks
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages microsocks 
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages pdnsd-alt
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages v2ray-core
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages v2ray-plugin
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages simple-obfs
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages trojan
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages hysteria
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages sing-box
merge_package main https://github.com/xiaorouji/openwrt-passwall-packages naiveproxy

merge_package master https://github.com/fw876/helloworld luci-app-ssr-plus
merge_package master https://github.com/fw876/helloworld xray-core
merge_package master https://github.com/fw876/helloworld xray-plugin
merge_package master https://github.com/fw876/helloworld shadowsocksr-libev
merge_package master https://github.com/fw876/helloworld lua-neturl
merge_package master https://github.com/fw876/helloworld shadow-tls
merge_package master https://github.com/fw876/helloworld tuic-client
merge_package master https://github.com/fw876/helloworld dns2tcp
merge_package master https://github.com/fw876/helloworld v2ray-geodata
merge_package master https://github.com/fw876/helloworld redsocks2
merge_package master https://github.com/fw876/helloworld gn

merge_package main https://github.com/kenzok8/small-package sagernet-core gost luci-app-gost 
#merge_package https://github.com/breakings/OpenWrt OpenWrt/general/luci-app-gost

#文件助手
#merge_package main https://github.com/Lienol/openwrt-package openwrt-package/luci-app-fileassistant
git clone https://github.com/sxml/luci-app-fileassistant.git package/luci-app-fileassistant

#解析
#merge_package main https://github.com/kenzok8/small-package luci-app-socat lua-maxminddb
merge_package master https://github.com/jerrykuku/lua-maxminddb lua-maxminddb

#添加luci-app-amlogic
merge_package main https://github.com/ophub/luci-app-amlogic luci-app-amlogic
#修改晶晨宝盒默认配置
# 1.设置OpenWrt 文件的下载仓库
sed -i "s|https.*/OpenWrt|https://github.com/sxml/Actions-OpenWrt|g" package/openwrt-packages/luci-app-amlogic/root/etc/config/amlogic
# 2.设置 Releases 里 Tags 的关键字
sed -i "s|ARMv8|ARMv8|g" package/openwrt-packages/luci-app-amlogic/root/etc/config/amlogic
# 3.设置 Releases 里 OpenWrt 文件的后缀
sed -i "s|.img.gz|.img.gz|g" package/openwrt-packages/luci-app-amlogic/root/etc/config/amlogic
# 4.设置 OpenWrt 内核的下载路径
#sed -i "s|opt/kernel|BuildARMv8|g" package/openwrt-packages/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|http.*/library|https://github.com/breakings/OpenWrt/tree/main/opt/kernel|g" package/openwrt-packages/luci-app-amlogic/root/etc/config/amlogic

# themes 主题
merge_package master https://github.com/Leo-Jo-My/luci-theme-opentomcat luci-theme-opentomcat
merge_package main https://github.com/thinktip/luci-theme-neobird luci-theme-neobird
merge_package main https://github.com/gngpp/luci-theme-design luci-theme-design
merge_package master https://github.com/gngpp/luci-app-design-config luci-app-design-config
#参考
#git clone --depth=1 -b master https://github.com/Leo-Jo-My/luci-theme-opentomcat package/openwrt-packages/luci-theme-opentomcat

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

# 临时修复xfsprogs
sed -i 's/TARGET_CFLAGS += -DHAVE_MAP_SYNC/TARGET_CFLAGS += -DHAVE_MAP_SYNC -D_LARGEFILE64_SOURCE/' feeds/packages/utils/xfsprogs/Makefile

./scripts/feeds update -a
./scripts/feeds install -a
