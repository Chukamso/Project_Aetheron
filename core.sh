#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
### kanger protection - alphanon
# This will make your scripts compatible even if Magisk change its mount point in the future

MODDIR=${0%/*}
MODPATH="$MODDIR"

LOG="/data/local/tmp/A06-EF.log"

sleep 25

echo "Atheron v4.9.3-t by Alphanon" >> "$LOG"
echo "Atheron v4.9.3-t by Alphanon" >> "$LOG"

echo "Started: $(date)" >> "$LOG"
echo "" >> "$LOG"

engine_function(){
#perf_sequence
echo "[atheron 4.9.3-t log starts here]" >> "$LOG"

# CPU Governors
P0="/sys/devices/system/cpu/cpufreq/policy0/scaling_governor"
P6="/sys/devices/system/cpu/cpufreq/policy6/scaling_governor"
[ -f "$P0" ] && echo "sugov_ext" > "$P0" 
[ -f "$P6" ] && echo "sugov_ext" > "$P6" 
echo "cpu_governor block = s" >> "$LOG"

sleep 2

# sugov_ext Tunables
ST="/sys/devices/system/cpu/cpufreq/sugov_ext"
[ -f "$ST/down_rate_limit_us" ] && echo "16000" > "$ST/down_rate_limit_us" 
[ -f "$ST/up_rate_limit_us" ] && echo "8800" > "$ST/up_rate_limit_us" 
echo "sampling_rate block = s" >> "$LOG"


#IO SCHED
# Detect storage type
if [ -d "/sys/block/mmcblk0" ]; then
    STORAGE="emmc"
    MAIN_BLK="mmcblk0"
elif [ -d "/sys/block/sda" ]; then
    STORAGE="ufs"
    MAIN_BLK="sda"
else
    STORAGE="emmc"
    MAIN_BLK="mmcblk0"
fi

IO="/sys/block/$MAIN_BLK/queue"

# Apply I/O scheduler configuration
if [ "$STORAGE" = "emmc" ]; then
    # Select Samsung Generic I/O Scheduler
    if [ -f "$IO/scheduler" ] && grep -qw "ssg" "$IO/scheduler"; then
        echo ssg > "$IO/scheduler"
        sleep 1
    fi

    # Generic eMMC block-queue tunables
    [ -f "$IO/nr_requests" ] && echo 64 > "$IO/nr_requests"
    [ -f "$IO/read_ahead_kb" ] && echo 128 > "$IO/read_ahead_kb"
    [ -f "$IO/max_sectors_kb" ] && echo 1024 > "$IO/max_sectors_kb"
    [ -f "$IO/rq_affinity" ] && echo 2 > "$IO/rq_affinity"
    [ -f "$IO/nomerges" ] && echo 0 > "$IO/nomerges"

    IO_SCHED="$IO/iosched"

    # Samsung Generic I/O Scheduler tunables
    [ -f "$IO_SCHED/read_expire" ] && echo 100 > "$IO_SCHED/read_expire"
    [ -f "$IO_SCHED/write_expire" ] && echo 10000 > "$IO_SCHED/write_expire"
    [ -f "$IO_SCHED/max_write_starvation" ] &&  echo 6 > "$IO_SCHED/max_write_starvation"
    [ -f "$IO_SCHED/front_merges" ] && echo 0 > "$IO_SCHED/front_merges"
    [ -f "$IO_SCHED/async_write_shallow_depth" ] &&   echo 4 > "$IO_SCHED/async_write_shallow_depth"
    [ -f "$IO_SCHED/max_async_write_rqs" ] &&   echo 4 > "$IO_SCHED/max_async_write_rqs"
    [ -f "$IO_SCHED/max_tgroup_rqs" ] &&  echo 28 > "$IO_SCHED/max_tgroup_rqs"
    [ -f "$IO_SCHED/tgroup_shallow_depth" ] &&  echo 8 > "$IO_SCHED/tgroup_shallow_depth"

    echo "Detected eMMC: A065F/M or A066F/M [64GB variant]" >> "$LOG"

else
    # UFS configuration: A066F/M 128GB variant
    [ -f "$IO/read_ahead_kb" ] && echo 256 > "$IO/read_ahead_kb"
    [ -f "$IO/rq_affinity" ] && echo 2 > "$IO/rq_affinity"
    [ -f "$IO/nomerges" ] && echo 0 > "$IO/nomerges"

    if [ -f "$IO/scheduler" ] && grep -qw "none" "$IO/scheduler"; then
        echo none > "$IO/scheduler"
    fi

    echo "Detected UFS: A066F/M [128GB variant]" >> "$LOG"
fi
#Global enhancements (Energy Aware Scheduling)
[ -f /proc/sys/kernel/sched_energy_aware ] && echo 0 > /proc/sys/kernel/sched_energy_aware
[ -f "/sys/block/mmcblk0/queue/iostats" ] && echo "0" > "/sys/block/mmcblk0/queue/iostats"
[ -f "/sys/block/mmcblk1/queue/iostats" ] && echo "0" > "/sys/block/mmcblk1/queue/iostats"
[ -f "/sys/block/sda/queue/iostats" ] && echo "0" > "/sys/block/sda/queue/iostats"


# VM (Virtual Memory) Settings
VM="/proc/sys/vm"
[ -f "$VM/extfrag_threshold" ] && echo "250" > "$VM/extfrag_threshold"
[ -f "$VM/dirty_writeback_centisecs" ] && echo "10000" > "$VM/dirty_writeback_centisecs" 
[ -f "$VM/dirty_expire_centisecs" ] && echo "1000" > "$VM/dirty_expire_centisecs"
[ -f "$VM/overcommit_ratio" ] && echo "10" > "$VM/overcommit_ratio"
[ -f "$VM/swappiness" ] && echo "120" > "$VM/swappiness"
[ -f "$VM/vfs_cache_pressure" ] && echo "100" > "$VM/vfs_cache_pressure"
[ -f "$VM/watermark_scale_factor" ] && echo "70" > "$VM/watermark_scale_factor"
[ -f "$VM/dirty_background_bytes" ] &&  echo 26214400 > "$VM/dirty_background_bytes"
[ -f "$VM/dirty_bytes" ] && echo 104857600 > "$VM/dirty_bytes"

#sysctl
sysctl -w vm.stat_interval=10
sysctl -w kernel.watchdog_thresh=10
sysctl -w kernel.nmi_watchdog=0
# OOM Adjustments
[ -f "$VM/oom_kill_allocating_task" ] && echo "0" > "$VM/oom_kill_allocating_task"
[ -f "$VM/oom_dump_tasks" ] && echo "0" > "$VM/oom_dump_tasks"
echo "iosched_block_3 = s" >> "$LOG"

echo "VM_block - ioshed_block 2 = s" >> "$LOG"



# ZRAM
for zram in /dev/block/zram*; do
  if [ -b "$zram" ]; then
    ZDEV=$(basename "$zram")
    ZP="/sys/block/$ZDEV"
    swapoff /dev/block/$ZDEV 
    echo 1 > "$ZP/reset" 
    sleep 2
    echo "2147483648" > "$ZP/disksize" 
    mkswap /dev/block/$ZDEV 
    swapon /dev/block/$ZDEV 
    echo "ZRAM block = s" >> "$LOG"
    break
  fi
done
echo "zram=2048mb" >> "$LOG"

# Disable Thermal Throttling
for thermal in /sys/class/thermal/thermal_zone*/mode; do
  [ -f "$thermal" ] && echo "disabled" > "$thermal" 
done
cmd thermalservice override-status 0 
echo "Thermald_block=s" >> "$LOG"

echo "" >> "$LOG"
# key tweaks
echo " Global key settings" >> "$LOG"
#mglru enable
echo 7 > /sys/kernel/mm/lru_gen/enabled
echo 5000 > /sys/kernel/mm/lru_gen/min_ttl_ms
# Refresh Rate
settings put system min_refresh_rate 60.0 
# Performance
settings put global low_power 0
settings put system multicore_packet_scheduler 1 
settings put global sem_enhanced_cpu_responsiveness 1 
echo 0-5 > /dev/cpuset/system-background/cpus 
echo 0-7 > /dev/cpuset/top-app/cpus 
echo 0-1 > /dev/cpuset/background/cpus 
echo 2-5 > /dev/cpuset/foreground/cpus 
echo 2-5 > /dev/cpuset/midground/cpus 
echo 0-1 > /dev/cpuset/restricted/cpus 
echo "settings, cpuset_block = s" >> "$LOG"

#rducing cpu & background apps usage
am set-max-cached-processes 10
# Loop through all (non-system) packages
for pkg12 in $(pm list packages -3 | cut -d: -f2); do
# ignore standard background runtime rquests
    cmd appops set "$pkg12" RUN_IN_BACKGROUND ignore
done
#cached appp limit
service call activity 51 i32 6
echo "cached, background apps limit = s" >> "$LOG"


sleep 10
#[ -f "$MODPATH/runtime.sh" ] && . "$MODPATH/runtime.sh" 2>> "$LOG"
#surfaceflinger priority
SF_PID=$(pidof surfaceflinger)
if [ ! -z "$SF_PID" ]; then
    chrt -f -p 75 $SF_PID 2>/dev/null
    renice -n -20 -p $SF_PID 2>/dev/null
    echo $SF_PID > /dev/cpuset/top-app/tasks 2>/dev/null
    ionice -c 2 -n 0 -p $SF_PID 2>/dev/null
fi
#SystemUI 
UI_PID=$(pidof com.android.systemui)
if [ ! -z "$UI_PID" ]; then
    chrt -f -p 60 $UI_PID 2>/dev/null
    renice -n -20 -p $UI_PID 2>/dev/null
    echo $UI_PID > /dev/cpuset/top-app/tasks 2>/dev/null
    ionice -c 2 -n 0 -p $UI_PID 2>/dev/null
fi
#One UI Home
LA_PID=$(pidof com.sec.android.app.launcher)
if [ ! -z "$LA_PID" ]; then

    renice -n -20 -p $LA_PID 2>/dev/null                    
    echo $LA_PID > /dev/cpuset/top-app/tasks 2>/dev/null    
    ionice -c 2 -n 0 -p $LA_PID 2>/dev/null                 
fi

echo "ionice-renice pid_priority_adjust= s" >> "$LOG"

# mtk mali g52mc2
echo simple_ondemand > /sys/class/devfreq/13040000.mali/governor
echo 0 > /proc/ppm/enabled
echo "gpu block = s" >> "$LOG"

#animation speed
settings put global window_animation_scale 0
settings put global transition_animation_scale 0.5
echo "animation tweak = s" >> "$LOG"


}
sleep 15
echo " [atheron 4.9.3-t log >] new phase starting or ending: $(date)" >> "$LOG"
engine_function
  ### kanger protection - alphanon


echo " [atheron 4.9.3-t log >] Ended: $(date)" >> "$LOG"
echo " [atheron 4.9.3-t log >] Ended: $(date)" >> "$LOG"
echo " [atheron 4.9.3-t log >] Ended: $(date)" >> "$LOG"
echo " [atheron 4.9.3-t log >] Ended: $(date)" >> "$LOG"
