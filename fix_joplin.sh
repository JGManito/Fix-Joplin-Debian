#!/bin/bash

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
