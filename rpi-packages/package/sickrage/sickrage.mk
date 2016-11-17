################################################################################
#
# sickrage
#
################################################################################

SICKRAGE_VERSION =  master
SICKRAGE_SITE = https://github.com/SickRage/SickRage.git
SICKRAGE_SITE_METHOD = git
SICKRAGE_LICENSE = GPLv2+
SICKRAGE_LICENSE_FILES = COPYING

define SICKRAGE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/local/sickrage
	cp -aR $(@D) $(TARGET_DIR)/usr/local/sickrage
endef

$(eval $(generic-package))
