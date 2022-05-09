# Flutter_Static_SSLUnpinning_Helper
Dummy, non-error proof, scripts to patch flutter apps with Reflutter and help with the installation and the splits (bundle) APKs. 


Preliminary TIP: read the blue output of the scripts in your terminal.

Open a terminal and go to this directory. You have two options. 

## INSTALL

- If you know what you are doing it's better to install it manually instead of using the 'install.sh' script. Go to Reflutter GitHub (https://github.com/Impact-I/reFlutter) and install it following the instructions.
- Execute 'install.sh' to install Reflutter and AntiSplit-X. Reflutter will be installed using pip3 and the script will add Python to your path so we avoid problems.
- After the installation you need to change the proxy (Burp) port to 8083 and enable invisible proxy. Don't forget to renew your IP tables and check the proxy configuration in the device (in the wifi settings) too!

## PATCH

- Put the ZIP file downloaded from Quokka to the directory zipToPatch
- Execute 'patch.sh' and follow the script. You will need to go to the device, click in the 'folder' icon, go down till you see the 'app.zip' file, select, click on merge the files, go to the script, click any key, put your proxy IP and done.

NOTE 0: If you cannot execute any of the scripts, give execution permissions or run it with bash:
        chmod +x *.sh

NOTE 1: If the file is not splited, don't worry. Youn just need the ZIP file. If it is not a ZIP file, I don't care, this is v0.001 of the script done in 20 min. Do it manually, put the APK into this directory and execute something like (from this directory):
        reflutter apk_file.apk
        java -jar ./utils/uber-apk-signer-1.2.1.jar --allowResign -a release.RE.apk 
        adb install release.RE-aligned-debugSigned.apk 

NOTE 2: If the 'refutter' command is not found, you will need to put into the path your Python binary directory. Assuming that you installed using the 'install.sh', the easiest way is to open a new terminal window and open it from there. If you don't want to do it:
        echo $SHELL
        #If the output contains zsh
        #source ~/.zshrc
        #If the output contains 'bash'
        #source ~/.bashrc
        
        
        
Thanks a lot to @Impact-I and to whoever is the Anti-SplitX developer.
