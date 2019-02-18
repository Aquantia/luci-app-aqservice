# This package provides WEB UI for control aqservice

**`<openWRTdir> is openwrt source root directory `**

How to build package:
1. Cd to **openWRTdir** and run  **./scripts/feeds update luci**
1. Copy luci-app-aqservice folder to **openWRTdir/feeds/luci/applications**
1. Cd to **openWRTdir** and repeat **./scripts/feeds update luci**
1. Execute **./scripts/feeds install -a -p luci**
1. Run **make menuconfig** and choose **Luci -> applications -> luci-app-aqservice** and press **select** button
1. Exit from menuconfig and save your configuration
1. Cd to **openWRTdir** and run **make package/luci-app-aqservice/compile**
1. Binary package may be found at **openWRTdir/bin/packages/proccessor arhitecture/luci/** as **luci-app-aqservice.ipk**