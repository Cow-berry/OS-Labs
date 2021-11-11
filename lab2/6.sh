ps -e | tail -n+2 | awk '{print "/proc/" $1 "/stat"}' | xargs -n1 cat 2> /dev/null | awk '{print $1 " " $23}' | sort -k2 -n | tail -n1| awk '{print $1}'
