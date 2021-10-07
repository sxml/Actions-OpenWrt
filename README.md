                                                                                折腾备注 


                               SSH 连接操作 （SSH 现在只能 在线配置 提取.config用 不能编译固件 封号！！！）

在线配置.config  提取                                                                                     
                                     UPLOAD_CONFIG: true


运行 编译*版op包 （Build_FOL.yml）                                                                                 
旧#运行 ARMv8_SFE.yml

    Actions→ 选择xxx.yml→ 然后单击Run workflow右侧的按钮。设置SSH connection to Actions 输入 true  点 Run workflow 运行

    页面运行到SSH connection to Actions 点击显示的连接 进入SSH

   （Web终端可能会遇到黑屏，只需按即可Ctrl+C）

    输入命令：cd openwrt && make menuconfig 进行个性化配置。

   完成后，按快捷键Ctrl+D或执行exit命令以退出，随后的编译工作将自动进行
   
-----------------------------------------------------------------------------------------------

【1】 生成新令牌

      1 个人中心：设置→开发人员设置→个人访问令牌→生成新令牌

     （名称：RELEASES_TOKEN，勾择：public_repo，复制RELEASES_TOKEN令牌的值）。

      Settings → Developer settings → Personal access tokens → Generate new token

      2 操作代码中心：设置→机密→新机密（名称：RELEASES_TOKEN，值：粘贴令牌的值）。

      Settings → Secrets → New secret
telegram，电报推送消息 设置方法 https://github.com/danshui-git/shuoming/blob/master/bot.md

       .yml文件里开启

       #- name: Telegram notification
【2】在Releases 新建标签 Files4Compile

      手动上传 F大 打包文件
【3】获取 Files4Compile 标签ID （F大打包文件的 ID） https://api.github.com/repos/sxml2015/Actions-OpenWrt/releases

       https://api.github.com/repos/（github账号）/（ 项目名称）/releases 
  
     修改 aarch64/getImgs.sh

wget $(curl -s https://api.github.com/repos/sxml2015/Actions-OpenWrt/releases/（Files4Compile 标签ID）
【4】Actions

    运行 编译*版op包 （Build_FOL.yml）
     
     旧文件
     #ARMv8_SFE.yml 编译
     #ARMv8_FOL.yml 编译 
【5】获取 Files4Build 标签ID https://api.github.com/repos/sxml2015/Actions-OpenWrt/releases

      修改 Flippy_Openwrt.yml 
  
  sudo wget $(curl -s https://api.github.com/repos/sxml2015/Actions-OpenWrt/releases/（ARMv8_OpenWrt 标签ID )
     
     旧文件 
     #修改 ARMv8_Build.yml  (用 Files4Build ID)
【6】运行 Flippy打包 （Flippy_Openwrt.yml）

  旧 #运行 
  ARMv8_Build.yml 打包 
  
  --------------------------------------------------------------------------------------
  
小白搬运

1: https://github.com/HoldOnBro/Actions-OpenWrt

2: https://github.com/281677160/build-actions

云编译说明 https://github.com/danshui-git/shuoming

---------------------------------------------------------------------------------------
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
