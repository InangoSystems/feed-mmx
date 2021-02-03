################################################################################
#
# Makefile
#
# Copyright (c) 2013-2021 Inango Systems LTD.
#
# Author: Inango Systems LTD. <support@inango-systems.com>
# Creation Date: 01 Jan 2013
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

PKG_NAME:=mmx-ep
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/InangoSystems/mmx-ep.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=033b05fef89c1ea63ba3f87efcf90b601ee74560
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.xz

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Inango
	TITLE:=mmx-ep
	DEPENDS:=+libubox +libing-gen-utils +libmmx-frontapi +libmmx-backapi +libmicroxml +libsqlite3 +luasql-sqlite3
	MAINTAINER=Inango Systems LTD. <support@inango.com>
	URL=http://www.inango.com
endef

define Package/$(PKG_NAME)/description
Copyright (c) 2013-2021 Inango Systems LTD.

Author: Inango Systems LTD. <support@inango-systems.com>
Creation Date: 01 Jan 2013

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


define Package/$(PKG_NAME)/config
	source "$(SOURCE)/Config.in"
endef


ifneq ($(CONFIG_MMX_EP_EXT_THRESHOLD),)
ifneq ($(CONFIG_MMX_EP_EXT_THRESHOLD),0)
TARGET_CFLAGS += -DMMX_EP_EXT_THRESHOLD=$(CONFIG_MMX_EP_EXT_THRESHOLD)
TARGET_CFLAGS += -DMMX_EP_EXT_QUERY_TIMEOUT=$(CONFIG_MMX_EP_EXT_QUERY_TIMEOUT)
WITH_MMX_EP_EXT=y
endif
endif

ifeq ($(CONFIG_PACKAGE_ing-tmp-overlay),y)
TARGET_CFLAGS += -DING_TMP_OVERLAY
endif

ifeq ($(CONFIG_EP_USE_SYSLOG),y)
TARGET_CFLAGS += -DUSE_SYSLOG
endif

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CONFIG_MMX_BE_IPADDR="$(CONFIG_MMX_BE_IPADDR)" \
		CONFIG_EP_MAX_OBJECTS_NUM="$(CONFIG_EP_MAX_OBJECTS_NUM)" \
		CONFIG_EP_MAX_PARAMS_PER_OBJECT="$(CONFIG_EP_MAX_PARAMS_PER_OBJECT)" \
		CONFIG_EP_MAX_INDECES_PER_OBJECT="$(CONFIG_EP_MAX_INDECES_PER_OBJECT)" \
		CONFIG_EP_SUBST_VALUES_NUMBER="$(CONFIG_EP_SUBST_VALUES_NUMBER)" \
		CONFIG_EP_MAX_METHOD_STR_LEN="$(CONFIG_EP_MAX_METHOD_STR_LEN)" \
		CONFIG_EP_MAX_LEAF_NAME_LEN="$(CONFIG_EP_MAX_LEAF_NAME_LEN)" \
		CONFIG_EP_MAX_PARAM_TYPE_LEN="$(CONFIG_EP_MAX_PARAM_TYPE_LEN)" \
		CONFIG_EP_MAX_UNITS_STR_LEN="$(CONFIG_EP_MAX_UNITS_STR_LEN)" \
		CONFIG_EP_MAX_BENAME_STR_LEN="$(CONFIG_EP_MAX_BENAME_STR_LEN)" \
		CONFIG_EP_SQL_REQUEST_BUF_SIZE="$(CONFIG_EP_SQL_REQUEST_BUF_SIZE)" \
		CONFIG_EP_TP_WORKER_THREADS_NUM="$(CONFIG_EP_TP_WORKER_THREADS_NUM)" \
		CONFIG_EP_PTHREAD_STACK_SIZE="$(CONFIG_EP_PTHREAD_STACK_SIZE)" \
		CONFIG_EP_MAX_INSTANCES_PER_OBJECT="$(CONFIG_EP_MAX_INSTANCES_PER_OBJECT)" \
		CONFIG_EP_USE_SYSLOG="$(CONFIG_EP_USE_SYSLOG)" \
		CONFIG_WITH_MMX_EP_EXT="$(CONFIG_WITH_MMX_EP_EXT)" \
		all install
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/mmx-ep $(1)/usr/sbin/

	$(INSTALL_BIN) ./files/mmxep_env.sh $(1)/usr/sbin/
ifeq ($(CONFIG_PACKAGE_ing-tmp-overlay),y)
	$(INSTALL_DIR) $(1)/lib/ingsave
	$(INSTALL_BIN) ./files/mmx_save_ingtmp_overlay.sh $(1)/lib/ingsave
else
	# use to work without ing-tmp-overlay package
	$(INSTALL_BIN) ./files/mmx_save_cfgfiles.sh $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/mmx_restore_cfgfiles.sh $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
ifeq ($(CONFIG_EP_USE_SYSLOG),y)
	$(INSTALL_BIN) ./files/mmx_extinit_syslog.sh $(1)/etc/init.d/mmx_extinit
else
	$(INSTALL_BIN) ./files/mmx_extinit.sh $(1)/etc/init.d/mmx_extinit
endif
	$(INSTALL_DIR) $(1)/etc/mmx/saved-config
endif
	$(INSTALL_DIR) $(1)/etc/init.d
ifeq ($(CONFIG_EP_USE_SYSLOG),y)
	$(INSTALL_BIN) ./files/mmxep_init_syslog.sh $(1)/etc/init.d/mmxep_init
else
	$(INSTALL_BIN) ./files/mmxep_init.sh $(1)/etc/init.d/mmxep_init
endif
	$(INSTALL_DIR) $(1)/etc/mmx/saved-db
	$(INSTALL_DIR) $(1)/etc/mmx/cand-db
	$(INSTALL_DIR) $(1)/usr/lib/lua/mmx
	$(INSTALL_BIN) ./files/lua/mmx_db_reformat_utils.lua $(1)/usr/lib/lua/mmx/mmx_db_reformat_utils.lua
	$(INSTALL_BIN) ./files/lua/mmx_db_reformat_perform.lua $(1)/usr/lib/lua/mmx/mmx_db_reformat_perform.lua
	$(INSTALL_BIN) ./files/lua/mmx_db_get_version.lua $(1)/usr/lib/lua/mmx/mmx_db_reformat_get_version.lua
	$(INSTALL_BIN) ./files/lua/mmx_db_clear.lua $(1)/usr/lib/lua/mmx/mmx_db_reformat_clear.lua
endef

define Package/$(PKG_NAME)/preinst
#!/bin/sh
# check if we are on real system, then stop the mmx-ep
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -e /etc/init.d/mmxep_init ]; then
		/etc/init.d/mmxep_init stop ## TODO ! or we want restart if running ?
		if [ $$? -ne 0 ]; then
			echo "Warning: mmxep_init stop_and_clean returned error !"
		fi
	fi
fi
exit 0
endef


define Package/$(PKG_NAME)/postinst
#!/bin/sh
# check if we are on real (target) system
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -e /usr/sbin/mmx-ep ] &&
	   [ -e /etc/init.d/mmxep_init ]; then

		echo "Enabling rc.d symlink for mmx-ep"
		/etc/init.d/mmxep_init enable
	fi

	if [ -e /usr/sbin/mmx-ep ] &&
	   [ -e /etc/init.d/mmxep_extinit ]; then

		echo "Enabling rc.d symlink for mmx-ep extinit file"
		/etc/init.d/mmxep_extinit enable
	fi

fi
exit 0
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh
# check if we are on real (target) system
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -e /usr/sbin/mmx-ep ] &&
	   [ -e /etc/init.d/mmxep_init ]; then

		echo "Stopping mmx-ep"
		/etc/init.d/mmxep_init stop
		echo "Removing rc.d symlink for mmx-ep"
		/etc/init.d/mmxep_init disable
	fi

	if [ -e /usr/sbin/mmx-ep ] &&
	   [ -e /etc/init.d/mmxep_extinit ]; then

		echo "Stopping mmx-ep"
		/etc/init.d/mmxep_extinit stop
		echo "Removing rc.d symlink for mmx-ep ext init script"
		/etc/init.d/mmxep_extinit disable
	fi
fi
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
