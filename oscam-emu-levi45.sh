#!/bin/sh

##setup command=wget https://raw.githubusercontent.com/emilnabil/oscam/main/oscam-emu-levi45.sh -O - | /bin/sh

echo "Downloading and installing oscam emu"

MY_URL="https://raw.githubusercontent.com/emilnabil/oscam/main"
MY_IPK="enigma2-plugin-softcams-oscam-emu-levi45_all.ipk"
MY_DEB="enigma2-plugin-softcams-oscam-emu-levi45_all.deb"

##############################################################################
# Remove old emu #
echo "Removing old versions..."
opkg remove enigma2-plugin-softcams-oscam-all-images

#################################################################################

# Download and install plugin #
echo "Installing..."
cd /tmp

if which dpkg > /dev/null 2>&1; then
    echo "System uses dpkg"
    wget "$MY_URL/$MY_DEB"
    if [ -f "$MY_DEB" ]; then
        dpkg -i --force-overwrite "$MY_DEB"
        apt-get install -f -y
        chmod 755 /usr/bin/oscam-emu
        rm -f "$MY_DEB"
    else
        echo "Failed to download: $MY_DEB"
        exit 1
    fi
else
    echo "System uses opkg"
    wget "$MY_URL/$MY_IPK"
    if [ -f "$MY_IPK" ]; then
        opkg install --force-overwrite "$MY_IPK"
        chmod 755 /usr/bin/oscam-emu
        rm -f "$MY_IPK"
    else
        echo "Failed to download: $MY_IPK"
        exit 1
    fi
fi

echo "================================="
echo ">>>>   SUCCESSFULLY INSTALLED   <<<<"
echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 2

echo "Restarting..."
echo "**********************************************************************************"
sleep 2

killall -9 enigma2
exit 0

