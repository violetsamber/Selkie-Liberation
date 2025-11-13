shopt -s expand_aliases
source ~/.bash_aliases

build/tests.sh

hemtt build
cp .hemttout/build/addons/slklib_mehland.mehland.pbo ~/.steam/root/steamapps/common/Arma\ 3/MPMissions/slklib_mehland.mehland.pbo
echo Copied to Arma3 folder
cp .hemttout/build/addons/slklib_mehland.mehland.pbo /mnt/violets/arma/slklib_mehland.mehland.pbo
echo Copied to server folder