#!/bin/bash
BLUE='\033[0;34m'
NC='\033[0m'
echo -e "\n${BLUE}Installing Reflutter${NC}\n"


pip3 install reflutter --user



shell=$(ps -p $$ -oargs=)
sub='zsh'
if [[ "$shell" == *"$zsh"* ]]; then
  echo -e "\n${BLUE}Inserting Python location into the PATH and into ~/.zshrc${NC}\n"
  echo "export PATH=\"`python3 -m site --user-base`/bin:\$PATH\"" >> ~/.zshrc
  echo "export PATH=\"`python3 -m site --user-base`/bin:\$PATH\"" | zsh
  echo $PATH
else
  echo -e "\n${BLUE}Inserting Python location into the PATH and into ~/.bashrc${NC}\n"
  echo "export PATH=\"`python3 -m site --user-base`/bin:\$PATH\"" >> ~/.bashrc
  echo "export PATH=\"`python3 -m site --user-base`/bin:\$PATH\"" | bash 
  echo $PATH
fi

echo -e "\n${BLUE}Installing AntiSplit-X as a SystemAPP, dont move!${NC}\n"
echo


adb install ./utils/AntiSplit-X.apk 
adb root
adb remount
adb push ./utils/AntiSplit-X.apk /system/app/
adb shell chmod 644 /system/app/AntiSplit-X.apk 
adb reboot

echo -e "\n${BLUE}ALL DONE, SET THE PROXY IP PORT TO 8083 AND REMEMBER TO RENEW YOUR IPTABLES WITH THAT PORT. INVISIBLE PROXY IS NEEDED TOO. YOU WILL PROBABLY NEED TO CLOSE THIS TERMINAL AND OPEN ANOTHER ONE.${NC}\n"