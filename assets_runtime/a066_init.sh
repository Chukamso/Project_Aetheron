#!/system/bin/sh
MODDIR=${0%/*}

# Set source and destination paths inside the module folder
SRC_FILE="$MODPATH/assets/a066/floating_feature.xml"
TARGET_DIR="$MODPATH/system/etc"

if [ -f "$SRC_FILE" ]; then
    

    
    #Copy
    cp "$SRC_FILE" "$TARGET_DIR/floating_feature.xml"
    
    # 4.android perms
    chmod 0644 "$TARGET_DIR/floating_feature.xml"
    chown 0:0 "$TARGET_DIR/floating_feature.xml"

else
    echo "a066_init error: Source file $SRC_FILE does not exist. "
    abort "! Installation aborted"
fi