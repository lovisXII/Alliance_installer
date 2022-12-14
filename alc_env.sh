# -*- Mode: Shell-script    -*- 
# -*- vim: set filetype=sh: -*-
#             ,,,
#            (o o)
####=====oOO--(_)--OOO=========================================####
#
#  Alliance CAD system environnement
#  Usage (in Bourne-shell) : > . alc_env.sh
#  (C) 1997 Czo  -- <Olivier.Sirol@lip6.fr>
#  $Id: alc_env.sh.in,v 1.15 2012/04/11 13:31:14 alliance Exp $
#  Generated from alc_env.sh.in on @DATE@

# $ALLIANCE_OS and $ALLIANCE_TOP are the only variables you will
# have to modify if something goes wrong

# Which platform for Alliance CAD

# WARNING : if changing this remember to do it on the 3 config files :
# configure.in alc_env.sh.in and alc_env.csh.in


# Where the Alliance CAD is installed
        ALLIANCE_TOP=/home/lovis/alliance/install; export ALLIANCE_TOP
         SYSCONF_TOP=$ALLIANCE_TOP/etc
           CELLS_TOP=$ALLIANCE_TOP/cells
 if [ "$ALLIANCE_TOP" = "/usr/lib/alliance" ]; then
  # FHS Installation.
         SYSCONF_TOP="/etc/alliance"
           CELLS_TOP="/usr/share/alliance/cells"
 fi

# Alliance environment variables.
           MBK_IN_LO=vst;                            export MBK_IN_LO
          MBK_OUT_LO=vst;                            export MBK_OUT_LO 
           MBK_IN_PH=ap;                             export MBK_IN_PH
          MBK_OUT_PH=ap;                             export MBK_OUT_PH

        MBK_WORK_LIB=.;                              export MBK_WORK_LIB
      MBK_CATAL_NAME=CATAL;                          export MBK_CATAL_NAME

         MBK_SCALE_X=100;                            export MBK_SCALE_X

           VH_MAXERR=10;                             export VH_MAXERR
           VH_BEHSFX=vbe;                            export VH_BEHSFX
           VH_PATSFX=pat;                            export VH_PATSFX
           VH_DLYSFX=dly;                            export VH_DLYSFX

             MBK_VDD=vdd;                            export MBK_VDD
             MBK_VSS=vss;                            export MBK_VSS

        MBK_CATA_LIB=.:$CELLS_TOP/sxlib
        MBK_CATA_LIB=$MBK_CATA_LIB:$CELLS_TOP/dp_sxlib
        MBK_CATA_LIB=$MBK_CATA_LIB:$CELLS_TOP/rflib
        MBK_CATA_LIB=$MBK_CATA_LIB:$CELLS_TOP/rf2lib
        MBK_CATA_LIB=$MBK_CATA_LIB:$CELLS_TOP/ramlib
        MBK_CATA_LIB=$MBK_CATA_LIB:$CELLS_TOP/romlib
        MBK_CATA_LIB=$MBK_CATA_LIB:$CELLS_TOP/pxlib
       #MBK_CATA_LIB=$MBK_CATA_LIB:$CELLS_TOP/padlib
                                                     export MBK_CATA_LIB

      MBK_TARGET_LIB=$CELLS_TOP/sxlib;               export MBK_TARGET_LIB
          MBK_C4_LIB=./cellsC4;                      export MBK_C4_LIB

     XPAT_PARAM_NAME=$SYSCONF_TOP/xpat.par;          export XPAT_PARAM_NAME
     XFSM_PARAM_NAME=$SYSCONF_TOP/xfsm.par;          export XFSM_PARAM_NAME
     XSCH_PARAM_NAME=$SYSCONF_TOP/xsch.par;          export XSCH_PARAM_NAME

              RDS_IN=cif;                            export RDS_IN
             RDS_OUT=cif;                            export RDS_OUT

   DREAL_TECHNO_NAME=$SYSCONF_TOP/cmos.dreal;        export DREAL_TECHNO_NAME
   GRAAL_TECHNO_NAME=$SYSCONF_TOP/cmos.graal;        export GRAAL_TECHNO_NAME
 GENVIEW_TECHNO_NAME=$SYSCONF_TOP/cmos.genview;      export GENVIEW_TECHNO_NAME
						     
     RDS_TECHNO_NAME=$SYSCONF_TOP/cmos.rds;          export RDS_TECHNO_NAME
     ELP_TECHNO_NAME=$SYSCONF_TOP/prol.elp;          export ELP_TECHNO_NAME


# System PATH variables, only needed when not installed in the FHS.
 if [ "$ALLIANCE_TOP" != "/usr/lib/alliance" ]; then
   PATH=$PATH:$ALLIANCE_TOP/bin
   export PATH
  
  # Only needed on Solaris (included in /etc/ld.so.conf under Linux).
  #if [ "`uname -o`" != "GNU/Linux" ]; then
     if [ -z "${LD_LIBRARY_PATH}" ]; then
       LD_LIBRARY_PATH=$ALLIANCE_TOP/lib
     else
       LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ALLIANCE_TOP/lib
     fi
     export LD_LIBRARY_PATH
  #fi
  
   if [ -z "${MANPATH}" ]; then
     MANPATH=:$ALLIANCE_TOP/share/man:$(manpath)
   else
     MANPATH=$MANPATH:$ALLIANCE_TOP/share/man
   fi
   export MANPATH
 fi
 
# fixing *** ERROR *** : Variable MBK_SPI_MODEL not found.
 MBK_SPI_MODEL=$SYSCONF_TOP/spimodel.cfg;      export MBK_SPI_MODEL
