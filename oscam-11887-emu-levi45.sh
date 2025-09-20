#!/bin/sh

## setup command=wget https://raw.githubusercontent.com/emilnabil/oscam/main/oscam-11887-emu-levi45.sh -O - | /bin/sh

echo "Download and install oscam emu"
version=11887
OPKGINSTALL="opkg install --force-overwrite"
MY_URL="https://raw.githubusercontent.com/emilnabil/oscam/main"
MY_IPK="oscam-11887-emu-803.ipk"
MY_DEB="oscam-11887-emu-803.deb"

##############################################################################
# remove old emu #
opkg remove enigma2-plugin-softcams-oscam-all-images

#################################################################################
# Download and install plugin #
opkg install wget
cd /tmp || exit 1

set -e
if which dpkg >/dev/null 2>&1; then
    wget "$MY_URL/$MY_DEB"
    dpkg -i --force-overwrite "$MY_DEB" || apt-get install -f -y
    chmod 755 /usr/bin/oscam-emu
    rm -f "/tmp/$MY_DEB"
else
    wget "$MY_URL/$MY_IPK"
    opkg install --force-reinstall "$MY_IPK"
    chmod 755 /usr/bin/oscam-emu
    rm -f "/tmp/$MY_IPK"
fi
set +e

echo "================================="
if [ $? -eq 0 ]; then
    echo ">>>>   SUCCESSFULLY INSTALLED <<<<"
fi
echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "
sleep 4
echo "========================================================================================================================="
echo ". >>>>         RESTARTING ENIGMA2     <<<<"
echo "**********************************************************************************"

# Restart Enigma2 (compatible with most images including Dreambox)
if command -v systemctl >/dev/null 2>&1; then
    systemctl restart enigma2
elif command -v init >/dev/null 2>&1; then
    init 4; sleep 2; init 3
else
    killall -9 enigma2
fi

exit 0


