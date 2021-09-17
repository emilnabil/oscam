#!/bin/sh
# ###########################################
# SCRIPT : DOWNLOAD AND INSTALL OSCAM ###
# ###########################################
#
# Command: wget https://raw.githubusercontent.com/MOHAMED19OS/Download/main/Oscam_Ncam/installer.sh -q; sh installer.sh
#
# ###########################################
###########################################
# My Config #
TMPDIR='/tmp'
VERSION='11.696'
PACKAGE='oscam'
MY_URL='https://raw.githubusercontent.com/MOHAMED19OS/Download/main/Oscam_Ncam/'

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
    OPKG='apt-get update'
    OPKGINSTAL='apt-get install'
    OPKGREMOV='apt-get purge --auto-remove'
    DPKINSTALL='dpkg -i --force-overwrite'
fi

##################################

}
################
# Package Checking  #
if grep -qs "Package: $PACKAGE" $STATUS ; then
    echo
else
    echo "             install $PACKAGE   "
    echo
    if [ $OSTYPE = "Opensource" ]; then
        echo "Opkg Update ..."
        $OPKG > /dev/null 2>&1
        echo
        echo " Downloading $PACKAGE ......"
        echo
        $OPKGINSTAL $PACKAGE
    elif [ $OSTYPE = "DreamOS" ]; then
        echo "APT Update ..."
        $OPKG > /dev/null 2>&1
        echo " Downloading $PACKAGE ......"
        echo
        $OPKGINSTAL $PACKAGE -y
    else
        echo ""
        echo ""
        echo "   >>>>   Feed Missing $PACKAGE   <<<<"
        echo "   >>>>   Notification Emu will not work without $PACKAGE   <<<<"
        sleep 3
        exit 0
    fi

echo "Insallling Oscam plugin Please Wait ......"
            wget $MY_URL/${PACKAGE}_${VERSION}_all.ipk -qP $TMPDIR
            $OPKGINSTAL $TMPDIR/${PACKAGE}_${VERSION}_all.ipk
        else
            echo "Insallling Oscam plugin Please Wait ......"
            wget $MY_URL/${PACKAGE}_${VERSION}_all.deb -qP $TMPDIR
            $DPKINSTALL $TMPDIR/${PACKAGE}_${VERSION}_all.deb; $OPKGINSTAL -f -y
        fi
    ###########################
rm -rf $TMPDIR/${PACKAGE}_{VERSION}_all.deb
echo **********************************************************"
rm -rf $TMPDIR/${PACKAGE}_{VERSION}_all.ipk MY_EM="======================================================================================================="
 echo "******************"
 echo $MY_EM
 echo "    UPLOADED BY  >>>>   EMIL_NABIL "   
 echo "
  *****      *   *        *   *
  *         * * * *       *   *
  *****    *   *    *     *   *
  *.      *           *   *   *
  *****  *             *  *   ****** "
   wait 2;
    sleep 2;
  exit    


