#!/system/bin/sh
sleep 30
#Layer 1: 10s

sleep 10
ALL_PACKAGES=$(pm list packages -s | cut -d: -f2)
for pkg in $ALL_PACKAGES; do
    cmd package install-existing "$pkg" >/dev/null 2>&1
done

# rebloat cycle finished in 80 seconds.

#bug_fixes
pm enable com.google.android.gms
pm enable com.google.android.gms/.measurement.AppMeasurementJobService
pm enable com.google.android.gms/.tron.CollectionService
pm enable com.google.android.gms/.measurement.service.MeasurementBrokerService
pm enable com.google.android.gms/.dtdi.lifecycle.LifecycleService
pm enable com.google.android.gms/.fitness.sync.FitnessSyncAdapterService
pm enable com.google.android.gms/.location.reporting.service.ReportingSyncService

#Clean up  log files
[ -f "/data/local/tmp/A06-EF.log" ] && rm -f "/data/local/tmp/A06-EF.log"
[ -f "/data/local/tmp/.tweaks_applied" ] && rm -f "/data/local/tmp/.tweaks_applied"

#mmt framework [do not tamper]
if [ -f $INFO ]; then
  while read LINE; do
    if [ "$(echo -n $LINE | tail -c 1)" == "~" ]; then
      continue
    elif [ -f "$LINE~" ]; then
      mv -f $LINE~ $LINE
    else
      rm -f $LINE
      while true; do
        LINE=$(dirname $LINE)
        [ "$(ls -A $LINE 2>/dev/null)" ] && break 1 || rm -rf $LINE
      done
    fi
  done < $INFO
  rm -f $INFO
fi