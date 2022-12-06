# Introduction

This git offers you a bash script to install the Alliance tool from the lip6 (https://www-soc.lip6.fr/equipe-cian/logiciels/alliance/)


# How to install

Just run this :
```sh
chmod +x allianceInstaller.sh minimum_requirement.sh
./minimum_requirement.sh #run as sudo
./allianceInstaller.sh #do not run as sudo
```

If you use alliance for MOCCA class of Master SESI, you may also need alc_env.sh. To use it :
Edit the path here, by changing ``your_path_to_alliance`` :
```
ALLIANCE_TOP=your_path_to_alliance/alliance/install
```
You should find ``bin/``, ``cells/``, ``etc/`` ...etc. inside ``alliance/install``.
