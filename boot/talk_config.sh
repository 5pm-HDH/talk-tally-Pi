#!/bin/bash

/boot/dietpi/func/change_hostname CAM01
cp /boot/server_env.sh /etc/profile.d/server_env.sh
cd /home/mumble
rm /home/mumble/*.pem
rm /home/mumble/*.key
rm /home/mumble/*.cert
sudo -u mumble sh /home/mumble/make-ssl.sh

mv /boot/talk_config.sh /boot/talk_config.sh.done

cp /boot/config_ws281x.json /root/tally/

systemctl enable mumble.service
#apply setting after reboot
reboot
