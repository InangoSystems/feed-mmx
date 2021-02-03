################################################################################
#
# Copyright (c) 2013-2021 Inango Systems LTD.
#
# Author: Inango Systems LTD. <support@inango-systems.com>
# Creation Date: 04 Feb 2014
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

PKG_NAME:=mmx-cli
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/InangoSystems/mmx-cli.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=96914c66790dae4c45c69336300ae85820c45e5d
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.xz

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=mmx-frontends
	TITLE:=MMX CLI frontend
	DEPENDS:=+klish +libmmx-frontapi +@BUSYBOX_CONFIG_STTY
	CATEGORY:=Inango
	MAINTAINER:=Inango Systems LTD. <support@inango.com>
	URL:=http://www.inango.com
endef

define Package/$(PKG_NAME)/description
Copyright (c) 2013-2021 Inango Systems LTD.

Author: Inango Systems LTD. <support@inango-systems.com>
Creation Date: 04 Feb 2014

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

define Build/Configure
endef

gfast_is_supported =
ifeq ($(CONFIG_PACKAGE_inango_dpu_en),y)
    gfast_is_supported=y
endif

ifeq ($(CONFIG_PACKAGE_suttle_dpu_en),y)
    gfast_is_supported=y
endif

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CONFIG_MMX_CLI_DEBUG_VIEW="$(CONFIG_MMX_CLI_DEBUG_VIEW)" \
		CONFIG_GFAST_IS_SUPPORTED="$(gfast_is_supported)" \
		CONFIG_MMX_CLI_COPY="$(CONFIG_PACKAGE_mmx-copy-be)" \
		all install
endef

define Package/$(PKG_NAME)/install
	$(CP) -a "$(PKG_INSTALL_DIR)/." "$(1)/"
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
# add line "/usr/sbin/mmx-cli" to file /etc/shells (on real system)

if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -z $$(grep /usr/sbin/mmx-cli /etc/shells) ]; then
		echo /usr/sbin/mmx-cli >> /etc/shells
	fi

	if [ "$(CONFIG_MMX_CLI_DEBUG_VIEW)" == "y" ]; then
		echo "MMX CLI debug view is supported"
	else
		# Debug CLI view is not supported, but if the mmx-cli package 
		# was previously installed with the debug view, 
		# the debug command file may still exist. So we remove it here.
		rm /usr/lib/mmxcli_xml/mmx_cli_debug.xml 2>/dev/null
	fi

    # We need to add [SUID] option to the "busybox.conf" file
	grep "[SUID]" /etc/busybox.conf &>/dev/null
	if [ $$? != 0 ]; then 
		echo "[SUID]" >> /etc/busybox.conf
		echo "su = ssx root.root" >> /etc/busybox.conf
		chmod +s /bin/busybox
	fi

	# The file used only on first boot should be removed
	rm /etc/uci-defaults/mmx-cli.init
fi

exit 0
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh
# remove line "/usr/sbin/mmx-cli" from file /etc/shells (on real system)
if [ -z "$${IPKG_INSTROOT}" ]; then
    grep -v "/usr/sbin/mmx-cli" /etc/shells > /etc/shells.tmp ; mv /etc/shells.tmp /etc/shells
    chmod -s /bin/busybox
fi

exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
