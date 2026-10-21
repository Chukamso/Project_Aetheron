#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future

MODDIR=${0%/*}
MODPATH="$MODDIR"

LOG="/data/local/tmp/A06-EF.log"
[ -f "$MODPATH/debloat.sh" ] && . "$MODPATH/debloat.sh" 2>> "$LOG"
[ -f "$MODPATH/core.sh" ] && . "$MODPATH/core.sh" 2>> "$LOG"
[ -f "$MODPATH/assets_runtime/bugfix.sh" ] && . "$MODPATH/assets_runtime/bugfix.sh" 2>> "$LOG"
echo "serviced report [sub scripts init successful]" >> "$LOG"



