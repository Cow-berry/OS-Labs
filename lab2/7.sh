IFS="$\n"
psx=`ps x`
beforemem=`echo $psx | tail -n+2 | awk '{print "/proc/" $1 "/status\n/proc/" $1 "/io"}' | xargs -n2 cat 2> /dev/null | grep -w "Pid\|read_bytes"  | grep -Pzo 'Pid.*\nread_bytes.*' | tr 'P' '\n' | awk "NF" | awk '{print $2}' | tr '\n' ' ' | xargs -n2 2> /dev/null | sort -k1`
beforecmd=`echo $psx | awk '{print $1 " " $5}' | sort -k1`
before=`join -j 1 <(echo $beforemem) <(echo $beforecmd) 2> /dev/null`
sleep 10s
psx=`ps x`
aftermem=`echo $psx | tail -n+2 | awk '{print "/proc/" $1 "/status\n/proc/" $1 "/io"}' | xargs -n2 cat 2> /dev/null | grep -w "Pid\|read_bytes"  | grep -Pzo 'Pid.*\nread_bytes.*' | tr 'P' '\n' | awk "NF" | awk '{print $2}' | tr '\n' ' ' | xargs -n2 2> /dev/null | sort -k1`
aftercmd=`echo $psx | awk '{print $1 " " $5}' 2> /dev/null | sort -k1`
after=`join -j 1 <(echo $aftermem) <(echo $aftercmd) 2> /dev/null`
join -j 1 <(echo $before) <(echo $after) | awk '{print $1 " : " $3 " : " $4-$2}' | sort -k5 -n | tail -n3

