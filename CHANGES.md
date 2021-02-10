MMX ver.2.0.1.1
===============

* New MMX WebUI layout using prpl colors and logos
* Custom WebUI login page replacing LuCI one
* Two writable objects in data model:
** Device.Controller.Network.AccessPoint.{i}.
** Device.Controller.Network.AccessPoint.{i}.Security.
* Using "matrix" view for objects above
* Auto opening MMX page after login (but needed patch to "luci-base")
* Proprietary license replaced with BSD-2
* Removed unuseful db_reformat scripts

MMX ver.2.0.0.1
===============

* Next MMX components has been published to OpenSource
** net/libing-gen-utils
** net/libmmx-backapi
** net/prplmesh-be
** net/libmmx-frontapi
** net/mmx-ep
** net/libmicroxml
** lua/luaxml
** customers/inango-prplmesh-en
** mng/mmx-web
** mng/mmx-cli
** utils/mmx-web-lib-chartist
