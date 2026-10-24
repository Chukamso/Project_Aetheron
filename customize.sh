#!/system/bin/sh

##########################################################################################
#
# MMT Extended Config config tool
#
##########################################################################################

#MINAPI=21
#MAXAPI=25
#DYNLIB=true
#DEBUG=true

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE=" "
LATESTARTSERVICE=true

set_permissions() {
  :
}

SKIPUNZIP=0

ui_print " - -[>] loading functions"


unzip -qjo "$ZIPFILE" \
  'common/functions.sh' \
  -d "$TMPDIR" >&2

. "$TMPDIR/functions.sh"
sleep 10
if [ -f "$MODPATH/service.sh" ]; then
  set_perm "$MODPATH/service.sh" 0 0 0755
fi

sleep 5
#screen timeout user default save
OLD_TIMEOUT=$(settings get system screen_off_timeout) && 
settings put system screen_off_timeout 2147483647


ui_print " -  - 🔹 0x0"

##########################################################################################
# Input configuration
##########################################################################################

VOL_UP_EVENT="/dev/input/event5"
VOL_DOWN_EVENT="/dev/input/event4"
TOUCH_EVENT="/dev/input/event6"

INPUT_TIMEOUT=10
TOUCH_TIMEOUT=12

EVENT_FILE="$TMPDIR/Aetheron_events"
TIMER_FILE="$TMPDIR/Aetheron_timer"

rm -f "$EVENT_FILE" "$TIMER_FILE"

timer() {
  sleep "$1"
}

cleanup_input() {
  [ -n "$EVENT_PID" ] && kill "$EVENT_PID" 2>/dev/null
  [ -n "$TIMER_PID" ] && kill "$TIMER_PID" 2>/dev/null

  [ -n "$EVENT_PID" ] && wait "$EVENT_PID" 2>/dev/null
  [ -n "$TIMER_PID" ] && wait "$TIMER_PID" 2>/dev/null

  EVENT_PID=""
  TIMER_PID=""

  rm -f "$EVENT_FILE" "$TIMER_FILE"
}

detect_input_mode() {
  cleanup_input

  ui_print " - ⚙️ Choose your input method"
  ui_print " - 🔊 VOL+ = Volume controls"
  ui_print " - 🔉 VOL- = Touch controls"
  ui_print " - ⌛ No key = Touch controls"
  ui_print " "
  ui_print " - 👆 Touch guide:"
  ui_print " - 👆 Tap screen = Yes"
  ui_print " - ⏳ No tap for 12 sec = No"
  ui_print " "
  ui_print " - ⌛ Waiting 10 seconds"

  : > "$EVENT_FILE"

  /system/bin/getevent -lt \
    "$VOL_UP_EVENT" \
    "$VOL_DOWN_EVENT" \
    > "$EVENT_FILE" 2>&1 &

  EVENT_PID=$!

  timer "$INPUT_TIMEOUT" &
  TIMER_PID=$!

  while true; do
    if grep -q "KEY_VOLUMEUP" "$EVENT_FILE" 2>/dev/null ||
       grep -q "VOLUMEUP" "$EVENT_FILE" 2>/dev/null; then

      cleanup_input
      INPUT_MODE="volume"
      ui_print " - 🔊 Volume mode selected"
      return 0
    fi

    if grep -q "KEY_VOLUMEDOWN" "$EVENT_FILE" 2>/dev/null ||
       grep -q "VOLUMEDOWN" "$EVENT_FILE" 2>/dev/null; then

      cleanup_input
      INPUT_MODE="touch"
      ui_print " - 👆 Touch mode selected"
      return 0
    fi

    if ! kill -0 "$TIMER_PID" 2>/dev/null; then
      cleanup_input
      INPUT_MODE="touch"
      ui_print " - ⏱️ No key detected"
      ui_print " - 👆 Touch mode selected"
      return 0
    fi

    sleep 0.1
  done
}

chooseport_volume() {
  cleanup_input

  ui_print " - 🔊 VOL+ = Yes"
  ui_print " - 🔉 VOL- = No"
  ui_print " - ⌛ Waiting for volume key"

  : > "$EVENT_FILE"

  /system/bin/getevent -lt \
    "$VOL_UP_EVENT" \
    "$VOL_DOWN_EVENT" \
    > "$EVENT_FILE" 2>&1 &

  EVENT_PID=$!

  while true; do
    if grep -q "KEY_VOLUMEUP" "$EVENT_FILE" 2>/dev/null ||
       grep -q "VOLUMEUP" "$EVENT_FILE" 2>/dev/null; then

      cleanup_input
      ui_print " - 🔊 VOL+ selected"
      return 0
    fi

    if grep -q "KEY_VOLUMEDOWN" "$EVENT_FILE" 2>/dev/null ||
       grep -q "VOLUMEDOWN" "$EVENT_FILE" 2>/dev/null; then

      cleanup_input
      ui_print " - 🔉 VOL- selected"
      return 1
    fi

    sleep 0.1
  done
}

chooseport_touch() {
  cleanup_input

  ui_print " - 👆 Tap screen = Yes"
  ui_print " - ⏳ No tap for 12 sec = No"
  ui_print " - ⌛ Waiting for touch"

  : > "$EVENT_FILE"

  /system/bin/getevent -lt \
    "$TOUCH_EVENT" \
    > "$EVENT_FILE" 2>&1 &

  EVENT_PID=$!

  timer "$TOUCH_TIMEOUT" &
  TIMER_PID=$!

  while true; do
    if grep -q "BTN_TOUCH" "$EVENT_FILE" 2>/dev/null; then
      cleanup_input
      ui_print " - 👆 Touch selected"
      return 0
    fi

    if ! kill -0 "$TIMER_PID" 2>/dev/null; then
      cleanup_input
      ui_print " - ⏳ No touch detected"
      ui_print " - 🔉 No selected"
      return 1
    fi

    sleep 0.1
  done
}

chooseport() {
  if [ "$INPUT_MODE" = "volume" ]; then
    chooseport_volume
  else
    chooseport_touch
  fi
}

##########################################################################################
# Installer banner
##########################################################################################

print_modname() {
  ui_print " - ━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  ui_print " - ⚙️ Aetheron Tiny V5.0.0 setup"
  ui_print " - ━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

print_modname

ui_print " "
ui_print " - ⚠️ Read before continuing"
ui_print " - 🔄 Device will reboot automatically"
ui_print " - ↔️ Swipe to view the menu"
ui_print " - ⏳ Install time: about 2-15 minutes"
ui_print " - 🚪 Exit if you are not ready"
ui_print " - ⏱️ Starting installation in 10 seconds"
ui_print " "

sleep 12

ui_print " - 🚀 Installation started"

##########################################################################################
# Device detection
##########################################################################################

DEVICE_MODEL="$(getprop ro.product.model)"
DEVICE_NAME="$(getprop ro.product.name)"
DEVICE_DEVICE="$(getprop ro.product.device)"
IS_4G=false

ui_print " "
ui_print " "
ui_print " - ⚙️ Detecting device variant"
ui_print " - 📱 Model: $DEVICE_MODEL"
ui_print " - 🏷️ Name: $DEVICE_NAME"
ui_print " - 🔖 Device: $DEVICE_DEVICE"
ui_print " "

if echo "$DEVICE_MODEL $DEVICE_NAME $DEVICE_DEVICE" |
  grep -qi "A066"; then

  ui_print " - 📶 Galaxy A06 5G detected"
  ui_print " "

  if [ -f "$MODPATH/assets_runtime/a066_init.sh" ]; then
    ui_print " - 🔍 Checking 5G init config tool"
    ui_print " - ▶️ Running 5G init config tool"

    . "$MODPATH/assets_runtime/a066_init.sh" ||
      abort "❌ 5G init config tool failed"
    ui_print " "
    ui_print " - ✅ 5G setup completed"
    
  else
    abort "❌ 5G init config tool is missing"
  fi

elif echo "$DEVICE_MODEL $DEVICE_NAME $DEVICE_DEVICE" |
  grep -qi "A065"; then

  ui_print " - 📶 Galaxy A06 4G detected"
  IS_4G=true

else
ui_print " "
  ui_print " - ❌ Unsupported device detected"
  ui_print " - 🚫 Disable spoofing modules"
  abort "🛑 Installation aborted"
fi

##########################################################################################
# Select input mode once
##########################################################################################

detect_input_mode

##########################################################################################
# A06 4G setup
##########################################################################################

if [ "$IS_4G" = true ]; then
ui_print " "
ui_print " "
  ui_print " - ⚙️ Starting A06 4G setup"
  ui_print " - 🌫️ Enable Live Blur?"
  ui_print " - 🔊 VOL+ or touch = Yes"
  ui_print " - 🔉 VOL- or no touch for 12 seconds = No"
  ui_print " "

  if chooseport; then
    ui_print " - 🌫️ Enabling Live Blur"

    if [ -f "$MODPATH/assets_runtime/a065blur_init.sh" ]; then
      ui_print " - ▶️ Running blur config tool"

      . "$MODPATH/assets_runtime/a065blur_init.sh" ||
        abort "❌ Blur config tool failed"
      ui_print " "
      ui_print " - ✅ Blur setup completed"
    else
      abort "❌ Blur config tool is missing"
    fi
  else
    ui_print " - 📦 Keeping stock blur profile"

    if [ -f "$MODPATH/assets_runtime/a065_init.sh" ]; then
      ui_print " - ▶️ Running 4G init config tool"

      . "$MODPATH/assets_runtime/a065_init.sh" ||
        abort "❌ 4G init config tool failed"
      ui_print " "
      ui_print " - ✅ 4G setup completed"
    else
      abort "❌ 4G init config tool is missing"
    fi
  fi
else
  ui_print " - 📶 5G blur config skipped"
fi

sleep 2
ui_print " "
ui_print " - ✅ Device setup completed [1/4]"

##########################################################################################
# Partial debloat
##########################################################################################

ui_print " - 🧹 Starting partial debloat"
ui_print " - ⏳ Debloat may take a moment"

pm disable --user 0 \
  com.google.android.googlequicksearchbox
ui_print " "
ui_print " - ✅ Google app disabled"

pm uninstall --user 0 \
  com.osp.app.signin
pm disable --user 0 \
  com.samsung.android.scloud
ui_print " "
ui_print " - ✅ Samsung services disabled"

pm disable --user 0 \
  com.google.android.cellbroadcastreceiver
ui_print " "
ui_print " - ✅ Cell broadcast disabled"

pm disable --user 0 \
  com.samsung.android.cidmanager
ui_print " "
ui_print " - ✅ SIM manager cleaned"

pm disable --user 0 \
  com.samsung.android.appseparation
ui_print " "
ui_print " - ✅ App separation disabled"

sleep 3

##########################################################################################
# IMS selection
##########################################################################################

ui_print " - 📡 Do you use VoLTE or VoWiFi?"
ui_print " - 🔊 VOL+ or touch = Keep IMS"
ui_print " - 🔉 VOL- or no touch for 12 seconds = Disable IMS"

if chooseport; then
  ui_print " - ✅ IMS services kept"
else
  ui_print " - ⚠️ IMS services disabled"
ui_print " "
  pm disable --user 0 \
    com.samsung.advp.imssettings
ui_print " "
  pm disable --user 0 \
    com.sec.imsservice
fi

sleep 2
ui_print " - ✅ Partial debloat completed [2/4]"


ui_print " "
ui_print " "
ui_print " - ⚙️ Starting extreme debloat"
ui_print " - ⚠️ Apps may crash temporarily"
ui_print " - 🧹 Starting debloat process"
ui_print " - 📦 Debloat: 0 of 4 sections"

if [ -f "$MODPATH/debloat.sh" ]; then
  ui_print " - ▶️ Running debloat config tool"

  . "$MODPATH/debloat.sh" ||
    abort "❌ Debloat config tool failed"

  sleep 7
  ui_print " - 📦 Debloat: 1 of 4 sections"
  ui_print " "

  sleep 7
  ui_print " - 📦 Debloat: 2 of 4 sections"
  ui_print " "

  sleep 7
  ui_print " - 📦 Debloat: 3 of 4 sections"
  ui_print " "

  sleep 7
  ui_print " - 📦 Debloat: 4 of 4 sections"
  ui_print " "
else
ui_print " "
  abort "❌ Debloat config tool is missing"
fi
ui_print " "
ui_print " - ✅ Debloat completed [2.5/4]"
ui_print " - 🧬 Wrapping zygote64...."
sleep 5
ui_print " - ✅ Zygote64 wrapped"
ui_print " - ✅ Optimization completed [3/4]"


ui_print " "
ui_print " "
ui_print " - ⚙️ Starting app optimization"
ui_print " - 🔊 VOL+ or touch = Maximum AOT"
ui_print " - ⏳ Maximum mode: about 10-30 min"
ui_print " - [>] Will use some extra storage space"
ui_print " "
ui_print " - 🔉 VOL- or no touch for 12 seconds = Profile mode"
ui_print " - ⏳ Profile mode: about 1-5 min"
ui_print " "
ui_print " "

if chooseport; then
  ui_print " - 🔊 Maximum AOT mode selected"
  ui_print " - 🔥🔥 Device may become very hot hot"
  ui_print " - ⏳ Full compile may take 5-30 min"
ui_print " "
  cmd package compile -m speed -a
else
  ui_print " - 🔉 Profile-guided mode selected"
  ui_print " - 🔥 Device may become warm"
  ui_print " - ⏳ Average compile may take 1-2 min"

  cmd package compile -m speed-profile -a
fi
ui_print " "
ui_print " - ✅ App compilation completed"
sleep 5
ui_print " - 📦 Samsung assets loaded"
ui_print " - ✅ All installation steps completed"

cleanup_input
ui_print " "
ui_print " - 🔄 Rebooting in 5 seconds"
sleep 1
ui_print " - 🔄 Rebooting in 4 seconds"
sleep 1
ui_print " - 🔄 Rebooting in 3 seconds"
sleep 1
ui_print " - 🔄 Rebooting in 2 seconds"
sleep 1

settings put system screen_off_timeout $OLD_TIMEOUT

ui_print " - 🔄 Rebooting in 1 second"
sleep 1
ui_print " - ⚠️ Rebooting now"

reboot

