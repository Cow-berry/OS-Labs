ps -e | awk '$5 ~ /^\/sbin\// {print $1}' > sbin_pids.txt
