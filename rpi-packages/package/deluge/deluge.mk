################################################################################
#
# deluge
#
################################################################################

DELUGE_VERSION = 1.3.13
DELUGE_SITE = http://download.deluge-torrent.org/source
DELUGE_SOURCE = deluge-$(DELUGE_VERSION).tar.xz
DELUGE_LICENSE = GPLv2+
DELUGE_LICENSE_FILES = COPYING

define DELUGE_BUILD_CMDS
	cd $(@D) && python setup.py build
endef
$(eval $(generic-package))
