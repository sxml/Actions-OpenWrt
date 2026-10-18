#!/bin/bash
# Files 标签 ID 获取 （F大内核文件） https://api.github.com/repos/sxml/Actions-OpenWrt/releases/latest
wget $(curl -s https://api.github.com/repos/sxml/Actions-OpenWrt/releases/51377457 | grep browser_download_url | cut -d '"' -f 4)
