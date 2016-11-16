################################################################################
#
# deluge
#
################################################################################

SICKRAGE_VERSION =  master
SICKRAGE_SITE = https://github.com/SickRage/SickRage.git
SICKRAGE_SITE_METHOD = git
SICKRAGE_LICENSE = GPLv2+
SICKRAGE_LICENSE_FILES = COPYING

define SICKRAGE_BUILD_CMDS
	cd $(@D) && python setup.py build
endef

$(eval $(generic-package))
