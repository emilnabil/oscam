#!/bin/bash
#

echo "             Enigma Update " 
  opkg update
  opkg install wget
wait 
   wget -O /var/volatile/tmp/cccam_01_all.ipk "https://raw.githubusercontent.com/emilnabil/emil_script_package/main/cccam_01_all.ipk"
wait
wget -O /var/volatile/tmp/ncam_01_all.ipk "https://raw.githubusercontent.com/emilnabil/emil_script_package/main/ncam_01_all.ipk"
 wait 
 wget -O /var/volatile/tmp/ncam-revcam_all.ipk "https://raw.githubusercontent.com/emilnabil/emil_script_package/main/ncam-revcam_all.ipk"
wait 
wget -O /var/volatile/tmp/oscam_01_all.ipk "https://raw.githubusercontent.com/emilnabil/emil_script_package/main/oscam_01_all.ipk"
wait
wget -O /var/volatile/tmp/oscam-supcam_01_all.ipk "https://raw.githubusercontent.com/emilnabil/emil_script_package/main/oscam-supcam_01_all.ipk"
wait
wget -O /var/volatile/tmp/oscam-revcam_01_all.ipk "https://raw.githubusercontent.com/emilnabil/emil_script_package/main/oscam-revcam_01_all.ipk"
wait
echo "           INSTALING EMU "
  opkg install --force-overwrite /tmp/*.ipk
wait 1
 
echo "======================================================================"
    ###########################
rm -rf /tmp/*.ipk
wait
echo "======================================================================================================="
 echo "    UPLOADED BY  >>>>   EMIL_NABIL "   
   echo "
  888888======8===8========8===8
  8==========8==8==8=======8===8
  888888====8===8===8===== 8===8   
  8========8=========8=====8===8 
  888888==8===========8====8===888888 "
   wait 2;
    sleep 2;
  exit    






















