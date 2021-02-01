################################################################################
#
# Makefile
# 
# Copyright (c) 2013-2021 Inango Systems LTD.
#
# Author: Inango Systems LTD. <support@inango-systems.com>
# Creation Date: 01 Aug 2013
#
# The author may be reached at support@inango-systems.com
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 
# Subject to the terms and conditions of this license, each copyright holder
# and contributor hereby grants to those receiving rights under this license
# a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
# (except for failure to satisfy the conditions of this license) patent license
# to make, have made, use, offer to sell, sell, import, and otherwise transfer
# this software, where such license applies only to those patent claims, already
# acquired or hereafter acquired, licensable by such copyright holder or contributor
# that are necessarily infringed by:
# 
# (a) their Contribution(s) (the licensed copyrights of copyright holders and
# non-copyrightable additions of contributors, in source or binary form) alone;
# or
# 
# (b) combination of their Contribution(s) with the work of authorship to which
# such Contribution(s) was added by such copyright holder or contributor, if,
# at the time the Contribution is added, such addition causes such combination
# to be necessarily infringed. The patent license shall not apply to any other
# combinations which include the Contribution.
# 
# Except as expressly stated above, no rights or licenses from any copyright
# holder or contributor is granted under this license, whether expressly, by
# implication, estoppel or otherwise.
# 
# DISCLAIMER
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# NOTE
# 
# This is part of a management middleware software package called MMX that was developed by Inango Systems Ltd.
# 
# This version of MMX provides web and command-line management interfaces.
# 
# Please contact us at Inango at support@inango-systems.com if you would like to hear more about
# - other management packages, such as SNMP, TR-069 or Netconf
# - how we can extend the data model to support all parts of your system
# - professional sub-contract and customization services
# 
################################################################################

include $(TOPDIR)/rules.mk

PKG_NAME:=mmx-web
PKG_VERSION:=2.0.0
PKG_RELEASE:=1


include $(INCLUDE_DIR)/package.mk


PKG_BUILD_BIN:=$(PKG_BUILD_DIR)/$(MAKE_PATH)/bin

PKG_CONFIG_DEPENDS:=\

define Package/$(PKG_NAME)/config
  source "$(SOURCE)/Config.in"
endef


define Package/$(PKG_NAME)
  SECTION:=mng
  TITLE:=MMX WEB
  URL:=http://www.inango.com/
  DEFAULT:=y
  CATEGORY=Inango
  MAINTAINER=Inango Systems LTD. <support@inango.com>
  URL=http://www.inango.com
  DEPENDS:=+libpthread +luci-theme-openwrt +libiwinfo-lua +uhttpd +librt +luci-mod-admin-full +libc +mmx-web-lib-chartist
endef


define Package/$(PKG_NAME)/description
Copyright (c) 2013-2021 Inango Systems LTD.

Author: Inango Systems LTD. <support@inango-systems.com>
Creation Date: 01 Aug 2013

The author may be reached at support@inango-systems.com

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

Subject to the terms and conditions of this license, each copyright holder
and contributor hereby grants to those receiving rights under this license
a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
(except for failure to satisfy the conditions of this license) patent license
to make, have made, use, offer to sell, sell, import, and otherwise transfer
this software, where such license applies only to those patent claims, already
acquired or hereafter acquired, licensable by such copyright holder or contributor
that are necessarily infringed by:

(a) their Contribution(s) (the licensed copyrights of copyright holders and
non-copyrightable additions of contributors, in source or binary form) alone;
or

(b) combination of their Contribution(s) with the work of authorship to which
such Contribution(s) was added by such copyright holder or contributor, if,
at the time the Contribution is added, such addition causes such combination
to be necessarily infringed. The patent license shall not apply to any other
combinations which include the Contribution.

Except as expressly stated above, no rights or licenses from any copyright
holder or contributor is granted under this license, whether expressly, by
implication, estoppel or otherwise.

DISCLAIMER

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

NOTE

This is part of a management middleware software package called MMX that was developed by Inango Systems Ltd.

This version of MMX provides web and command-line management interfaces.

Please contact us at Inango at support@inango-systems.com if you would like to hear more about
- other management packages, such as SNMP, TR-069 or Netconf
- how we can extend the data model to support all parts of your system
- professional sub-contract and customization services
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/mmx
	$(INSTALL_BIN) ./src/mmx_web_routines.lua $(1)/usr/lib/lua/luci/mmx/mmx_web_routines.lua

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_BIN) ./src/mmx-controller.lua $(1)/usr/lib/lua/luci/controller/mmx.lua

ifeq ($(CONFIG_PACKAGE_mmx-user-be),y)
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view
	$(INSTALL_BIN) ./files/sysauth.htm $(1)/usr/lib/lua/luci/view/sysauth.htm
endif

	$(INSTALL_DIR) $(1)/usr/lib/lua/mmx
ifeq ($(CONFIG_PACKAGE_mmx-user-be),y)
	# patched controller/admin/index.lua to allow Luci login for MMX added users
	$(INSTALL_BIN) ./src/mmx_admin_index.lua $(1)/usr/lib/lua/mmx
endif

	#patched network.lua to ignore tap interfaces
	$(INSTALL_BIN) ./luci/mmx-model-network.lua $(1)/usr/lib/lua/mmx

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/mmx-web.init $(1)/etc/uci-defaults

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/mmx
	$(INSTALL_BIN) ./files/view-mmx.htm $(1)/usr/lib/lua/luci/view/mmx/mmx.htm
	$(INSTALL_BIN) ./files/view-mmx-vector.htm $(1)/usr/lib/lua/luci/view/mmx/mmx-vector.htm
	$(INSTALL_BIN) ./files/view-mmx-matrix.htm $(1)/usr/lib/lua/luci/view/mmx/mmx-matrix.htm
	$(INSTALL_BIN) ./files/view-mmx-tablegroup.htm $(1)/usr/lib/lua/luci/view/mmx/mmx-tablegroup.htm
	$(INSTALL_BIN) ./files/view-mmx-field.htm $(1)/usr/lib/lua/luci/view/mmx/mmx-field.htm

	$(INSTALL_DIR) $(1)/www/luci-static/resources/
	$(INSTALL_BIN) ./files/mmx.js $(1)/www/luci-static/resources/mmx.js
	$(INSTALL_BIN) ./files/jquery-ui-1.10.4.custom.css $(1)/www/luci-static/resources/jquery-ui-1.10.4.custom.css
	$(INSTALL_BIN) ./files/jquery-ui-1.10.4.custom.min.js $(1)/www/luci-static/resources/jquery-ui-1.10.4.custom.min.js
	$(INSTALL_BIN) ./files/jquery-1.10.1.min.js $(1)/www/luci-static/resources/jquery-1.10.1.min.js
	$(INSTALL_BIN) ./files/jquery.fix.clone.js $(1)/www/luci-static/resources/jquery.fix.clone.js
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	# apply patch to allow Luci login for MMX added users
	if [ -e /usr/lib/lua/luci/controller/admin/index.lua -a -e /usr/lib/lua/mmx/mmx_admin_index.lua ]; then
		cp /usr/lib/lua/mmx/mmx_admin_index.lua /usr/lib/lua/luci/controller/admin/index.lua
	fi

	# apply patch to force Luci ignore tap interfaces
	if [ -e /usr/lib/lua/luci/model/network.lua -a -e /usr/lib/lua/mmx/mmx-model-network.lua ]; then
		cp /usr/lib/lua/mmx/mmx-model-network.lua /usr/lib/lua/luci/model/network.lua
	fi
fi
exit 0
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh
# check if we are on real system
#if [ -z "$${IPKG_INSTROOT}" ]; then
#
#fi
exit 0
endef

define Build/Compile
	@echo "Nothing to compile"
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

