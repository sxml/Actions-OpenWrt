#!/bin/bash
#============================================================
# 2026-10-20   sxml
#============================================================
#移除不用软件包
rm -rf feeds/luci/applications/luci-app-dockerman
#rm -rf package/lean/luci-app-wrtbwmon
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
#rm -fr feeds/luci/themes/luci-theme-design
rm -rf feeds/luci/applications/luci-app-ddns-go
rm -rf feeds/packages/net/ddns-go
#重新编译时没有旧的或不必要的文件干扰 #staging_dir：编译生成的文件和依赖库 #build_dir：软件包的源代码和编译生成的文件
rm -rf staging_dir build_dir
rm -rf feeds/packages/net/shadowsocks-libev

# 设置ttyd免帐号登录
sed -i 's/\/bin\/login/\/bin\/login -f root/' feeds/packages/utils/ttyd/files/ttyd.config

# 克隆 kenzok8仓库
# git clone --depth=1 https://github.com/kenzok8/openwrt-packages.git kenzok8-packages
# cp -rf kenzok8-packages/smartdns package/smartdns
# cp -rf kenzok8-packages/luci-app-smartdns package/luci-app-smartdns
#cp -rf kenzok8-packages/luci-theme-argon package/luci-theme-argon
#cp -rf kenzok8-packages/ddns-go package/ddns-go
#cp -rf kenzok8-packages/gost package/gost
#rm -rf kenzok8-packages

#克隆 pymumu 仓库 smartdns 20260405
# 克隆LEDE分支的luci界面（适配旧版）
# 1. 添加 SmartDNS 核心程序（pymumu/openwrt-smartdns）
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns.git feeds/packages/net/smartdns
# 2. 添加 SmartDNS LuCI 界面（使用 lede 分支，兼容 coolsnowwolf/lede）
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns

# 克隆immortalwrt-luci仓库
# git clone --depth=1 -b openwrt-18.06 https://github.com/immortalwrt/luci.git immortalwrt-luci
# cp -rf immortalwrt-luci/applications/luci-app-smartdns package/luci-app-smartdns

# 克隆 kenzok8 small仓库
git clone --depth=1 https://github.com/kenzok8/small.git small-package
#cp -rf small-package/gost package/gost
#cp -rf small-package/luci-app-gost package/luci-app-gost
#cp -rf small-package/sagernet-core package/sagernet-core
#cp -rf small-package/v2ray-geodata package/v2ray-geodata
cp -rf small-package/brook package/brook
cp -rf small-package/ssocks package/ssocks
cp -rf small-package/pdnsd-alt package/pdnsd-alt
cp -rf small-package/trojan-go package/trojan-go
cp -rf small-package/dns2tcp package/dns2tcp
# cp -rf small-package/v2ray-geoview package/v2ray-geoview
rm -rf small-package

# 克隆 fw876 仓库
git clone --depth=1 -b main https://github.com/fw876/helloworld.git
#cp -rf helloworld/luci-app-ssr-plus package/luci-app-ssr-plus
cp -rf helloworld/xray-core package/xray-core
#cp -rf helloworld/xray-plugin package/xray-plugin
# cp -rf helloworld/shadowsocks-libev package/shadowsocks-libev
cp -rf helloworld/shadowsocks-rust package/shadowsocks-rust
#cp -rf helloworld/shadowsocksr-libev package/shadowsocksr-libev
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
rm -rf helloworld

# 克隆 sbwml 仓库 shadowsocksr-libev 问题 20251021
#命令中的 -b v5 的意思是指定要克隆的分支（branch）为 v5
#命令中的--depth=1 只复制仓库最新的1个提交历史
# git clone --depth=1 -b v5 https://github.com/sbwml/openwrt_helloworld.git
# cp -rf openwrt_helloworld/shadowsocksr-libev package/shadowsocksr-libev

# 克隆openwrt-passwall仓库
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git
#cp -rf openwrt-passwall-packages/brook package/brook
#cp -rf openwrt-passwall-packages/ssocks package/ssocks
cp -rf openwrt-passwall-packages/simple-obfs package/simple-obfs
#cp -rf openwrt-passwall-packages/pdnsd-alt package/pdnsd-alt
cp -rf openwrt-passwall-packages/chinadns-ng package/chinadns-ng
cp -rf openwrt-passwall-packages/tcping package/tcping
#cp -rf openwrt-passwall-packages/trojan-go package/trojan-go
cp -rf openwrt-passwall-packages/trojan-plus package/trojan-plus
cp -rf openwrt-passwall-packages/hysteria package/hysteria
#cp -rf openwrt-passwall-packages/dns2tcp package/dns2tcp
cp -rf openwrt-passwall-packages/sing-box package/sing-box
cp -rf openwrt-passwall-packages/v2ray-geodata package/v2ray-geodata
cp -rf openwrt-passwall-packages/xray-plugin package/xray-plugin
cp -rf openwrt-passwall-packages/shadowsocksr-libev package/shadowsocksr-libev
rm -rf openwrt-passwall-packages

#passwall
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall.git
cp -rf openwrt-passwall/luci-app-passwall package/luci-app-passwall
rm -rf openwrt-passwall

#passwall2
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall2.git
cp -rf openwrt-passwall2/luci-app-passwall2 package/luci-app-passwall2
rm -rf openwrt-passwall2

#解析
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
rm -rf lua-maxminddb

#添加晶晨宝盒
git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git
cp -rf luci-app-amlogic/luci-app-amlogic package/luci-app-amlogic
rm -rf luci-app-amlogic
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
# git clone --depth=1 https://github.com/sxml/luci-theme-design.git package/luci-theme-design
# git clone --depth=1 https://github.com/sxml/luci-app-design-config.git package/luci-app-design-config
# rm -rf luci-theme-design
# rm -rf luci-app-design-config

#mosdns
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns
#命令中的 -b v5-lua 的意思是指定要克隆的分支（branch）为 v5-lua
git clone --depth=1 -b v5-lua https://github.com/sbwml/luci-app-mosdns mosdns-tmp
cp -rf mosdns-tmp/luci-app-mosdns package/luci-app-mosdns
cp -rf mosdns-tmp/mosdns package/mosdns
rm -rf mosdns-tmp

#添加ddns-go 动态域名解析
#git clone --depth=1 https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
git clone --depth=1 -b lua https://github.com/sirpdboy/luci-app-ddns-go.git
cp -rf luci-app-ddns-go/ddns-go package/ddns-go
cp -rf luci-app-ddns-go/luci-app-ddns-go package/luci-app-ddns-go
rm -rf luci-app-ddns-go
rm -rf ddns-go

#小猫
git clone --depth=1 https://github.com/vernesong/OpenClash.git
cp -rf OpenClash/luci-app-openclash package/luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
rm -rf OpenClash

#202607 vim报错
# rm -rf feeds/packages/utils/vim
# git clone https://github.com/openwrt/packages.git --depth=1 -b openwrt-18.06 feeds-tmp
# cp -r feeds-t/utils/vim feeds/packages/utils/
# rm -rf feeds-tmp

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

./scripts/feeds update -a
./scripts/feeds install -a

#------------------------------------------------------------------------------
# libcryptopp 编译问题：在 Makefile 里显式指定编译器
#   注意：真实 Makefile 是 "include $(INCLUDE_DIR)/package.mk"（include 后有空格）
#   用 $(TARGET_CROSS) 而非硬编码前缀；带存在性判断 + 幂等判断
#   清缓存不需要写 make clean —— part2 里已 rm -rf staging_dir build_dir
#------------------------------------------------------------------------------
LC_MK=package/lean/libcryptopp/Makefile
if [ ! -f "$LC_MK" ]; then
    echo "[part1] 跳过 libcryptopp 修补：$LC_MK 不存在"
elif grep -q 'TARGET_CC:=\$(TARGET_CROSS)gcc' "$LC_MK"; then
    echo "[part1] libcryptopp 已修补过，跳过"
else
    sed -i '/^include \$(INCLUDE_DIR)\/package\.mk/a TARGET_CC:=$(TARGET_CROSS)gcc\nTARGET_CXX:=$(TARGET_CROSS)g++' "$LC_MK"
    echo "[part1] 已修补 libcryptopp：显式指定 TARGET_CC / TARGET_CXX"
fi

#==============================================================================
# 2026-10-17 修复：python 包的 wheel 文件名大小写不确定 → installer 找不到文件
#------------------------------------------------------------------------------
# 两次不同的失败，同一个根因：
#   FileNotFoundError: .../pypi/itsdangerous-2.1.2//openwrt-build/-2.1.2-*.whl   （名字整个空了）
#   FileNotFoundError: .../pypi/PyYAML-6.0.1//openwrt-build/pyyaml-6.0.1-*.whl    （大小写不符）
#
# 根因：python3-package.mk / python3-host-build.mk 的 install 配方写死了
#         "$(PYTHON3_PKG_BUILD_DIR)"/openwrt-build/$(PYTHON3_PKG_WHEEL_NAME)-$(PYTHON3_PKG_WHEEL_VERSION)-*.whl
#       而 PYTHON3_PKG_WHEEL_NAME 的默认值是
#         $(subst -,_,$(if $(PYPI_SOURCE_NAME),$(PYPI_SOURCE_NAME),$(PKG_NAME)))
#       ——只把 '-' 换成 '_'，【不做小写化】。
#       可实产 wheel 的名字取决于包自己的元数据：
#         · 带 pyproject.toml [project] 的（Cython 3.x）→ 规范化成小写 cython-3.0.10-*.whl
#         · 只有 setup.py 的（PyYAML 6.0.1）         → 原样保留大写 PyYAML-6.0.1-*.whl
#       Linux 区分大小写，所以「一律改小写」和「一律不改」都必然误伤一部分包。
#
#       历史教训：曾按「PYPI 名含大写就改小写」批量覆盖了 21 个包。先挂 itsdangerous，
#       修掉判断逻辑后又在 python-yaml 挂——两次都是这一处。证明"猜名字"这条路走不通。
#
# 方案：不再猜。把两处 install 配方的 glob 从
#         <名字>-<版本>-*.whl   →   *.whl
#       `python -m build --wheel` 每次构建在 openwrt-build/ 下只产出一个 whl，
#       通配必然命中，与大小写、命名规范、包类型都无关。
#       同时清掉历史注入的 PYTHON3_*_WHEEL_NAME 覆盖行（改完通配后它们是死代码）。
#
# 必须在 feeds update/install 之后执行（feeds 更新会覆盖这些 mk 文件）。
#==============================================================================
wheel_glob_fix() {
  _f="$1"
  _var="$2"
  if [ ! -f "$_f" ]; then
    echo "[wheel-glob-fix] 跳过（文件不存在）: $_f"
    return 0
  fi
  if grep -q 'openwrt-build/\*\.whl' "$_f"; then
    echo "[wheel-glob-fix] $(basename "$_f")：已修补过，跳过"
    return 0
  fi
  # 用 [$] [*] [.] 逐字符转义，避开 BRE 元字符歧义
  sed -i "s|openwrt-build/[$](${_var}_WHEEL_NAME)-[$](${_var}_WHEEL_VERSION)-[*][.]whl|openwrt-build/*.whl|" "$_f"
  if grep -q 'openwrt-build/\*\.whl' "$_f"; then
    echo "[wheel-glob-fix] $(basename "$_f")：install glob → openwrt-build/*.whl"
  else
    echo "[wheel-glob-fix] !! $(basename "$_f")：未匹配到预期文本"
    echo "[wheel-glob-fix] !! 上游 mk 结构可能已变，请手工检查 install 配方"
  fi
}
wheel_glob_fix feeds/packages/lang/python/python3-package.mk    PYTHON3_PKG
wheel_glob_fix feeds/packages/lang/python/python3-host-build.mk PYTHON3_HOST

# 清掉历史注入的覆盖行。只删「PKG 与 HOST 两项都存在且值完全相同」的成对行——
# 上游自己写的覆盖一般只有一条，或两条值不同，不会命中。
for _f in feeds/packages/lang/python/*/Makefile; do
  [ -f "$_f" ] || continue
  grep -qE '^PYTHON3_(PKG|HOST)_WHEEL_NAME:=' "$_f" || continue
  _pn=$(sed -n 's/^PYTHON3_PKG_WHEEL_NAME:=\(.*\)$/\1/p' "$_f" | head -n1)
  _hn=$(sed -n 's/^PYTHON3_HOST_WHEEL_NAME:=\(.*\)$/\1/p' "$_f" | head -n1)
  if [ -n "$_pn" ] && [ "$_pn" = "$_hn" ]; then
    sed -i '/^PYTHON3_PKG_WHEEL_NAME:=/d; /^PYTHON3_HOST_WHEEL_NAME:=/d' "$_f"
    echo "[wheel-glob-fix] 清除历史覆盖: $(basename "$(dirname "$_f")") ($_pn)"
  fi
done

#==============================================================================
# 2026-10-20 精简 LuCI 状态菜单：去掉「信道分析」（channel_analysis）
#------------------------------------------------------------------------------
# 1) 它属于 luci-mod-status（LuCI 核心包，概览/路由/防火墙/日志/进程/实时信息都在里面），
#    不能整体关掉这个包，只能在 feeds install 之后从包内移除。
# 2) 两处都要处理：
#    · 菜单项在 root/usr/share/luci/menu.d/luci-mod-status.json 的
#      "admin/status/channel_analysis" 键；
#    · 视图在 htdocs/luci-static/resources/view/status/channel_analysis.js（约 27KB）。
#    只删视图不删菜单 → 点进去报错；只删菜单不删视图 → 文件照样打进固件白占空间。
# 3) 电视盒子没有 wifi 硬件，这个页面恒为空白（菜单靠 depends.uci wireless
#    @wifi-device 才会显示，Lede 默认 /etc/config/wireless 里有个 disabled 的 radio0）。
# 4) feeds 是每次编译全新 clone 的临时目录，rm 不会有副作用。
#==============================================================================
LMS_DIR=feeds/luci/modules/luci-mod-status
MENU_DIR="$LMS_DIR/root/usr/share/luci/menu.d"
CA_JS="$LMS_DIR/htdocs/luci-static/resources/view/status/channel_analysis.js"

if [ ! -d "$LMS_DIR" ]; then
  echo "[part2] 跳过信道分析清理：$LMS_DIR 不存在"
else
  # 第一步：删菜单项。python 失败只告警，绝不中断编译。
  # KEEP_JS 默认 1（保守保留视图），只有「确实删掉了菜单项」才置 0。
  KEEP_JS=1
  if [ -d "$MENU_DIR" ] && command -v python3 >/dev/null 2>&1; then
    if CA_OUT=$(python3 - "$MENU_DIR" <<'PY'
import glob, io, json, os, sys

menu_dir = sys.argv[1]
changed = 0
for path in glob.glob(os.path.join(menu_dir, "*.json")):
    with io.open(path, encoding="utf-8") as fh:
        data = json.load(fh)
    if "admin/status/channel_analysis" in data:
        del data["admin/status/channel_analysis"]
        with io.open(path, "w", encoding="utf-8", newline="\n") as fh:
            fh.write(json.dumps(data, indent="\t", ensure_ascii=False) + "\n")
        changed += 1
        print("[part2] 已移除菜单项 admin/status/channel_analysis -> %s" % path)
print("[part2] 信道分析菜单清理完成，改动文件数: %d" % changed)
PY
    ); then
      printf '%s\n' "$CA_OUT"
      case "$CA_OUT" in
        *"改动文件数: 0"*) KEEP_JS=1 ;;
        *) KEEP_JS=0 ;;
      esac
    else
      printf '%s\n' "$CA_OUT"
      echo "[part2] !! 菜单清理失败（已忽略，不中断编译）"
    fi
  else
    echo "[part2] 未找到 python3 或 menu.d，跳过菜单清理"
  fi

  # 第二步：只有确认菜单项已消失，才删视图。
  # 顺序不能反：视图没了菜单还在 → 点进去报错；菜单没了视图还在，只是白占 27KB，无害。
  if [ "$KEEP_JS" = "1" ]; then
    echo "[part2] 未确认菜单项被移除（可能上游改名/无 python3），保留 channel_analysis.js 以免点进去报错"
  elif [ -f "$CA_JS" ]; then
    rm -f "$CA_JS"
    echo "[part2] 已移除信道分析视图: channel_analysis.js"
  else
    echo "[part2] 信道分析视图不在（或路径变化），跳过删除"
  fi
fi
