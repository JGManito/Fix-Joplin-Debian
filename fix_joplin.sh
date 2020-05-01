#!/bin/bash

#Original procedure from vsimkus, found here https://github.com/laurent22/joplin/issues/2246#issuecomment-577315584
#I only put it in a script to help either begginers or to allow for automation

#Joplin is usually saved in "/home/$username/.joplin". If you for whatever reason have a different location, edit it here
joplinPath=~/.joplin

#Move to joplin directory
pushd $joplinPath

#Extract AppImage
./Joplin.AppImage --appimage-extract

#Change owner of chrome-sandbox
sudo chown root squashfs-root/chrome-sandbox

#Change permission of chrome sandbox 
sudo chmod 4755 squashfs-root/chrome-sandbox

#Fix the desktop icon
sed -i 's/.joplin\/.*/.joplin\/squashfs-root\/joplin/g' ~/.local/share/applications/appimagekit-joplin.desktop

#Return to original working directory
popd
