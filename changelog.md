
### 4.7.2
* changelog now takes notes
* change lower res option from 620x1377 to 608x1352
* Swicth to MMT extended framework - certain media files require advanced framework to actually be replaced and to improve uninstall.sh's flexibily.
* Somewhat minor changes to system.prop - Trimmed useless or null touch parameters, edited some parameters to improve touch   responsiveness.
* Cosmetic changes to customise.sh ui_print.
* New script section in service.sh to handle GMS's CPU and RAM deprioitization.
* added placeholder update.json file for future use.

### 4.8
* polished customise.sh even further
* removed some apps from debloat list entirely.
* moved part of the debloat section to customise.sh to prevent user preferred bloatware from getting nuked at every boot/reboot.
* massive changes in debloat section still ongoing
* implemented waklocking of GMS to bridge gap between Atheron and Frosty or other production grade gms doze modules.
* rewrote some code to add more legibility for myself, so .sh got bigger.
* setting up online updating systems.
* edited performance script to favour more aggresive zram usage massively affecting multitasking positively. (new performance engine)
* new module description.
* fix performance engine not running at all on some devices due to new MMT structure.

### 4.8.1
* fixed bug where messages and calls got broken on some carriers [indonesian Telkomsel] (rebloat Crane+ package; requires uninstall of current 4.8.1, not just update)
* attempt to add circle to search functionality.

### 4.8.2
* removed circle to search stuff, (moved to project atheron delta - beta)
* renamed this module from "atheron lite" to "Atheron tiny"
* Improved performance here and there.
* Reverted to using a tweaked version of "mq-dealine" io scheduler instead of samsung's ssg.
* added more audio files, ringtiones and changed UI sounds.
* added new build.prop entries, supposed to increase performance too.
* minor improvements to the performance engine (remove accesibiltiy inference on custom tap and hold delay) used build.prop modifcation instead.
* seperates the debloating script from the performance engine for legibilty. cleaned up code that required me to rewrite entire code chunk twice with a simpler function.
* fixed bug of display assistant crashing.
* fixed the issues on some devices where google sign in sessions/ google sign in stuff didnt work at all. didnt work at all.
* added banner.jpeg for root managers that supports it. (Suki-su, MMRL and Ksu-next)
* changed debloat policy of apps from "uninstall" to "disable" for stability.

### 4.9-t
* System.prop edits to include copytright,GPL 3.0 and more entries.
* Minor edits to service.sh's kernel-vm blocks
* Added more apps to bloatware list
* Reverted debloat policy back to [uninstall ---user 0]
* Added Samsung's memory guardian app to modules app payload.
* Refined atheron's customise.sh ; the install menu.

### 4.9.1-t
* zram reduced to 2048mb.
* minor eits to performance engine
* added magisk partition level debloating for extremely stubborn apps like KLMS (knox version of kill urself) and Game optimising service.
* disable jank monitoring system/deamon of surfacflinger and system-server

### 4.9.2-t
* improved performance
* removed build.prop bloat
* edited licenses
* disables global apk signature verification partially (ASKS), You can update system apps directly with apk files.

### 5.0

# NEW : Added special lockscreen fonts desinged to mimic the lockscreen of IOS and Oxygen OS.
# NEW : Added four new screensavers from the Google pixel.
* decrease cpu governor sampling rate to match 16.6ms of display refresh rate and save battery and decrease overheating even further.
* remove certain smooth scroll flags {its implimentation defies the philosophy behind this module}
* fixed bug of lower sensitivty on the touch.
* New performance framework, all performance related entries moved to core.sh, service.sh now serves as a caller script. - this is just a framework rearrangement  not a performance improvement
* removed dalvik tweaks from sytem prop
* increased core.sh init time to fix bug of mglru not activating
* Merged a06 4g and 5g module framework into one module. (Eliminating the need for 2 seperate packages and helping 5g variants get the same development effort as the 4g variant)
* new installer menu with emojis
* Polished the installation menu to a massive extent.
* You can now control Atheron's install sequence with ur touch screen by tapping or not tapping, useful for old a06 units with fucked buttons.
* renamed module from "Tiny Atheron" to "Atheron Blitz".
* removed ability to lower screen resolution of the a06, doesnt look so pleaseant and does not help much in CPU intensive games/rendering.
* polished buggy features found in 4.9


### 5.0 r2

# PERFORMANCE ENGINE OVERHAUL : I have reached the maximum possible performance improvement i can for see in regards a06 (4g), reaching a random access read speed of 100mb/s on an a06 without ram buffering or having a 99% performance stability is no joke, also the performance deficit/instability that plagued the 4.x version have been neutralized.
* fixed customise.sh bug where setup init would fail.
* removed invisible non ascii characters that would cause issues in my scripts - (i have no idea how there got there).
* polished atheron 5 even further.

### 5.0.1 [BGF]
* fixed bug where aetheron placed the kernel read proirity in ssg io scheduler too high, causing applications that are reading massive files (1gb+) to misbehave or crash.
* renamed module from `atheron` to `aetheron` , because somebody pronounced it as "ahh-theron" instead of air-theron so the rename was neccesary to keep things relevant.


# LICENSE
* Subject to the special conditions above, this Project Atheron is otherwise distributed under the terms of the Creative Commons Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0) License.



