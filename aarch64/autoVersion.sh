#!/bin/bash

OpVersion=$(echo "$(cat /workdir/openwrt/package/lean/default-settings/files/zzz-default-settings)" | grep -Po "DISTRIB_REVISION=\'\K[^\']*")

echo $OpVersion

sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" `grep OPENWRT_VER=.* -rl /opt/openwrt/`
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s905d_n1.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s905d_n1_tf.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s905d_n1_fol.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s905x3_multi.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s905x3_multi_tf.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s905x3_multi_fol.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_beikeyun_opimg.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_l1pro_opimg.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_n1_opimg.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_n1_opimg_sfe.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s905x3_opimg.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s905x3_opimg_sfe.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/mk_s922x_opimg.sh
#sed -i "s/OPENWRT_VER=.*/OPENWRT_VER=\"$OpVersion\"/" /opt/openwrt/n1-to-vplus.sh
