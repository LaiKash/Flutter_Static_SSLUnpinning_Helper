#!/bin/bash
BLUE='\033[0;34m'
NC='\033[0m'
echo -e "\n${BLUE}Pushing the zip file in zipToPatch to /storage/self/primary/app.zip${NC}\n"
adb push ./zipToPatch/*.zip /storage/self/primary/app.zip
echo -e "\n${BLUE}Go to your device and select the app.zip and click in MERGE FILE${NC}"
adb shell monkey -p botX.arscmerge  -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1
read -n 1 -r -s -p $'\e[34mPress any key to continue when the merge is done (wait till Completed successfully)\e[0m'
adb pull /storage/self/primary/app_apks_signed.apk
reflutter app_apks_signed.apk
java -jar ./utils/uber-apk-signer-1.2.1.jar --allowResign -a release.RE.apk 
mv release.RE-aligned-debugSigned.apk ./output/release.RE-aligned-debugSigned.apk
adb install ./output/release.RE-aligned-debugSigned.apk 
rm -rf *.apk
rm -rf ./zipToPatch/*.zip
echo -e "\n${BLUE} Deleted all files except the one in the output directory. \n ALL DONE AND INSTALLED${NC}\n"
