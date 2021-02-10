################################################################################
#
# Makefile
#
# Copyright (c) 2013-2021 Inango Systems LTD.
#
# Author: Inango Systems LTD. <support@inango-systems.com>
# Creation Date: 01 Nov 2015
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

PKG_NAME:=inango-prplmesh-en
PKG_VERSION:=2.0.1
PKG_RELEASE:=1

PKG_BUILD_DATE:=$(shell date "+%b %d %Y")

include $(INCLUDE_DIR)/package.mk

define Package/inango-prplmesh-en
  TITLE:=Inango prplMesh MMX frontend properties
  SUBMENU:=themes
  URL:=http://www.inango.com/
  CATEGORY:=Inango
  MAINTAINER:=Inango Systems LTD. <support@inango.com>
  URL:=http://www.inango.com
  DEPENDS:=
endef

define Package/$(PKG_NAME)/description
Copyright (c) 2013-2021 Inango Systems LTD.

Author: Inango Systems LTD. <support@inango-systems.com>
Creation Date: 01 Nov 2015

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

ifeq (,$(wildcard ./files/$(PKG_NAME)_password))
	password_file = "$(SOURCE)/../default_inango_en/files/default_inango_en_password"
else
	password_file = "./files/$(PKG_NAME)_password"
endif

base_network_conffile = ./conffiles/network
base_mmxbridge_conffile = ./conffiles/mmxbridge
ifeq ($(CONFIG_TARGET_x86),y)
	network_conffile = ./conffiles/network.x86
	mmxbridge_conffile = ./conffiles/mmxbridge.x86
	platform_name = x86
else
	network_conffile = $(base_network_conffile)
	mmxbridge_conffile = $(base_mmxbridge_conffile)
	platform_name = base
endif


# define global variables
MMX_DEFAULTS_PATH=/usr/lib/mmx/mmx-defaults
MMX_DEFAULTS_DB_PATH=$(MMX_DEFAULTS_PATH)/db
MMX_DEFAULTS_DB_REFOFMAT_PATH=$(MMX_DEFAULTS_PATH)/db_reformat
MMX_DEFAULTS_CONF_PATH=$(MMX_DEFAULTS_PATH)/config/
MMX_DEFAULTS_PASSWORD_FILE=$(MMX_DEFAULTS_PATH)/$(PKG_NAME)_password
MMX_DEFAULTS_PRODUCT_FILE=$(MMX_DEFAULTS_PATH)/product_info
MMX_DEFAULTS_UPD_PRODUCT_FILE=$(MMX_DEFAULTS_PATH)/product_info_upd

# Prepare all doc files for the customer
# and files for other packages
define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/doc/mmx-help
	$(CP) ./frontend/HELP/* $(STAGING_DIR_HOST)/doc/mmx-help/.

	$(INSTALL_DIR) $(1)/usr/share/customers/frontends
	$(CP) ./frontend/* $(1)/usr/share/customers/frontends
endef

define Package/inango-prplmesh-en/install
	# Presentation files processing
	$(INSTALL_DIR) $(1)/www/luci-static/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/themes/$(PKG_NAME)
	# inango dpu own presentation files
	$(INSTALL_BIN) ./showfiles/cascade.css $(1)/www/luci-static/$(PKG_NAME)/cascade.css

	$(INSTALL_BIN) ./showfiles/inango_logo.svg $(1)/www/luci-static/$(PKG_NAME)/
	$(INSTALL_BIN) ./showfiles/powered-by-inango.svg $(1)/www/luci-static/$(PKG_NAME)/
	$(INSTALL_BIN) ./showfiles/prplmesh_logo.svg $(1)/www/luci-static/$(PKG_NAME)/

	$(INSTALL_BIN) ./showfiles/footer.htm $(1)/usr/lib/lua/luci/view/themes/$(PKG_NAME)/
	$(INSTALL_BIN) ./showfiles/header.htm $(1)/usr/lib/lua/luci/view/themes/$(PKG_NAME)/
	$(INSTALL_BIN) ./showfiles/header_login.htm $(1)/usr/lib/lua/luci/view/themes/$(PKG_NAME)/
	$(INSTALL_BIN) ./showfiles/sysauth.htm $(1)/usr/lib/lua/luci/view/themes/$(PKG_NAME)/

	$(INSTALL_DIR) $(1)/www/luci-static/$(PKG_NAME)/fontawesome
	$(CP) ./showfiles/fontawesome/* $(1)/www/luci-static/$(PKG_NAME)/fontawesome/.
	$(INSTALL_DIR) $(1)/www/luci-static/$(PKG_NAME)/webfonts
	$(CP) ./showfiles/webfonts/* $(1)/www/luci-static/$(PKG_NAME)/webfonts/.

	# MMX db files processing
	$(INSTALL_DIR) $(1)/$(MMX_DEFAULTS_DB_PATH)
	$(INSTALL_BIN) ./mmxdbfiles/db/mmx_meta_db $(1)/$(MMX_DEFAULTS_DB_PATH)/mmx_meta_db
	$(INSTALL_BIN) ./mmxdbfiles/db/mmx_main_db $(1)/$(MMX_DEFAULTS_DB_PATH)/mmx_main_db
	$(INSTALL_DIR) $(1)/$(MMX_DEFAULTS_DB_REFOFMAT_PATH)
	$(INSTALL_BIN) ./mmxdbfiles/db_reformat/*.lua $(1)/$(MMX_DEFAULTS_DB_REFOFMAT_PATH)/

	# WEB files processing
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/mmx
	$(INSTALL_BIN) ./frontend/WEB/*.lua $(1)/usr/lib/lua/luci/mmx/

	# CLI files processing
	$(INSTALL_DIR) $(1)/usr/lib/mmxcli_xml
	$(INSTALL_BIN) ./frontend/CLI/*.xml $(1)/usr/lib/mmxcli_xml
	$(INSTALL_BIN) ./showfiles/startup.xml $(1)/usr/lib/mmxcli_xml

	# UCI-defaults init script processing
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/uci-defaults/luci-theme-openwrt-$(PKG_NAME)
	if [ -f "$(password_file)" ]; then \
	    $(CP) $(password_file) $(1)/$(MMX_DEFAULTS_PASSWORD_FILE); \
	fi

	# Customer specific sysctl configuration
	$(INSTALL_DIR) $(1)/etc/sysctl.d
	$(INSTALL_CONF) ./files/$(PKG_NAME).sysctl $(1)/etc/sysctl.d/15-$(PKG_NAME).conf

	# UCI files processing
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)$(MMX_DEFAULTS_CONF_PATH)
	# - Processing network UCI file:
	#   - Look for $(network_conffile) in conffiles folder and copy when present;
	#     otherwise look for $(base_network_conffile) and copy it when present;
	#     otherwise - do nothing (there is probably no network conffiles needed).
	if [ -f "$(network_conffile)" ]; then \
		$(CP) $(network_conffile) $(1)$(MMX_DEFAULTS_CONF_PATH)/network ; \
	elif [ -f "$(base_network_conffile)" ]; then \
		$(CP) $(base_network_conffile) $(1)$(MMX_DEFAULTS_CONF_PATH)/network ; \
	fi
	# - Processing mmxbridge UCI file:
	#   - Look for $(mmxbridge_conffile) in conffiles folder and copy when present;
	#     otherwise look for $(base_mmxbridge_conffile) and copy it when present;
	#     otherwise - do nothing (there is probably no network conffiles needed).
	if [ -f "$(mmxbridge_conffile)" ]; then \
		$(CP) $(mmxbridge_conffile) $(1)$(MMX_DEFAULTS_CONF_PATH)/mmxbridge ; \
	elif [ -f "$(base_mmxbridge_conffile)" ]; then \
		$(CP) $(base_mmxbridge_conffile) $(1)$(MMX_DEFAULTS_CONF_PATH)/mmxbridge ; \
	fi

	# Processing the rest UCI files
	for f in `ls ./conffiles/`; do if [ "$$$${f:0:7}" != "network" -a "$$$${f:0:9}" != "mmxbridge" ]; then $(CP) ./conffiles/$$$$f $(1)/$(MMX_DEFAULTS_CONF_PATH)/. ; fi ; done

	# Product info file processing
	$(INSTALL_CONF) ./files/*product_info $(1)/$(MMX_DEFAULTS_PRODUCT_FILE)
	$(INSTALL_BIN) ./files/*product_info_upd $(1)/$(MMX_DEFAULTS_UPD_PRODUCT_FILE)

	# Install keep file
	$(INSTALL_DIR) $(1)/lib/upgrade/keep.d/
	$(CP) ./files/$(PKG_NAME).keep  $(1)/lib/upgrade/keep.d/$(PKG_NAME).keep

	# Install SOURCE files
	# Permitted interfaces libraries (LUA modules)
	$(INSTALL_DIR) $(1)/usr/lib/lua/mmx
	#  Permitted IP interfaces
	$(INSTALL_BIN) ./src/mmx_ip_permifaces.lua $(1)/usr/lib/lua/mmx/
	#  -------------------------------------------------------------
	#  Permitted Ethernet interfaces (per platform adjustment with a special conffile)
	$(INSTALL_BIN) ./src/mmx_eth_permifaces.lua $(1)/usr/lib/lua/mmx/
	#  platform_name is defined above in this file
	tmp=$$$$(grep ^$(platform_name)= ./src/mmx_eth_permifaces.config | cut -d= -f2-) ; \
	sed -i 's/^PLATFORM_ETH_PERMIFACES = \"\".*/PLATFORM_ETH_PERMIFACES = \"'"$$$$tmp"'\"/g' \
		$(1)/usr/lib/lua/mmx/mmx_eth_permifaces.lua
	#  -------------------------------------------------------------
	#  Permitted MAC Filter interfaces
	#   TODO
	#  -------------------------------------------------------------
	#  Permitted Bridge/Bridge port interfaces
	#  -------------------------------------------------------------
	$(INSTALL_BIN) ./src/mmx_bridge_permifaces.lua $(1)/usr/lib/lua/mmx/

#!/bin/sh
	# Set the product SW version according to this package version
	sed -i 's/^SoftwareVersion=.*/SoftwareVersion=$(PKG_VERSION).$(PKG_RELEASE)/g' $(1)/$(MMX_DEFAULTS_PRODUCT_FILE)
	sed -i 's/^SoftwareBuildDate=.*/SoftwareBuildDate=$(PKG_BUILD_DATE)/g' $(1)/$(MMX_DEFAULTS_PRODUCT_FILE)
endef

define Package/inango-prplmesh-en/preinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	# abort installation if other customer package already exists on the board
	if [ -e /etc/customer_pkg_name ]; then
		cust_pkg=$$(cat /etc/customer_pkg_name 2>/dev/null)

		if [ "$$cust_pkg" != "$(PKG_NAME)" ]; then
			echo -e " - Other Customer package ($$cust_pkg) was found.\n"\
					"- It should be removed before installation of this package.\n"\
					"- No more than one customer package is allowed."
			exit 1
		fi
	fi

	# if mmx-ep installed and running - stop it, clean mmx dbs
	if [ -e /etc/init.d/mmxep_init ]; then
		/etc/init.d/mmxep_init stop
		if [ $$? -ne 0 ]; then
			echo "Warning: mmxep_init stop returned error !"
		fi
	fi
fi
exit 0
endef

define Package/inango-prplmesh-en/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	if [ -f "/$(MMX_DEFAULTS_PASSWORD_FILE)" ]; then
	    # Set default password
	    password=`cat /$(MMX_DEFAULTS_PASSWORD_FILE)`
	    (echo $$password; sleep 1; echo $$password) | passwd root >/dev/null 2>&1
	fi

	# Set luci theme as customerTheme
	uci set luci.themes.customerTheme=/luci-static/$(PKG_NAME)
	uci set luci.main.mediaurlbase=/luci-static/$(PKG_NAME)
	uci commit

	# Processing of UCI config files:
	#  the package specific UCI files are inserted to the common /etc/config directory.
	#
	# After package installation the following files will be located in
	# /etc/config:
	# - config files with suffix ".orig" - these are copies of the "original" files
	#       existing before the customer package is installed. They will be
	#       used to restore configuration after the package is removed.
	#  - config files with suffix of the package name ("-inango-prplmesh-en")
	#       They show which config files are customer specific. They are
	#       deleted when packed is un-installed
	#  - config files without any suffix (usual UCI config files). They are
	#       used as regular UCI config file to keep the device configuration information.

	isInstalled=`cat /etc/customer_pkg_name 2>/dev/null`
	echo Applying conffiles. Package name is $(PKG_NAME)

	pkg_name=$(PKG_NAME)

	INGTMP_OVRL=`ls /usr/bin/tmpovrlctl 2> /dev/null`
	if [ -z "$$isInstalled" ]; then
		echo "This is the first install of pkg $$pkg_name"

		echo "Copy all config files of the package"
		for f in `ls /$(MMX_DEFAULTS_CONF_PATH)/ 2>/dev/null`; do
		   echo "Command: cp /etc/config/$$f /etc/config/$$f.orig"
		   cp /etc/config/$$f /etc/config/$$f.orig

			echo "Command: cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f-$$pkg_name"
			cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f-$$pkg_name

			echo "Command: cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f"
			cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f

			if [ -z "$$INGTMP_OVRL" ] ; then
		    # Save all config files of the package in the saved-config directory.
		    echo "Command: cp /etc/config/$$f-$$pkg_name  /etc/mmx/saved-config/."
		    cp /etc/config/$$f-$$pkg_name  /etc/mmx/saved-config/.
		    echo "Command: cp /etc/config/$$f /etc/mmx/saved-config/."
		    cp /etc/config/$$f /etc/mmx/saved-config/.
		    echo "Command: cp /etc/config/$$f.orig /etc/mmx/saved-config/."
		    cp /etc/config/$$f.orig /etc/mmx/saved-config/.
	    fi
		done

	else
		echo "This is re-install of the pkg"

		echo "Search for config files that stopped to be in use"
		for f in `ls /etc/config/*-$$pkg_name 2>/dev/null`; do
			fname=$${f##*/}
			if [ ! -e  /$(MMX_DEFAULTS_CONF_PATH)/$${fname%-$$pkg_name} -a -e  /etc/config/$${fname%-$$pkg_name}.orig ] ; then
				echo "File $${fname%-$$pkg_name} is not in use by the package any more;"
				echo "Restore the original config file"

				echo "Command: cp /etc/config/$${fname%-$$pkg_name}.orig  /etc/config/$${fname%-$$pkg_name}"
				cp /etc/config/$${fname%-$$pkg_name}.orig  /etc/config/$${fname%-$$pkg_name}

				if [ -z "$$INGTMP_OVRL" ] ; then
					echo "Command: cp /etc/config/$${fname%-$$pkg_name}.orig  /etc/mmx/saved-config/$${fname%-$$pkg_name}"
					cp /etc/config/$${fname%-$$pkg_name}.orig  /etc/mmx/saved-config/$${fname%-$$pkg_name}

					echo "Command: rm /etc/mmx/saved-config/$$fname-$$pkg_name 2>/dev/null"
					rm /etc/mmx/saved-config/$$fname-$$pkg_name 2>/dev/null
				fi
				echo "Command: rm $$f"
				rm $$f
			fi
		done

		echo "Search for new config files (coming with the new version of the package)"
		for f in `ls /$(MMX_DEFAULTS_CONF_PATH)/ 2>/dev/null`; do
			if [ ! -e  /etc/config/$$f-$$pkg_name ] ; then
				echo "A new config file in the package: $$f"

				echo "Command: cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f-$$pkg_name"
				cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f-$$pkg_name

				echo "Command: cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f"
				cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f
				if [ -z "$$INGTMP_OVRL" ] ; then
					echo "cp /$(MMX_DEFAULTS_CONF_PATH)/$$f  /etc/mmx/saved-config/. "
					cp /$(MMX_DEFAULTS_CONF_PATH)/$$f  /etc/mmx/saved-config/.

					echo "cp /$(MMX_DEFAULTS_CONF_PATH)/$$f  /etc/mmx/saved-config/$$f-$$pkg_name"
					cp /$(MMX_DEFAULTS_CONF_PATH)/$$f  /etc/mmx/saved-config/$$f-$$pkg_name
				fi
			fi
		done

		echo "Process all existing config files"
		for f in `ls /$(MMX_DEFAULTS_CONF_PATH)/ 2>/dev/null`; do
			if [ -e /etc/config/$$f-$$pkg_name ] ; then
				echo "An existing config file $$f will be kept"

				echo "Command: cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f-$$pkg_name"
				cp /$(MMX_DEFAULTS_CONF_PATH)/$$f /etc/config/$$f-$$pkg_name
			fi
		done
	fi  # if [ -z "$$isInstalled" ]

	# Processing of the device product info file
	# Read the board product info from the flash memory and save it in the file.
	# Flash memory access is platform specific operation.
	# TODO: add flash read command for all supported CPU platforms

	rt_prod_file="/etc/mmx/product_info"
	cp /$(MMX_DEFAULTS_PRODUCT_FILE) $$rt_prod_file
	echo "Save product info from the default file"

	flash_cmd=
	if [ "$(CONFIG_TARGET_winpath)" == "y" ]; then
		flash_cmd="/bin/flash-env-util env "
	fi

	if [ -n "$$flash_cmd" ] ; then
		SN=`$$flash_cmd BOARD_SN 2>/dev/null | cut -f 2 -d"="`
		MNFC=`$$flash_cmd BOARD_MANUFACTURER 2>/dev/null | cut -f 2 -d"="`
		echo "Manufacturer: $$MNFC"
		MNFC_OUI=`$$flash_cmd BOARD_MFC_OUI 2>/dev/null | cut -f 2 -d"="`
		MNFC_PEN=`$$flash_cmd BOARD_MFC_PEN 2>/dev/null | cut -f 2 -d"="`
		PRODCLASS=`$$flash_cmd BOARD_PROD_CLASS 2>/dev/null | cut -f 2 -d"="`
		MODEL=`$$flash_cmd BOARD_MODEL 2>/dev/null | cut -f 2 -d"="`
		DESCR=`$$flash_cmd BOARD_DESCRIPTION 2>/dev/null | cut -f 2 -d"="`
		HWREV=`$$flash_cmd BOARD_HW_REV 2>/dev/null | cut -f 2 -d"="`
		BOARDMAC=`$$flash_cmd BOARD_MAC_DFE0 2>/dev/null | cut -f 2 -d"="`
		BOARDMACETHX=`$$flash_cmd BOARD_MAC_ETHX 2>/dev/null | cut -f 2 -d"="`
	fi
	echo "Serial Number read from flash: $$SN; Model Name: $$MODEL"
	echo "Mnfctr: $$MNFC, Mnfctr OUI: $$MNFC_OUI,  Mnfctr PEN: $$MNFC_PEN, Product class: $$PRODCLASS"
	echo "Board description: $$DESCR, Board MAC: $$BOARDMAC"

	[ -n "$$SN" ] && sed -i 's/^SerialNumber=.*/SerialNumber='"$$SN"'/g' $$rt_prod_file
	[ -n "$$MNFC" ] && sed -i 's/^Manufacturer=.*/Manufacturer='"$$MNFC"'/g' $$rt_prod_file
	[ -n "$$MNFC_OUI" ] && sed -i 's/^ManufacturerOUI=.*/ManufacturerOUI='"$$MNFC_OUI"'/g' $$rt_prod_file
	[ -n "$$MNFC_PEN" ] && sed -i 's/^EnterpriseNumber=.*/EnterpriseNumber='"$$MNFC_PEN"'/g' $$rt_prod_file
	[ -n "$$PRODCLASS" ] && sed -i 's/^ProductClass=.*/ProductClass='"$$PRODCLASS"'/g' $$rt_prod_file
	[ -n "$$MODEL" ] && sed -i 's/^ModelName=.*/ModelName='"$$MODEL"'/g' $$rt_prod_file
	[ -n "$$DESCR" ] && sed -i 's/^Description=.*/Description='"$$DESCR"'/g' $$rt_prod_file
	[ -n "$$HWREV" ] && sed -i 's/^HardwareVersion=.*/HardwareVersion='"$$HWREV"'/g' $$rt_prod_file
	[ -n "$$BOARDMAC" ] && sed -i 's/^BoardMACAddress=.*/BoardMACAddress='"$$BOARDMAC"'/g' $$rt_prod_file
	[ -n "$$BOARDMACETHX" ] && sed -i 's/^BoardBaseMACAddress=.*/BoardBaseMACAddress='"$$BOARDMACETHX"'/g' $$rt_prod_file

	# Remove file used only for first boot
	rm /etc/uci-defaults/luci-theme-openwrt-$(PKG_NAME)
	[ -f "/$(MMX_DEFAULTS_PASSWORD_FILE)" ] && rm /$(MMX_DEFAULTS_PASSWORD_FILE)
	# Create service file with name of installed customer package
	echo $(PKG_NAME) > /etc/customer_pkg_name
	# Remove the mmx-defaults left from a previous version
	# in previous version MMX-1.0 mmx-defaults were in "/etc/mmx-defaults"
	# in version MMX-1.03 mmx-defaults has been moved to "/usr/lib/mmx/mmx-defaults"
	if [ -d "/etc/mmx-defaults" ] ; then
	rm -rf /etc/mmx-defaults
    fi
	# Notify user that reboot is needed after modification of conffiles

	echo "New configuration files were applied. Reboot is recommended"
fi
exit 0
endef

define Package/inango-prplmesh-en/prerm
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
	INGTMP_OVRL=`ls /usr/bin/tmpovrlctl 2> /dev/null`

	# if mmx-ep installed and running - stop it, clean temporary db
	# TODO!
	#     Think do we need to stop_and_clean the mmx-ep here;
	#     May be mmx-ep should manage the DBs during start, not now.
	echo "MMX Entry-point will be stopped and all management information will be cleaned"
	if [ -e /etc/init.d/mmxep_init ]; then
		/etc/init.d/mmxep_init stop_and_clean
		if [ $$? -ne 0 ]; then
			echo "Warning: mmxep_init stop_and_clean returned error !"
		fi
	fi

	# Delete customerTheme for luci, set standard theme
	uci delete luci.themes.customerTheme
	themeValue=`uci show luci.themes | grep -v internal | tail -n 1 | cut -d "=" -f 2`
	echo "Default theme set to $${themeValue}"
	uci set luci.main.mediaurlbase=$${themeValue}
	uci commit

	# Restore conffiles backuped on customer pkg installation
	echo Restoring original conffiles
	for f in `ls /etc/config/*.orig 2>/dev/null`; do
		echo "Command: cp $$f $${f%.orig} "
		cp $$f $${f%.orig}

		echo "Command: rm $$f"
		rm $$f
	done

	echo "Remove all this package config files"
	for f in `ls /etc/config/*$(PKG_NAME) 2>/dev/null`; do
		echo "Command: rm $$f"
		rm $$f
	done

	# Remove the service file containing name of the customer package
	rm /etc/customer_pkg_name

    # Delete conffiles that were saved during this package working
	if [ -z "$$INGTMP_OVRL" ] ; then
			rm /etc/mmx/saved-config/*  2>/dev/null
	fi
	echo "Configuration files restored. Reboot is recommended"
fi

exit 0
endef

define Build/Compile
	@echo "Nothing to compile"
endef

$(eval $(call BuildPackage,inango-prplmesh-en))
