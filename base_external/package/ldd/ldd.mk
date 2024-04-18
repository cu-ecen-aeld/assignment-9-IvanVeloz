
##############################################################
#
# ldd (customized by student)
#
##############################################################

LDD_VERSION = c6f3377878a9ff1dfe62b5237028ee253dc90a94
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-IvanVeloz.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_CONFIGURE_OPTS += KERNELDIR=$(LINUX_DIR)
LDD_CONFIGURE_OPTS += ARCH=$(KERNEL_ARCH)
LDD_CONFIGURE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)

define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LDD_CONFIGURE_OPTS) -C $(@D)/misc-modules
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LDD_CONFIGURE_OPTS) -C $(@D)/scull
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
#define LDD_INSTALL_TARGET_CMDS
#	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
#	$(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
#	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/usr/bin
#	$(INSTALL) -m 0755 $(@D)/finder-app/{finder*.sh,writer} $(TARGET_DIR)/usr/bin
#	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
#	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
#endef

$(eval $(kernel-module))
$(eval $(generic-package))
