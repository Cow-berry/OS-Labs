IFS=$'\n'
cat ~/trash.log > .log
cat .log | awk '{print substr($0, index($0, $2), length($0) - index($0, $2) + 1)}' | sed 's!.*/!!' > .names
mappings=`paste .log .names | awk -F '\t' -v name=$1 '{if ($2 == name) {print $1}}'`
for mapping in $mappings
do
    NUM=`echo $mapping | awk '{print $1}'`
    FILE=`echo $mapping | awk '{$1="";print}' | xargs`
    echo -e -n "Do you want to restore" $FILE "\ny/n: "
    read LINE
    case $LINE in
        y)
            mv ~/.trash/$NUM $FILE
            exit 0
            ;;
        *)
            echo "noed"
            continue
            ;;
    esac
done
