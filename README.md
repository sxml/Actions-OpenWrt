

小白 搬运  https://github.com/HoldOnBro/Actions-OpenWrt

折腾 备注

【1】 生成新令牌

1 个人中心：设置→开发人员设置→个人访问令牌→生成新令牌

（名称：RELEASES_TOKEN，勾择：public_repo，复制RELEASES_TOKEN令牌的值）。

Settings → Developer settings → Personal access tokens → Generate new token
2 操作代码中心：设置→机密→新机密（名称：RELEASES_TOKEN，值：粘贴令牌的值）。

Settings → Secrets → New secret

如果需要telegram，电报推送消息 设置方法

https://github.com/danshui-git/shuoming/blob/master/bot.md

.yml 文件里开启

#- name: Telegram notification

【2】在Releases 新建标签 Files4Compile

手动上传 F大 打包文件

新的

boot-5.4.113-flippy-xxx+o.tar

boot-5.10.31-flippy-xxx+.tar

dtb-allwinner-5.4.113-flippy-xxx+o.tar

dtb-allwinner-5.10.31-flippy-xxx+.tar

dtb-amlogic-5.4.113-flippy-xxx+o.tar

dtb-amlogic-5.10.31-flippy-xxx+.tar

dtb-rockchip-5.4.113-flippy-xxx+o.tar

dtb-rockchip-5.10.31-flippy-xxx+.tar

modules-5.4.113-flippy-xxx+o.tar

modules-5.10.31-flippy-xxx+.tar

mk_openwrt_src_xxx.tar

旧的

#1.mk_openwrt_src_xxx.tar.gz /打包工具

#2.Armbian_20.10_Aml-s9xxx_buster_5.4.83-flippy-50+o.img.xz / Armbian +o 文件

#3.Armbian_20.10_Aml-s9xxx_buster_5.9.14-flippy-50+.img.xz / Armbian + 文件

【3】获取 Files4Compile ID

github账号 Actions-OpenWrt 项目名 sxml/Actions-OpenWrt

https://api.github.com/repos/sxml/Actions-OpenWrt/releases

修改 aarch64/getImgs.sh

wget $(curl -s https://api.github.com/repos/sxml/Actions-OpenWrt/releases/39391954 | grep browser_download_url | cut -d '"' -f 4)

【4】Actions 运行

ARMv8_SFE.yml 编译

ARMv8_FOL.yml 编译

【5】获取 Files4Build ID 修改ARMv8_Build.yml

https://api.github.com/repos/sxml/Actions-OpenWrt/releases

修改 ARMv8_Build.yml ID

sudo wget $(curl -s https://api.github.com/repos/sxml/Actions-OpenWrt/releases/39397290 | grep browser_download_url | cut -d '"' -f 4)

【6】运行 ARMv8_Build.yml 打包

Actions 运行 ARMv8_SFE.yml

--------------------------------------------------------------------------------------

SSH 连接操作

Actions→ 选择xxx.yml→ 然后单击Run workflow右侧的按钮。设置SSH connection to Actions: true →点 Run workflow 运行

页面运行到SSH connection to Actions 点击显示的连接 进入SSH

（Web终端可能会遇到黑屏，只需按即可Ctrl+C）

输入命令：cd openwrt && make menuconfig 进行个性化配置。

完成后，按快捷键Ctrl+D或执行exit命令以退出，随后的编译工作将自动进行

--------------------------------------------------------------------------------------

云编译说明 https://github.com/danshui-git/shuoming


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
