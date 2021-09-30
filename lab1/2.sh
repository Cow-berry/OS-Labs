acc=""

while true
do 
    read TMP
    if [[ $TMP == "q" ]]
    then break
    fi
    acc+=$TMP
done
echo $acc
