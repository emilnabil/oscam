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
OSVERSION='11.696'
OSPACKAGE='oscam'
NCVERSION='11690'
NCPACKAGE='ncam'
MY_URL='https://raw.githubusercontent.com/emilnabil/oscam/main/'

####################
echo "==============================================================================================================="
echo "Insallling Emu Oscam - ncam  Please Wait "
   wait 2;
            wget $MY_URL/${OSPACKAGE}_${OSVERSION}_all.ipk -qP $TMPDIR
            $OPKGINSTAL $TMPDIR/${OSPACKAGE}_${OSVERSION}_all.ipk
        
            echo "Insallling Oscam plugin Please Wait ......"
            wget $MY_URL/${NCPACKAGE}_${NCVERSION}_all.deb -qP $TMPDIR
          $OPKGINSTAL $TMPDIR/${NCPACKAGE}_${NCVERSION}_all.ipk
        
    ###########################
rm -rf $TMPDIR/${OSPACKAGE}_{VERSION}_all.ipk
echo **********************************************************"
rm -rf $TMPDIR/${NCPACKAGE}_{NCVERSION}_all.ipk MY_EM="======================================================================================================="
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














