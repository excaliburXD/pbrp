#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2025-2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2025-2026 The OrangeFox Recovery Project
#
#	Please maintain this if you use this script or any part of it
#

FDEVICE="X695C"
if [ -z "${FDEVICE}" ]; then
	echo "[ERROR] FDEVICE is not set, please set it to the device codename in vendorsetup.sh!!"
	exit 1
else
	export FOX_BUILD_DEVICE="${FDEVICE}"
	echo "[INFO] Setting FOX_BUILD_DEVICE to FOX_BUILD_DEVICE=${FDEVICE}"
fi

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w \"$FDEVICE\")
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   echo "** WARNING **: Always set FOX_BUILD_DEVICE to the device codename before starting to build for any device!"
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	# Architecture Config & A/B Partitioning
	export FOX_VIRTUAL_AB_DEVICE=1
	export FOX_AB_DEVICE=1
	export OF_NO_RECOVERY_PARTITION=1

	# Security & AVB
	export OF_PATCH_AVB20=1
	export OF_DEFAULT_KEYMASTER_VERSION=4.0

	# Magiskboot
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

	# Optimize Build (32mb)
	export FOX_DELETE_AROMA=1
	export FOX_REMOVE_AAPT=1
	export OF_LOOP_DEVICE_ERRORS_TO_LOG=1
    export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

	# UI & Display
	export OF_SCREEN_H=2460
    export OF_STATUS_H=100
    export OF_STATUS_INDENT_LEFT=52
    export OF_STATUS_INDENT_RIGHT=52
    export OF_CLOCK_POS=1

	# Info Maintainer
	export FOX_BUILD_TYPE="Android-11"
    export FOX_VERSION="R11.1"
    export FOX_VARIANT="XOS"
    export OF_MAINTAINER="excaliburXD"
fi
