#!/usr/bin/env bash

# https://github.com/graysky2/xscreensaver-aerial/

# mpv
# http://ubuntuhandbook.org/index.php/2016/07/install-mpv-media-player-ubuntu-16-04/
sudo add-apt-repository ppa:mc3man/mpv-tests -y
sudo apt update
sudo apt install mpv -y

# xscreensaver
sudo apt-get install xscreensaver xscreensaver-gl-extra xscreensaver-data-extra xscreensaver-screensaver-bsod -y
sudo apt-get remove gnome-screensaver -y
xscreensaver -nosplash

# xscreensaver-aerial
cd /tmp
git clone git@github.com:graysky2/xscreensaver-aerial.git
cd xscreensaver-aerial
sudo cp atv4.sh /usr/lib/xscreensaver/atv4
sudo chmod +x /usr/lib/xscreensaver/atv4
sed -i '/programs:/a "ATV4" atv4 \\n\\' ~/.xscreensaver 

sudo mkdir -p /opt/ATV4
sudo chown -R $USER /opt/ATV4
cd /opt/ATV4
url="http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos"
for i in b10-1.mov b10-2.mov b10-3.mov b10-4.mov b1-1.mov b1-2.mov b1-3.mov b1-4.mov \
	b2-1.mov b2-2.mov b2-3.mov b2-4.mov b3-1.mov b3-2.mov b3-3.mov b4-1.mov b4-2.mov \
	b4-3.mov b5-1.mov b5-2.mov b5-3.mov b6-1.mov b6-2.mov b6-3.mov b6-4.mov b7-1.mov \
	b7-2.mov b7-3.mov b8-1.mov b8-2.mov b8-3.mov b9-1.mov b9-2.mov b9-3.mov \
	comp_GL_G004_C010_v03_6Mbps.mov comp_DB_D011_D009_SIGNCMP_v15_6Mbps.mov \
	comp_HK_H004_C008_v10_6Mbps.mov comp_LA_A009_C009_t9_6M_tag0.mov \
	comp_C002_C005_0818SC_001_v01_6M_HB_tag0.mov comp_GL_G010_C006_v08_6Mbps.mov \
	comp_LW_L001_C006_t9_6M_tag0.mov comp_DB_D011_C010_v10_6Mbps.mov \
	comp_LA_A005_C009_v05_t9_6M.mov comp_HK_B005_C011_t9_6M_tag0.mov \
	plate_G002_C002_BG_t9_6M_HB_tag0.mov comp_C007_C011_08244D_001_v01_6M_HB_tag0.mov \
	comp_LA_A006_C008_t9_6M_HB_tag0.mov comp_DB_D001_C001_v03_6Mbps.mov \
	comp_HK_H004_C010_4k_v01_6Mbps.mov comp_LA_A008_C004_ALT_v33_6Mbps.mov \
	comp_DB_D002_C003_t9_6M_HB_tag0.mov comp_C007_C004_0824AJ_001_v01_6M_HB_tag0.mov \
	comp_DB_D001_C005_t9_6M_HB_tag0.mov comp_HK_H004_C013_t9_6M_HB_tag0.mov \
	comp_DB_D008_C010_v04_6Mbps.mov; do
	wget "$url/$i"
	chmod 644 $(pwd)/$i
done

# remove gnome-screensaver
sudo apt-get remove gnome-screensaver

# remove screensaver keyboard shortcut
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver '""'

# add xscreensaver to Ctrl+Shift+L keyboard shortcut
SHORTCUTS=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
SHORTCUTS_COUNT=$(echo "$SHORTCUTS" | awk -F',' '{print NF}')
NEW_SHORTCUT="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$SHORTCUTS_COUNT/"
SHORTCUTS_PLUS_NEW=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | underscore process "data.concat('$NEW_SHORTCUT')" --outfmt dense)
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$SHORTCUTS_PLUS_NEW"
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$NEW_SHORTCUT" name "'xscreensaver'"
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$NEW_SHORTCUT" binding "'<Ctrl><Alt>l'"
gsettings set "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$NEW_SHORTCUT" command "'/usr/bin/xscreensaver-command -lock'"

# add xscreensaver to startup
crontab -l | { cat; echo -e "@reboot /usr/bin/xscreensaver -nosplash\n"; } | crontab -

