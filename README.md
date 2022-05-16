                                                                                小白折腾备忘 


                               SSH 连接操作 （SSH 在线配置 提取.config用  编译固件 小心封号！！！）                                                                       


    Actions→ 选择 提取config.yml→ 然后单击Run workflow右侧的按钮。设置SSH connection to Actions 输入 true  点 Run workflow 运行

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
      
     电报推送消息 设置方法 https://github.com/danshui-git/shuoming/blob/master/bot.md

       #- name: Telegram notification
       
       
【2】Releases 新建标签 Files

      手动上传 F大 打包文件
      
【3】获取 Files 标签ID  （F大打包文件）  https://api.github.com/repos/sxml/Actions-OpenWrt/releases
               
       https://api.github.com/repos/（github账号）/（ 项目名称）/releases 
  
     修改 aarch64/getImgs.sh

    wget $(curl -s https://api.github.com/repos/sxml/Actions-OpenWrt/releases/（Files 标签ID）

【4】Actions

    运行-编译op包-x版（Build_FOL.yml）
     
     
【5】获取 Build 标签ID

      修改 Flippy_Openwrt.yml 
  
     sudo wget $(curl -s https://api.github.com/repos/sxml/Actions-OpenWrt/releases/（Build 标签ID )
     
     
【6】运行 Flippy打包 （Flippy_Openwrt.yml）
      
      完成
      Releases/tag/ARMv8 标签里

  
  --------------------------------------------------------------------------------------
  
小白搬运

1: https://github.com/HoldOnBro/Actions-OpenWrt

2: https://github.com/281677160/build-actions

3：https://github.com/ophub

云编译说明 https://github.com/danshui-git/shuoming

F大  https://github.com/unifreq/openwrt_packit
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
