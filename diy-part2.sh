#!/bin/bash
#============================================================
# # 2024-02-03
#https://github.com/breakings/OpenWrt
#============================================================
echo "开始 DIY2 配置……"
echo "========================="
#function merge_package(){
#    repo=$(echo $1 | rev | cut -d'/' -f 1 | rev)
#    pkg=$(echo $2 | rev | cut -d'/' -f 1 | rev)
#    git clone --depth=1 --single-branch $1
#    if [ -d "package/custom/$pkg" ]; then
#        rm -rf "package/custom/$pkg"
#    fi
#    mv $2 "package/custom/"
#    rm -rf $repo
#}
function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}
function merge_feed(){
    if [ ! -d "feed/$1" ]; then
        echo >> feeds.conf.default
        echo "src-git $1 $2" >> feeds.conf.default
    fi
    ./scripts/feeds update $1
    ./scripts/feeds install -a -p $1
}
rm -rf package/custom; mkdir package/custom

#移除不用软件包
#rm -rf package/lean/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-dockerman
#rm -rf package/lean/luci-app-wrtbwmon
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -fr feeds/luci/themes/luci-theme-design
#rm -fr feeds/packages/libs/libxslt
#rm -fr feeds/packages/lang/perl
#rm -rf feeds/packages/net/samba4
#20231010
#rm -rf feeds/packages/utils/prometheus-node-exporter-lua

#添加smartdns
merge_package https://github.com/kenzok8/openwrt-packages openwrt-packages/smartdns
merge_package https://github.com/kenzok8/openwrt-packages openwrt-packages/luci-app-smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns

#添加passwall
merge_package https://github.com/xiaorouji/openwrt-passwall openwrt-passwall/luci-app-passwall
merge_package https://github.com/xiaorouji/openwrt-passwall2 openwrt-passwall2/luci-app-passwall2

merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/brook
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/chinadns-ng
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/tcping
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/trojan-go
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/trojan-plus
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/shadowsocks-rust
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/ssocks
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/dns2socks
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/ipt2socks
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/microsocks 
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/pdnsd-alt
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/v2ray-core
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/v2ray-plugin
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/simple-obfs
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/trojan
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/hysteria
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/sing-box
merge_package https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall-packages/naiveproxy

merge_package https://github.com/fw876/helloworld helloworld/luci-app-ssr-plus
merge_package https://github.com/fw876/helloworld helloworld/xray-core
merge_package https://github.com/fw876/helloworld helloworld/xray-plugin
merge_package https://github.com/fw876/helloworld helloworld/shadowsocksr-libev
merge_package https://github.com/fw876/helloworld helloworld/lua-neturl
merge_package https://github.com/fw876/helloworld helloworld/shadow-tls
merge_package https://github.com/fw876/helloworld helloworld/tuic-client
merge_package https://github.com/fw876/helloworld helloworld/dns2tcp
#merge_package https://github.com/fw876/helloworld helloworld/v2ray-geodata
merge_package https://github.com/fw876/helloworld helloworld/redsocks2
merge_package https://github.com/fw876/helloworld helloworld/gn

merge_package https://github.com/kenzok8/openwrt-packages openwrt-packages/gost
merge_package https://github.com/breakings/OpenWrt OpenWrt/general/luci-app-gost

merge_package https://github.com/kenzok8/small-package small-package/v2ray-geodata
#merge_package https://github.com/kenzok8/small-package small-package/sagernet-core

#文件助手
#merge_package https://github.com/Lienol/openwrt-package openwrt-package/luci-app-fileassistant
git clone https://github.com/sxml/luci-app-fileassistant.git package/luci-app-fileassistant

#解析
merge_package https://github.com/jerrykuku/lua-maxminddb lua-maxminddb

#添加luci-app-amlogic
merge_package https://github.com/ophub/luci-app-amlogic luci-app-amlogic
#修改晶晨宝盒默认配置
# 1.设置OpenWrt 文件的下载仓库
sed -i "s|https.*/OpenWrt|https://github.com/sxml/Actions-OpenWrt|g" package/custom/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
# 2.设置 Releases 里 Tags 的关键字
sed -i "s|ARMv8|ARMv8|g" package/custom/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
# 3.设置 Releases 里 OpenWrt 文件的后缀
sed -i "s|.img.gz|.img.gz|g" package/custom/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
# 4.设置 OpenWrt 内核的下载路径
#sed -i "s|opt/kernel|BuildARMv8|g" package/custom/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|http.*/library|https://github.com/breakings/OpenWrt/tree/main/opt/kernel|g" package/custom/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic

# themes 主题
merge_package https://github.com/Leo-Jo-My/luci-theme-opentomcat luci-theme-opentomcat
merge_package https://github.com/thinktip/luci-theme-neobird luci-theme-neobird
merge_package https://github.com/gngpp/luci-theme-design luci-theme-design
merge_package https://github.com/gngpp/luci-app-design-config luci-app-design-config

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

# 临时修复xfsprogs
#sed -i 's/TARGET_CFLAGS += -DHAVE_MAP_SYNC/TARGET_CFLAGS += -DHAVE_MAP_SYNC -D_LARGEFILE64_SOURCE/' feeds/packages/utils/xfsprogs/Makefile

#试修改shadowsocks-rust
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.17.1/g' package/custom/shadowsocks-rust/Makefile
#sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' package/custom/shadowsocks-rust/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=ac172822b579ac0fe59e4cc519e9f4ffee32ed069b10ffdc7421fb1bfdb8c03e/g' package/custom/shadowsocks-rust/Makefile
#shadowsocks-rust
#merge_package https://github.com/breakings/OpenWrt OpenWrt/general/shadowsocks-rust

#试修改libxslt
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.1.37/g' feeds/packages/libs/libxslt/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/libs/libxslt/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=3a4b27dc8027ccd6146725950336f1ec520928f320f144eb5fa7990ae6123ab4/g' feeds/packages/libs/libxslt/Makefile
sed -i 's/PKG_SOURCE:=.*/PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz/g' feeds/packages/libs/libxslt/Makefile
sed -i 's/PKG_SOURCE_URL:=.*/PKG_SOURCE_URL:=@GNOME/libxslt/$(basename $(PKG_VERSION))/g' feeds/packages/libs/libxslt/Makefile

#修改perl
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=$(PERL_VERSION)/g' feeds/packages/lang/perl/Makefile
#sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/perl/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=d91115e90b896520e83d4de6b52f8254ef2b70a8d545ffab33200ea9f1cf29e8/g' feeds/packages/lang/perl/Makefile

./scripts/feeds update -a
./scripts/feeds install -a

echo "========================="
echo " DIY2 配置完成……"
