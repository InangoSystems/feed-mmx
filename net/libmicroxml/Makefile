#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libmicroxml
PKG_VERSION:=2.0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/pivasoftware/microxml.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=80a15162f3a8318c70e8688d8ecbfc38676bd9a2

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/libmicroxml
  SECTION:=libs
  CATEGORY:=Inango
  TITLE:=XML library
endef

define Package/libmicroxml/description
 A micro sized XML library
endef

CONFIGURE_ARGS += \
	--disable-threads \
	--enable-static \
	--enable-shared

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/microxml.h $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libmicroxml.so* $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_BUILD_DIR)/microxml.pc $(1)/usr/lib/pkgconfig
endef

define Package/libmicroxml/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libmicroxml.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,libmicroxml))
