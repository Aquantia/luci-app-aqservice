# LUCI-APP-AQSERVICE
This package provides WEB UI for control aqservice

How to build package:
* Checkout this package
* Run ./scripts/feeds update luci
* Checkout this package to feeds/luci/applications
* Run again ./scripts/feeds update packages
* Cd to openwrt src root directory and run ./scripts/feeds install -ap luci
* Run make menuconfig and shoose Luci -> applications -> luci-app-aqservice and press select 
* Exit from menuconfig and save your configuration
* Run make package/luci-app-aqservice/compile
* Cd to bin/packages/<Processor arhitecture>/luci/ and find aqservice.<version><arhitecture>.ipk