#!/usr/bin/env bash

#import
. ../../my-variables.sh

NOWORK_VIMRC="~/.vimrc"
WORK_VIMRC=~/.vimrc

#SETTINGSFOLDER="${HOME}/Ubuntu One"
MYVIM="${SETTINGSFOLDER}/vim/dot-vim"
VIMRC="${SETTINGSFOLDER}/vim/dot-vim/vimrc"
GVIMRC="${SETTINGSFOLDER}/vim/dot-vim/gvimrc"
VIMPROJECTS="${SETTINGSFOLDER}/vim/dot-vim/vimprojects"

DOTVIM="${HOME}/.vim"
DOTVIMRC="${HOME}/.vimrc"
DOTGVIMRC="${HOME}/.gvimrc"
DOTVIMPROJECTS="${HOME}/.vimprojects"


clear
echo "* Removing VIM settings"
echo "** .vim"
if [ -r "${DOTVIM}" ]; then
		echo "--> $DOTVIM exists, i am removing it"
		rm -v -rf  "${DOTVIM}"
	else
		echo "--> $DOTVIM doesn't exist, nothing happens"
fi

echo "** .vimrc"
if [ -r "${DOTVIMRC}" ]; then
		echo "--> $DOTVIMRC exists, i am removing it"
		rm -v "${DOTVIMRC}"
	else
		echo "--> $DOTVIMRC doesn't exist, nothing happens"
fi

echo "** .gvimrc"
if [ -r "${DOTGVIMRC}" ]; then
		echo "--> $DOTGVIMRC exists, i am removing it"
		rm -v "${DOTGVIMRC}"
	else
		echo "--> $DOTGVIMRC doesn't exist, nothing happens"
fi

echo "** .vimprojects"
if [ -r "${DOTVIMPROJECTS}" ]; then
		echo "--> $DOTVIMPROJECTS exists, i am removing it"
		rm -v "${DOTVIMPROJECTS}"
	else
		echo "--> $DOTVIMPROJECTS doesn't exist, nothing happens"
fi
