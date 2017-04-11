include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DisabledTextPrefs
DisabledTextPrefs_FILES = DisabledTextPrefsRootListController.m
DisabledTextPrefs_INSTALL_PATH = /Library/PreferenceBundles
DisabledTextPrefs_FRAMEWORKS = UIKit
DisabledTextPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DisabledTextPrefs.plist$(ECHO_END)
