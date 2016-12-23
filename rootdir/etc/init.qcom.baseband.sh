#!/system/bin/sh

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

bbfile="/data/.baseband"
if [ ! -f ${bbfile} ]
then
  echo `strings /dev/block/mmcblk0p12 | grep -e "-V10.-" -e "-V20.-" | head -1` > ${bbfile}
fi
setprop gsm.version.baseband `cat ${bbfile}`
