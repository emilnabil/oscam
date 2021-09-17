#!/bin/sh
# ###########################################
# SCRIPT : DOWNLOAD AND INSTALL OSCAM ###
# ###########################################
#
# Command: wget https://raw.githubusercontent.com/emilnabil/oscam/main/installer.sh -O - | /bin/sh
#
# ###########################################
###########################################
# My Config #
TMPDIR='/tmp'
VERSION='11.696'
PACKAGE='oscam'
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
        sleep 2
    fi

echo "Insallling Oscam plugin Please Wait "
   wait 2;
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







