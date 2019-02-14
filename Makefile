include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for Aqservice
LUCI_DEPENDS:=+aqservice
LUCI_PKGARCH:=all

include ../../luci.mk

# call BuildPackage - OpenWrt buildroot signature