

小白 搬运 https://github.com/HoldOnBro/Actions-OpenWrt


备注

[1] 

设置令牌 / 微信通知
RELEASES_TOKEN
ServerChan

[2] 

releases新建 Files4Compile标签  
上传F大Armbian 和 mk打包文件

Armbian_20.10_Aml-s9xxx_buster_5.4.86-flippy-51+o.img.xz

Armbian_20.10_Aml-s9xxx_buster_5.9.16-flippy-51+.img.xz

mk_openwrt_src_20201231.tar.gz

[3]

修改 Files4Compile ID 

文件路径 aarch64/getImgs.sh

#Files4CompileID获取 https://api.github.com/repos/sxml/Actions-OpenWrt/releases/latest

wget $(curl -s https://api.github.com/repos/sxml/Actions-OpenWrt/releases/ xxxxx | grep browser_download_url | cut -d '"' -f 4)

[4] 

运行ARMv8_SFE.yml

单击Run workflow右侧的按钮。设置SSH connection to Actions 为 true

SSH显示Web终端地址 打开

按Ctrl+C 粘贴命令： cd openwrt && make menuconfig   进行个性化配置

完成后，按快捷键Ctrl+D或执行exit命令以退出，随后的编译工作将自动进行。

编译完成生成标签Files4Build 打包用文件


[5]

修改 Files4Build  ID 

ARMv8_Build.yml 第95行  

sudo wget $(curl -s https://api.github.com/repos/sxml/Actions-OpenWrt/releases/XXXXX | grep browser_download_url | cut -d '"' -f 4)

获取最新版本
https://api.github.com/repos/sxml/Actions-OpenWrt/releases/latest

获取版本列表
https://api.github.com/repos/sxml/Actions-OpenWrt/releases

sxml：github账号，根据需要换成需要的

Actions-OpenWrt：github托管的repo项目名，更换为自己想要的


=======================================================
# Actions-OpenWrt

Build OpenWrt and publish docker image using GitHub Actions

Credit to ***P3TERX***, ***bin20088*** and ***flippy***，this is just a combination of their work.

The firmwares released are for S9xxx devices, Newifi_D2, G-Dock, amd64 and the J4125 with rtl8125 ethernet device.

Feel free to [fork](https://github.com/HoldOnBro/Actions-OpenWrt/generate) or just pull [my docker image](https://hub.docker.com/r/minirailgun/openwrt-aarch64/tags) to save time, it will be updated everyday.

## How to Use

You need to add 4(at least the first one) secrets to make Actions work.

1. **RELEASES_TOKEN**, which should be your Github **Personal Access Token** with at least the *public_repo* checked.
2. **DOCKER_USERNAME**(Optional, if you don't need an aarch64 docker img) is your dockerhub username.
3. **DOCKER_PASSWORD**(Optional, if you don't need an aarch64 docker img) , which is actually not the password for your dockerhub account but the **Access Token** generated from dockerhub Account Settings.
4. **ServerChan**(Optional, but remember to comment out relational action in ymls) , the **SCKEY** for your serverchan account. [click here for more information](http://sc.ftqq.com/3.version)

[P3TERX大佬写的中文教程|Usage Guide in Chinese](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


## Some Hints

### NetData
  If NetData doesn't work correctly,

  Take N1 as an example,

  SSH into container and run command :``chown -R root:root /usr/share/netdata/``

  then refresh the ``IP:19999``, it should be working properly.

### IP and Password
  Default IPs for those devices can be found in bash scripts (``DEVICE_NAME.sh``) associated with them.
  
  Password by default is ``password``.
  
### aarch64
~~There are three versions of firmware for this arch.~~
  
~~The ones with ``NA-`` prefix contain No Acc applications.~~
  
  Those named as ``S-*`` are SFE type, they are faster but not fully tested, may have some instability issues.
  
~~And the left ones named as ``F-*`` are flowoffload type, stable but a little bit slower.~~
  
~~Choose ``S-*`` type if you feel adventurous or use the other ones for convenience.~~

### Newifi_D2
  
  1. **Lite Version**: A light fw for NewifiD2.
  
  2. **Normal Version**: based on **lite**, added TUN in SSRPlus and UnblockNetease(with **NodeJS**), jd-dailybonus.
  
  Just choose the one suits your need.
  
~~BTW, if you encounter any hardware instability problems like auto-reboot for no reason, having no access to Internet,~~
  ~~**TURN OFF** the **HWNAT** under ``network->hwacc``.~~
  ~~Refer to [1](https://github.com/coolsnowwolf/lede/issues/4531), [2](https://github.com/openwrt/openwrt/pull/1916) for more details.~~
  ~~Or you can use the [PandoraBox](http://downloads.pangubox.com:6380/), it has **NO** HWNAT issues.~~

## Acknowledgments

- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [bin20088/Bin](https://github.com/bin20088/Bin)
- [Microsoft](https://www.microsoft.com)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cisco](https://www.cisco.com/)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
