#!/bin/bash
# ###########################################
# SCRIPT :              DOWNLOAD AND INSTALL OSCAM + NCAM ###
# ###########################################
#
# Command: wget https://raw.githubusercontent.com/emilnabil/oscam/main/installer.sh -O - | /bin/sh
#
# ###########################################
###########################################
# My Config #
TMPDIR='/tmp'
OSVERSION='11.696'
OSPACKAGE='oscam'
NCVERSION='11.90'
NCPACKAGE='ncam'
OPKGINSTAL='opkg install --force-overwrite'
MY_URL='https://raw.githubusercontent.com/emilnabil/oscam/main'

####################
echo "==============================================================================================================="
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
############################
###   remove old plugins ###
opkg remove enigma2-softcams-cccam-all-images
wait
opkg remove enigma2-plugin-softcams-ncam
wait
opkg remove --force-depends enigma2-softcams-oscam-all-images
wait
clear
#############################
echo "Insallling Emu Oscam - ncam  Please Wait "
   wait 2
cd /tmp
set -e
 echo "=============================================="
wait 
   wget
"https://raw.githubusercontent.com/emilnabil/oscam/main/ncam_11.90_all.ipk"
 wait 
  wget
"https://raw.githubusercontent.com/emilnabil/oscam/main/oscam-revcamV2_11.696_all.ipk"
 wait 
 wget
"https://raw.githubusercontent.com/emilnabil/oscam/main/oscam-supcam_11.696_all.ipk"
  wait 
 wget
"https://raw.githubusercontent.com/emilnabil/oscam/main/oscam_11.696_all.ipk"
wait 2
cd ..
  opkg install --force-overwrite /tmp/*.ipk
wait 1
  
echo "======================================================================"
    ###########################
rm -rf /tmp/*.ipk
wait 
echo "======================================================================================================="
 echo "    UPLOADED BY  >>>>   EMIL_NABIL "   
   echo "
  ======      =   =        =   =
  =          =  =  =       =   =
  ======    =   =   =      =   =
  =        =         =     =   = 
  ======  =           =    =   ===== "
   wait 2;
    sleep 2;
  exit    





















