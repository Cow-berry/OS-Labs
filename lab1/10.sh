echo "$(man bash)" | tr ' ' '\n' |sort | sed '/^$/d' | grep -vwE '\w{1,3}' | uniq -c | sort -k1,1nr | head -n3
