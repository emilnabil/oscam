#!/bin/sh
# ###########################################
echo "SCRIPT : DOWNLOAD AND INSTALL ALL EMU ( CCCAM - OSCAM - OSSUPCAM - OS REVCAM )"
# ###########################################
#
# Command: wget https://raw.githubusercontent.com/emilnabil/oscam/main/installer.sh -O - | /bin/sh
#
# ###########################################

###########################################
# Configuration  My Script #
TMPDIR='/tmp'
VERSIONCCCAM='2.3.9'
VERSIONNCAM='11.90'
VERSIONOSCAM='11.696'
VERSIONOSSUPCAM='11.696'
VERSIONOSREVCAM='11.696'
PACKAGECCCAM='cccam-all-images'
PACKAGENCAM='ncam'
PACKAGEOSCAM='oscam'
PACKAGEOSSUPCAM='oscam-supcam'
PACKAGEOSREVCAM='oscam-revcamV2'
MY_URL='https://raw.githubusercontent.com/emilnabil/oscam/main/'

####################
#  Image Checking  #
if which opkg > /dev/null 2>&1; then
    STATUS='/var/lib/opkg/status'
    OSTYPE='Opensource'
    OPKG='opkg update'
    OPKGINSTAL='opkg install'
    OPKGREMOV='opkg remove --force-depends'
else
    STATUS='/var/lib/dpkg/status'
    OSTYPE='DreamOS'
    PKGBAPP='gstreamer1.0-plugins-base-apps'
    OPKG='apt-get update'
    OPKGINSTAL='apt-get install'
    OPKGREMOV='apt-get purge --auto-remove'
    DPKINSTALL='dpkg -i --force-overwrite'
fi

##################################
######################
#  Remove Old Emu #
$OPKGREMOV enigma2-softcams-cccam-all-images
wait
$OPKGREMOV enigma2-plugin-softcams-ncam-mips
wait
$OPKGREMOV enigma2-softcams-oscam-all-images
wait
 echo "             Removed Old Emu "

#####################
# Package Checking  #
  if grep -qs "Package: $PACKAGE" $STATUS ; then
    echo
else
    echo "     installing Emu   "
    echo
    if [ $OSTYPE = "Opensource" ]; then
        echo "Opkg Update ..."
        $OPKG > /dev/null 2>&1
        echo
    echo " Downloading Emu .."
        echo
        $OPKGINSTAL $PACKAGEOSCAM
    elif [ $OSTYPE = "DreamOS" ]; then
        echo "APT Update ..."
        $OPKG > /dev/null 2>&1
        echo " Downloading $PACKAGE ......"
        echo
        $OPKGINSTAL $PACKAGEOSCAM -y
    else
        echo ""
        echo ""
        echo "   >>>>   Feed Missing $PACKAGEOSCAM   <<<<"
        echo "   >>>>   Emu will not work without $PACKAGEOSCAM   <<<<"
        sleep 3
    fi
###################
#             Installing #
if [ $OSTYPE = "Opensource" ]; then
    echo "Insalling EMU Please Wait ......"
    wget $MY_URL/${PACKAGECCCAM}_${VERSIONCCCAM}_all.ipk -qP $TMPDIR
      wait
    wget $MY_URL/${PACKAGENCAM}_${VERSIONNCAM}_all.ipk -qP $TMPDIR
    wait
    wget $MY_URL/${PACKAGEOSCAM}_${VERSIONOSCAM}_all.ipk -qP $TMPDIR
    wait
    wget $MY_URL/${PACKAGEOSSUPCAM}_${VERSIONOSSUPCAM}_all.ipk -qP $TMPDIR
    wait
    wget $MY_URL/${PACKAGEOSREVCAM}_${VERSIONOSREVCAM}_all.ipk -qP $TMPDIR
    wait
    $OPKGINSTAL $TMPDIR/*.ipk
else
    echo "Insallling EMU Please Wait ......"
    wget $MY_URL/${PACKAGECCCAM}_${VERSIONCCCAM}_all.deb -qP $TMPDIR
    wait
    wget $MY_URL/${PACKAGENCAM}_${VERSIONNCAM}_all.deb -qP $TMPDIR
    wait
   wget $MY_URL/${PACKAGEOSCAM}_${VERSIONOSCAM}_all.deb -qP $TMPDIR
    wait 
    $DPKINSTALL $TMPDIR/*.deb; $OPKGINSTAL -f -y
fi

##################################
# Remove previous files  #
 rm -f $TMPDIR/*.ipk
 rm -f $TMPDIR/*.deb
sleep 1; 
clear
echo ""
echo "***********************************************************************"
echo "**                                                                    *"
echo "**                  CONGRATULATIONS                            *"
echo "**                                                                    *"
echo " UPLOADED BY  >>>> EMIL_NABIL   "   
   echo "
  888888======8===8========8===8
  8==========8=8=8=8=======8===8
  888888====8===8===8======8===8   
  8========8=========8=====8===8 
  888888==8===========8====8===888888 "
   wait 
    sleep 2
  exit    
