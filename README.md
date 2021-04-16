Some small quality of life patches for Main_Mister that I run locally for myself.

Changes:
* Changes 'reset player assignments' menu entry to a submenu that allows you to remap individual controllers to any player 'slot'
* Adds an 'NVRAM clear' menu entry for arcade games that have an nvram section in the MRA. Just deletes the saved nvram save file
* Add an ini file setting to disable nvram save/load entirely.
* Add mame style autofire. This uses the MiSTer scaler's frame counter as the timing source. So it may not be exactly vsync timed, but it is pretty close. As a bonus, if you set a button to 1 frame on, zero frames off, it will just act like another bound button.
  Mame style autofire is saved when settings are saved. This is per-core for now. The bound hotkey is only displayed as the raw event code.

How to use these patches:
Checkout this repo and the Main_MiSTer repo. Run scripts/patchall.sh and pass in the directory where the Mister repo is located as the first (and only) argument to the script
Compile Main_Mister and copy to your mister, /media/fat/MiSTer

This repo uses github workflows to automate patching and compiling Main_Mister. Binaries are in the 'releases' directory. Assuming there are no issues with the patches there should be a new release here within 30 minutes of an official Main_MiSTer release.

If you want to automatically update your MiSTer with this version instead of the official one, create or edit the file /media/fat/Scripts/update.ini and add these lines to it:
```
SCRIPT_URL="https://github.com/zakk4223/Updater_script_MiSTer/blob/main_update/mister_updater.sh"
MAIN_MISTER_URL="https://github.com/zakk4223/Main_MiSTer_ZQol"
CORE_CATEGORIES_LAST_SUCCESSFUL_RUN_FILTER="Main_Mister_ZQol"
```
Note this uses a slightly modified version of the mister_updater.sh script that allows for updating the Main_Mister binary from another URL besides the official one.

If you are using the update_all.sh script, create the file /media/fat/Scripts/update_all.ini and add this line (you still need to modify the update.ini file above):

```MISTER_DEVEL_UPDATER_URL="https://raw.githubusercontent.com/zakk4223/Updater_script_MiSTer/main_update/mister_updater.sh"```

I make no promises I won't break things horribly, but my intent is to only have small 'nice to have' patches here, no large reworks of existing Mister functionality (I lied, the autofire patch is probably not 'small').


