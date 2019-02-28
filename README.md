# LuCi package for AQRouter

## Description
This LuCi package expands functionality and improve usability of [AQRouter service](https://github.com/Aquantia/router).

## Requirements
For AQRouter service usage is required:
* OpenWRT router
* LuCi package
* AQRouter service

## Functionality
Current package provide next functionality:
* Enable/disable AQRouter service via WebUI
* Set management port for AQRouter service via WebUI
* Set password for management interface of AQRouter

## How to build package:
**```<openWRTdir>```** is openwrt source root directory 
1. Execute next commands:
   - cd **openWRTdir**
   - **./scripts/feeds update luci**
   - Copy **luci-app-aqservice** folder to **openWRTdir/feeds/luci/applications**
   - **./scripts/feeds update luci**
   - **./scripts/feeds install -a -p luci**
   - **make menuconfig**
2. choose **Luci -> applications -> luci-app-aqservice** and press **select** button
3. Exit from menuconfig and save your configuration
4. **make package/luci-app-aqservice/compile**
5. Binary package may be found at **openWRTdir/bin/packages/proccessor arhitecture/luci/** as **luci-app-aqservice.ipk**