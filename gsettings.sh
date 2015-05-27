#!/bin/bash -eux

gsettings set com.canonical.Unity.Launcher favorites "['application://org.gnome.Nautius.desktop','application://firefox.desktop','application://unity-control-center.desktop','application://emacs.desktop','appliaction://pidgin.desktop','unity://running-apps','unity://expo-icon','unity://devices']"
gconftool-2 --set "/app/guake/style/background/transparency" --type=int 15
gconftool-2 --set "/app/guake/general/window_tabbar" --type=bool true
gconftool-2 --set "/app/guake/general/window_height" --type=int 75
