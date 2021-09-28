#!/bin/sh

##setup command=wget https://raw.githubusercontent.com/emilnabil/oscam/main/installer.sh -O - | /bin/sh
#
echo " download and install oscam emu "

version=11.696
OPKGINSTALL=opkg install --force-overwrite
MY_URL="https://raw.githubusercontent.com/emilnabil/oscam/main"
MY_IPK="oscam_11.696_all.ipk"
MY_DEB="oscam_11.696_all.deb"
##############################################################################
# remove old emu #
opkg remove enigma2-plugin-softcams-oscam-all-images

#################################################################################

# Download and install plugin #

cd /tmp 

set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		apt-get install --reinstall oscam_11.696_all.deb -y
	else
		opkg install --force-reinstall oscam_11.696_all.ipk
	fi
echo "================================="
set +e
chmod 755 /usr/bin/oscam-emu
chmod 755 /usr/bin/OSCam_11.696-r798
cd ..
wait
rm -f /tmp/$MY_IPK
rm -f /tmp/$MY_DEB
	if [ $? -eq 0 ]; then
	echo ">>>>   SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
		echo ". >>>>         RESTARING     <<<<"
		if which systemctl > /dev/null 2>&1; then
			sleep 2; systemctl restart enigma2
		else
			init 4; sleep 4; init 3;
		fi
	else
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi;
	echo ''
	echo '**************************************************'
	echo '**                   FINISHED                   **'
echo "********************************************************************************"
echo "#########################################################"
   wait 2;
    sleep 2;
  exit    




























