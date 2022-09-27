#!/bin/bash

echo "This script will recompile alliance binary for your system"
echo "Cloning alliance repository in ${HOME}/alliance"

mkdir $HOME/alliance
export INSTALL_ALLIANCE_PATH=$HOME/alliance
cd $INSTALL_ALLIANCE_PATH
git clone https://gitlab.lip6.fr/vlsi-eda/alliance.git
  
echo "Alliance compiling"

srcDir=${INSTALL_ALLIANCE_PATH}/alliance/alliance/src
commonRoot=${INSTALL_ALLIANCE_PATH}
buildDir=${commonRoot}/build
installDir=${commonRoot}/install

export    ALLIANCE_TOP=${installDir}
export    LD_LIBRARY_PATH=${installDir}/lib:${LD_LIBRARY_PATH}

cd ${srcDir}
# Skip doc generation to avoid pulling TeXLive in docker images.
sed -i 's,dirs="\$newdirs documentation",dirs="$newdirs",' ./autostuff
./autostuff clean
./autostuff
mkdir -p ${buildDir}
cd ${buildDir}
${srcDir}/configure --prefix=${ALLIANCE_TOP} --enable-alc-shared
make -j1 install

echo "export PATH=$PATH:$INSTALL_ALLIANCE_PATH/install/bin" >> ~/.bashrc
source ~/.bashrc
