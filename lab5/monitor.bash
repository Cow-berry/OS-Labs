echo > res_monitor
while true
do
    mem=$(grep MemFree /proc/meminfo | awk '{print $2}')
    swap=$(grep SwapFree /proc/meminfo | awk '{print $2}')
    time=$(date +"%T")
    echo $time" "$mem" "$swap >> res_monitor
    sleep 1 
done
