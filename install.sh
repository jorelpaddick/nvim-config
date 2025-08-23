#!/bin/bash
CONFIG=~/.config/nvim
CONTENT=~/.local/share/nvim

if [ -d $CONTENT ] ; then
    echo "[!] A vim configuration already exists!"
    read -p "[?] Would you like to stop? Y/n " save
    if [ "$save" != "n" ] && [ "$save" != "N" ] ; then
	echo exiting...
	exit
    fi
    rm -rf $CONFIG $CONTENT
fi

echo "[+] Creating directories"
mkdir -p $CONFIG $CONTENT
echo "[+] Copying init.vim"
cp init.vim $CONFIG/init.vim
echo "[+] Copying colours"
cp -r colors $CONFIG/
cp -r syntax $CONFIG/
echo "[+] Copying bundles..."
cp -r nvim/* $CONTENT/

echo "[-] Installing plugins..."
nvim -c "PlugInstall"

echo "Done!"
