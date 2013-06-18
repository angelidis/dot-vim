#!/usr/bin/env bash


clear
echo "Setup gVIM [for unix]"
echo ""

#import
. ../../my-variables.sh
echo ""

NOWORK_VIMRC="~/.vimrc"
WORK_VIMRC=~/.vimrc

# tin metavliti SETTINGSFOLDER tin pairnei apo to my-variables.sh
#SETTINGSFOLDER="${HOME}/Ubuntu"
MYVIM="${SETTINGSFOLDER}/vim/dot-vim"
VIMRC="${SETTINGSFOLDER}/vim/dot-vim/vimrc"
GVIMRC="${SETTINGSFOLDER}/vim/dot-vim/gvimrc"
VIMPROJECTS="${SETTINGSFOLDER}/vim/dot-vim/vimprojects"

DOTVIM="${HOME}/.vim"
DOTVIMRC="${HOME}/.vimrc"
DOTGVIMRC="${HOME}/.gvimrc"
DOTVIMPROJECTS="${HOME}/.vimprojects"



echo $SETTINGSFOLDER
echo ""
echo $MYVIM
echo $DOTVIM
echo ""
echo $VIMRC
echo $DOTVIMRC
echo ""
echo $GVIMRC
echo $DOTGVIMRC
echo ""
echo $VIMPROJECTS
echo $DOTVIMPROJECTS



echo ""
echo ""
echo ""
echo "* Installing VIM settings"
echo "** .vim"
if [ -r "${DOTVIM}" ]; then
		echo "--> $DOTVIM exists, nothing happens"
	else
		echo "--> folder doesn't exist, linking"
		ln -v --symbolic "${MYVIM}" "${DOTVIM}"
fi

echo "** .vimrc"
if [ -r "${DOTVIMRC}" ]; then
		echo "--> $DOTVIMRC exists, nothing happens"
	else
		echo "--> file doesn't exist, linking"
		ln -v --symbolic "${VIMRC}" "${DOTVIMRC}"
fi

echo "** .gvimrc"
if [ -r "${DOTGVIMRC}" ]; then
		echo "--> $DOTGVIMRC exists, nothing happens"
	else
		echo "--> file doesn't exist, linking"
		ln -v --symbolic "${GVIMRC}" "${DOTGVIMRC}"
fi

echo "** .vimprojects"
if [ -r "${DOTVIMPROJECTS}" ]; then
		echo "--> $DOTVIMPROJECTS exists, nothing happens"
	else
		echo "--> file doesn't exist, linking"
		ln -v --symbolic "${VIMPROJECTS}" "${DOTVIMPROJECTS}"
fi

