IFS="$\n"
psu=`ps u`
echo $psu | awk "END {print NR - 1}"
echo $psu | tail -n+2 | awk '{print $2 "\t" $11}'
